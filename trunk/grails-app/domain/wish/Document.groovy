package wish

import modal.DocumentType

class Document {

	DocumentType documentType
	Date received
	String trackingNumber
	
    static mapping = {
    }
    
	static constraints = {
    }
	

//	public String toString() {
//		return "${name}";
//	}
}
