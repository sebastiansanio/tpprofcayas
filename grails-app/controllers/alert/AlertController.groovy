package alert

import java.text.DateFormat;
import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.servlet.support.RequestContextUtils


class AlertController {

	private static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")
	
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def alertManagerService
	def alertExportService
	
    def index() {
        redirect(action: "list", params: params)
    }
	
	def refresh(){
		[:]
	}
	
	def doRefresh(){
		try{
			alertManagerService.checkAllAlerts()
			alertManagerService.generateAllAlerts()
			flash.message = message(code:'default.refresh.ok.label')
		}catch(Exception e){
			flash.message = message(code:'default.refresh.error.label')+': '+e.getMessage()
		}
		redirect(action: "refresh",params:params)
		
	}

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 200, 1000)		
		params.sort = params.sort?: 'attentionDate'
		params.sort = params.sort?: 'asc'
		
        [alertInstanceList: alertManagerService.getActiveAlerts(params), alertInstanceTotal: alertManagerService.getActiveAlerts().size()]
    }
	
	def listInspected() {
		params.max = Math.min(params.max ? params.int('max') : 200, 1000)
		params.sort = params.sort?: 'attentionDate'
		params.sort = params.sort?: 'asc'
	
		render(view: "list", model: [alertInstanceList: alertManagerService.getInspectedAlerts(params), alertInstanceTotal: alertManagerService.getInspectedAlerts().size()])	
	}
	
	def query() {
		
	}
	
	def export() {
		Date fromDate = Date.parse('dd/MM/yyyy',params.fromDate)
		Date toDate = Date.parse('dd/MM/yyyy',params.toDate)
		boolean pendingOnly = params.pendingOnly
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'alerts.label')} "+DATE_FORMAT.format(new Date())+".${params.extension}")
		alertExportService.exportAlert(params.format,response.outputStream,RequestContextUtils.getLocale(request),fromDate,toDate,pendingOnly)
	}
	
	def inspected(){
		def alertInstance = Alert.get(params.id)
		if (!alertInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alert.label', default: 'Alert'), params.id])
			redirect(action: "list")
			return
		}
		Alert.withTransaction {
			alertInstance.inspected()
		}
		flash.message = message(code: 'alert.inspected.label')
		redirect(action: "list")
		
	}

}
