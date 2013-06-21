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
		def alertTypes = AlertType.list()
		alertTypes.each{alertType ->
			wish.addAlert(alertType)
		}
	}
	
	def generateAlerts(Wish wish,List alertTypes){
		alertTypes.each{alertType ->
			wish.addAlert(alertType)
		}
	}
	
    def generateAllAlerts() {
		def activeWishes = Wish.findAllByFinishDateIsNull()
		def alertTypes = AlertType.findAll()
		activeWishes.each{wish ->
			generateAlerts(wish,alertTypes)
		}
    }
	
	def checkAllAlerts() {
		def activeAlerts = Alert.findAllByDateFinalizedIsNull()
		activeAlerts.each{
			it.check()
		}
	}
}
