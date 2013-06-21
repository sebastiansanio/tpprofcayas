package alert

import wish.Wish

class AlertsMailService {

    static transactional = true
	def mailService

	def sendAlerts(){
		List alerts = Alert.findAllByDateFinalizedIsNullAndSentDateIsNull()
		alerts.each{
			sendAlert(it)
		}
	}
	
	def sendAlert(Alert alert){
		
		Wish wish = alert.wish
		AlertType alertType = alert.alertType
		
		List stakeholders = new ArrayList()
		alertType.stakeholders.each{
			if(wish[it]!=null)
				stakeholders.add(wish[it])	
		}
		
		
		stakeholders.each{
			
			try{
				AlertMessage message = alertType.retrieveMessage(it.defaultLocale)
				
				if(message!=null){
				
					List mails = new ArrayList()
					it.contacts.each{
						if(it.sendAlerts)
							mails.add(it.email)
					}

					
					if(mails.size()>0){

											
						mailService.sendMail {
							to mails.toArray()
							subject transformText(message.subject,alert)
							body transformText(message.message,alert)
						}
						alert.sentDate = new Date()	
					}
				}	
			}catch(Exception e){
				log.error("Error en envío de alerta",e)
			}
		}
	}
	
	String transformText(String text,Alert alert){
		String returnText
		returnText = text.replace("[supplierOrder]",alert.wish.supplierOrder?:'')
		returnText = returnText.replace("[customerOpNumber]",alert.wish.customerOpNumber.toString()?:'')
				
		return returnText
	}
}
