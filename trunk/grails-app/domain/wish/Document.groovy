package wish

import courier.DocumentsCourierRecord
import modal.DocumentType

class Document {

	DocumentType documentType
	Date received

	DocumentsCourierRecord courierRecord
	String fileName
	byte[] file

	Date deliveredToCustomsBrokerDate
	Date deliveredToLawyerDate
	Date deliveredToCustomerDate
	
    static mapping = {
    }
    
	static constraints = {
		file maxSize: 9999999,nullable:true
		received nullable:true
		courierRecord nullable:true
		fileName nullable:true,blank:true	
		deliveredToCustomsBrokerDate nullable:true
		deliveredToLawyerDate nullable:true
		deliveredToCustomerDate nullable:true
    }
	
	boolean requiresVisa(){
		return documentType.requiresVisa
	}
	
	boolean isBl(){
		return documentType.isBl
	}
	
	public String toString() {
		return documentType.toString()
	}
	
	Date getReceived(){
		return courierRecord?.arrivalDate
	}
}
