package alert

import org.drools.builder.KnowledgeBuilder
import org.drools.definition.KnowledgePackage
import org.drools.io.Resource
import org.drools.runtime.Environment
import org.drools.runtime.StatefulKnowledgeSession
import org.drools.builder.ResourceType
import org.drools.KnowledgeBase
import org.drools.KnowledgeBaseFactory
import org.drools.SessionConfiguration
import org.drools.builder.KnowledgeBuilderFactory
import org.drools.io.ResourceFactory
import org.jbpm.process.instance.ProcessInstance
import wish.Wish

class AlertManagerService {

    static transactional = true

	def getActiveAlerts(params){
		return Alert.findAllByDateFinalizedIsNull(params)
		
	}
	
    def generateAlerts() {
	
		def activeWishes = Wish.findAll().each{
			if(it.isActive()){
			}	
		}
		def alertTypes = AlertType.findAll()
		Date today = new Date()
		today = today.clearTime()
		
		activeWishes.each{activeWish ->
			alertTypes.each{alertType ->				
				if(activeWish.getDate(alertType.nameOfEstimatedDateField)!=null && activeWish.getDate(alertType.nameOfCompletionField)==null && activeWish.getDate(alertType.nameOfEstimatedDateField) + alertType.daysOfOffset  <= today + alertType.alertTerm){
					activeWish.generateAlert(alertType,activeWish.getDate(alertType.nameOfEstimatedDateField) + alertType.daysOfOffset) 
				}
			}
		}

    }
	
	def finalizeAlerts(){
		Date today = new Date()
		today = today.clearTime()
		def activeAlerts = getActiveAlerts()
		activeAlerts.each{activeAlert->
			if(activeAlert.wish.getDate(activeAlert.alertType.nameOfCompletionField)!=null){
				activeAlert.finalize()
			}else if(activeAlert.wish.getDate(activeAlert.alertType.nameOfEstimatedDateField) + activeAlert.alertType.daysOfOffset  > today + activeAlert.alertType.alertTerm){
				activeAlert.finalize()
			}	
		}
	}
}
