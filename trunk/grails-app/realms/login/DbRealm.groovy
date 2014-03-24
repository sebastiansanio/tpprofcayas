package login

import org.apache.shiro.authc.AccountException
import org.apache.shiro.authc.IncorrectCredentialsException
import org.apache.shiro.authc.UnknownAccountException
import org.apache.shiro.authc.SimpleAccount
import org.apache.shiro.authz.permission.WildcardPermission

class DbRealm {
    static authTokenClass = org.apache.shiro.authc.UsernamePasswordToken

    def credentialMatcher
    def shiroPermissionResolver
	def grailsApplication

    def authenticate(authToken) {
		int maxLoginAttempts = grailsApplication.config.login.attempts.max
		
        log.info "Attempting to authenticate ${authToken.username} in DB realm..."
        def username = authToken.username

        // Null username is invalid
        if (username == null) {
            throw new AccountException("Null usernames are not allowed by this realm.")
        }

        // Get the user with the given username. If the user is not
        // found, then they don't have an account and we throw an
        // exception.
        def user = User.findByUsername(username)
        if (!user) {
            throw new UnknownAccountException("No account found for user [${username}]")
        }
		
		if(user.blocked){
			throw new AccountException("User blocked: "+user.toString())
		}

        log.info "Found user '${user.username}' in DB"

        // Now check the user's password against the hashed value stored
        // in the database.
        def account = new SimpleAccount(username, user.passwordHash, "DbRealm")
        if (!credentialMatcher.doCredentialsMatch(authToken, account)) {
            log.info "Invalid password (DB realm)"
			User.withTransaction{			
				user.loginAttempts = user.loginAttempts + 1
				if(user.loginAttempts>=maxLoginAttempts){
					user.loginAttempts = 0
					user.blocked = true
				}
				user.save(flush:true)
            }
            throw new IncorrectCredentialsException("Invalid password for user '${username}'")
        }
		
		if(user.loginAttempts!=0){
			User.withTransaction{			
				user.loginAttempts = 0
				user.save(flush:true)
            }
		}

        return account
    }

    def hasRole(principal, roleName) {
        def roles = User.withCriteria {
            roles {
                eq("name", roleName)
            }
            eq("username", principal)
        }

        return roles.size() > 0
    }

    def hasAllRoles(principal, roles) {
        def r = User.withCriteria {
            roles {
                'in'("name", roles)
            }
            eq("username", principal)
        }

        return r.size() == roles.size()
    }

    def isPermitted(principal, requiredPermission) {
        // Does the user have the given permission directly associated
        // with himself?
        //
        // First find all the permissions that the user has that match
        // the required permission's type and project code.
        def user = User.findByUsername(principal)
        def permissions = user.permissions

        // Try each of the permissions found and see whether any of
        // them confer the required permission.
        def retval = permissions?.find { permString ->
            // Create a real permission instance from the database
            // permission.
            def perm = shiroPermissionResolver.resolvePermission(permString)

            // Now check whether this permission implies the required
            // one.
            if (perm.implies(requiredPermission)) {
                // User has the permission!
                return true
            }
            else {
                return false
            }
        }

        if (retval != null) {
            // Found a matching permission!
            return true
        }

        // If not, does he gain it through a role?
        //
        // Get the permissions from the roles that the user does have.
        def results = User.executeQuery("select distinct p from User as user join user.roles as role join role.permissions as p where user.username = '$principal'")

        // There may be some duplicate entries in the results, but
        // at this stage it is not worth trying to remove them. Now,
        // create a real permission from each result and check it
        // against the required one.
        retval = results.find { permString ->
            // Create a real permission instance from the database
            // permission.
            def perm = shiroPermissionResolver.resolvePermission(permString)

            // Now check whether this permission implies the required
            // one.
            if (perm.implies(requiredPermission)) {
                // User has the permission!
                return true
            }
            else {
                return false
            }
        }

        if (retval != null) {
            // Found a matching permission!
            return true
        }
        else {
            return false
        }
    }
}
