package alert
import org.apache.shiro.SecurityUtils
import java.text.DateFormat;
import wish.Wish
import java.text.SimpleDateFormat
import login.User

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.servlet.support.RequestContextUtils


class AlertExternalController {

	private static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")
		
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def alertExportService
	
    def index() {
        redirect(action: "list", params: params)
    }
	

    def list() {
		params.max = Math.min(params.max ? params.int('max') : 200, 1000)
		params.sort = params.sort?: 'attentionDate'
		params.sort = params.sort?: 'asc'
		
		def alerts = new ArrayList()
		def alertsQuantity = 0
		
		User user = User.findByUsername(SecurityUtils.subject.principal)
		def alertTypes = AlertType.list().findAll{
			user?.stakeholder.type in it.stakeholders
		}
		def wishes = user?.stakeholder?.wishes
		
		if(alertTypes.size()>0 && wishes.size()>0){
			alerts = Alert.findAllByDateFinalizedIsNullAndWishInListAndAlertTypeInList(wishes,alertTypes,params)
			alertsQuantity = Alert.countByDateFinalizedIsNullAndWishInListAndAlertTypeInList(wishes,alertTypes)
		}
		
        [alertInstanceList: alerts, alertInstanceTotal: alertsQuantity]
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
