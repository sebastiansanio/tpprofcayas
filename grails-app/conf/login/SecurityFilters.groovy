package login

import org.apache.shiro.SecurityUtils


class SecurityFilters {
    def filters = {
        all(uri: "/**") {
            before = {

                if (!controllerName || controllerName=='home' || (controllerName=='main' && SecurityUtils.subject.principal!=null)) 
					return true

                accessControl()
            }
        }
    }
}
