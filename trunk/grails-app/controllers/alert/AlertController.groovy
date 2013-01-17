package alert

import org.springframework.dao.DataIntegrityViolationException


class AlertController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def alertManagerService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		alertManagerService.checkAllAlerts()
		alertManagerService.generateAllAlerts()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if(params.sort==null) 
			params.sort = "deadline"
		if(params.order==null)
			params.order = "asc"
		
        [alertInstanceList: alertManagerService.getActiveAlerts(params), alertInstanceTotal: alertManagerService.getActiveAlerts().size()]
    }

}
