import org.apache.shiro.crypto.hash.Sha256Hash
import login.*

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:"cayas", passwordHash: new Sha256Hash("cayas").toHex())
		user.addToPermissions("*:*")
		user.save()
    }
    def destroy = {
    }
}
