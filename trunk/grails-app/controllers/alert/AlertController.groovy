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
			params.sort = "attentionDate"
		if(params.order==null)
			params.order = "asc"
		
        [alertInstanceList: alertManagerService.getActiveAlerts(params), alertInstanceTotal: alertManagerService.getActiveAlerts().size()]
    }
	
	def listInspected() {
		alertManagerService.checkAllAlerts()
		alertManagerService.generateAllAlerts()
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if(params.sort==null)
			params.sort = "attentionDate"
		if(params.order==null)
			params.order = "asc"
		
		render(view: "list", model: [alertInstanceList: alertManagerService.getInspectedAlerts(params), alertInstanceTotal: alertManagerService.getInspectedAlerts().size()])	
	}
	
	def query() {
		
	}
		
	
	def inspected(){
		def alertInstance = Alert.get(params.id)
		if (!alertInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alert.label', default: 'Alert'), params.id])
			redirect(action: "list")
			return
		}
		
		System.out.println(alertInstance.isInspected())
		alertInstance.inspected()
		flash.message = message(code: 'alert.inspected.label')
		redirect(action: "list")
		
	}

}
