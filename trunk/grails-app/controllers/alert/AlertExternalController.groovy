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
		
        [alertInstanceList: alerts, alertInstanceTotal: alertsQuantity,user:user]
    }
	

}
