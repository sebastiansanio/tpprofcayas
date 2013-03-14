package wish

import modal.DocumentType

class Document {

	DocumentType documentType
	Date received
	String trackingNumber
	String fileName
	byte[] file

	
    static mapping = {
    }
    
	static constraints = {
		file maxSize: 9999999,nullable:true
		received nullable:true
		trackingNumber nullable:true,blank:true
		fileName nullable:true,blank:true		
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
}
