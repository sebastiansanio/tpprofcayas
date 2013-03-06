package alert

import wish.Wish

class AlertManagerService {

    static transactional = true

	def getActiveAlerts(params){
		return Alert.findAllByDateFinalizedIsNullAndLastInspectedIsNull(params)
	}
	
	def getInspectedAlerts(params){
		return Alert.findAllByDateFinalizedIsNullAndLastInspectedIsNotNull(params)
	}
	
	def generateAlerts(Wish wish){
		def alertTypes = AlertType.findAll()
		alertTypes.each{alertType ->
			wish.addAlert(alertType)
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
	
	def checkAllAlerts() {
		def activeAlerts = Alert.findAll().findAll{
			it.isActive()
			
		}
		activeAlerts.each{
			it.check()
		}
	}
}
