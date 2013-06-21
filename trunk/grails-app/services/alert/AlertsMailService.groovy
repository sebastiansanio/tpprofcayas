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
		returnText = returnText.replace("[customerOpNumber]",alert.wish.customerOpNumber!=null?alert.wish.customerOpNumber.toString():'')
		returnText = returnText.replace("[customer]",alert.wish.customer!=null?alert.wish.customer.toString():'')
		returnText = returnText.replace("[supplier]",alert.wish.supplier!=null?alert.wish.supplier.toString():'')
		returnText = returnText.replace("[agent]",alert.wish.agent!=null?alert.wish.agent.toString():'')
		returnText = returnText.replace("[customsBroker]",alert.wish.customsBroker!=null?alert.wish.customsBroker.toString():'')
		returnText = returnText.replace("[forwarder]",alert.wish.forwarder!=null?alert.wish.forwarder.toString():'')
		returnText = returnText.replace("[shipper]",alert.wish.shipper!=null?alert.wish.shipper.toString():'')
		
		return returnText
	}
}
