package alert

import org.springframework.dao.DataIntegrityViolationException


class AlertController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def alertManagerService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		alertManagerService.updateAlerts()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [alertInstanceList: Alert.list(params), alertInstanceTotal: Alert.count()]
    }

}
