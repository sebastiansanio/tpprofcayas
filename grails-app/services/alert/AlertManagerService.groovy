package alert

import wish.Wish

class AlertManagerService {

    static transactional = true

	Object lock = new Object()
	
	def getActiveAlerts(params){
		return Alert.findAllByDateFinalizedIsNullAndLastInspectedIsNull(params)
	}
	
	def getInspectedAlerts(params){
		return Alert.findAllByDateFinalizedIsNullAndLastInspectedIsNotNull(params)
	}
	
	def generateAlerts(Wish wish){
		synchronized(lock){
			def alertTypes = AlertType.list()
			alertTypes.each{alertType ->
				wish.addAlert(alertType)
			}
		}
	}
	
	def generateAlerts(Wish wish,List alertTypes){
		synchronized(lock){
			alertTypes.each{alertType ->
				wish.addAlert(alertType)
			}
		}
	}
	
    def generateAllAlerts() {
		synchronized(lock){
			def activeWishes = Wish.findAllByFinishDateIsNull()
			def alertTypes = AlertType.findAll()
			activeWishes.each{wish ->
				generateAlerts(wish,alertTypes)
			}
		}
    }
	
	def checkAllAlerts() {
		synchronized(lock){
			def activeAlerts = Alert.findAllByDateFinalizedIsNull()
			activeAlerts.each{
				it.check()
			}
		}
	}
}
