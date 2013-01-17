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
	
	def generateAlerts(Wish wish){
		def alertTypes = AlertType.findAll()
		alertTypes.each{alertType ->
			alertType.checkWish(wish)
		}
		
	}
	
    def generateAllAlerts() {
		def activeWishes = Wish.findAll().findAll{
			it.isActive()	
		}
		def alertTypes = AlertType.findAll()
		activeWishes.each{wish ->
			generateAlerts(wish)
		}
    }
	
	def checkAlerts(Wish wish){
		wish.alerts.each{
			it.check()
		}
	}
	
	def checkAllAlerts() {
		def activeWishes = Wish.findAll().findAll{
			it.isActive()
			
		}
		activeWishes.each{wish ->
			checkAlerts(wish)
		}
	}
}
