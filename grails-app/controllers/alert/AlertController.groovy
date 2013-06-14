package alert

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.servlet.support.RequestContextUtils


import org.springframework.transaction.annotation.Transactional


@Transactional
class AlertController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def alertManagerService
	def alertExportService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		alertManagerService.checkAllAlerts()
		alertManagerService.generateAllAlerts()
        params.max = Math.min(params.max ? params.int('max') : 200, 1000)		
		params.sort = params.sort?: 'attentionDate'
		params.sort = params.sort?: 'asc'
		
        [alertInstanceList: alertManagerService.getActiveAlerts(params), alertInstanceTotal: alertManagerService.getActiveAlerts().size()]
    }
	
	def listInspected() {
		alertManagerService.checkAllAlerts()
		alertManagerService.generateAllAlerts()
		params.max = Math.min(params.max ? params.int('max') : 200, 1000)
		params.sort = params.sort?: 'attentionDate'
		params.sort = params.sort?: 'asc'
	
		render(view: "list", model: [alertInstanceList: alertManagerService.getInspectedAlerts(params), alertInstanceTotal: alertManagerService.getInspectedAlerts().size()])	
	}
	
	def query() {
		
	}
	
	def export() {
		alertManagerService.checkAllAlerts()
		alertManagerService.generateAllAlerts()
		Date fromDate = Date.parse('dd/MM/yyyy',params.fromDate)
		Date toDate = Date.parse('dd/MM/yyyy',params.toDate)
		boolean pendingOnly = params.pendingOnly
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'alert.label')}.${params.extension}")
		alertExportService.exportAlert(params.format,response.outputStream,RequestContextUtils.getLocale(request),fromDate,toDate,pendingOnly)
	}
	
	def inspected(){
		alertManagerService.checkAllAlerts()
		alertManagerService.generateAllAlerts()
		def alertInstance = Alert.get(params.id)
		if (!alertInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alert.label', default: 'Alert'), params.id])
			redirect(action: "list")
			return
		}
		alertInstance.inspected()
		flash.message = message(code: 'alert.inspected.label')
		redirect(action: "list")
		
	}

}
