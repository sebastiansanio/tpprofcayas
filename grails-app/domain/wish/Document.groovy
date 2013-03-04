package wish

import modal.DocumentType

class Document {

	DocumentType documentType
	Date received
	String trackingNumber
	byte[] file
	
    static mapping = {
    }
    
	static constraints = {
		file size: 1..9999999,nullable:true
		received nullable:true
		trackingNumber nullable:true,blank:true
		
    }
	

	public String toString() {
		return documentType.toString()
	}
}
