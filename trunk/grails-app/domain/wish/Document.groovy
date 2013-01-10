package wish

import modal.DocumentType

class Document {

	DocumentType documentType
	boolean received
	String trackingNumber
	
	static belongsTo	= [wish:Wish]
	
    static mapping = {
    }
    
	static constraints = {
    }
	

//	public String toString() {
//		return "${name}";
//	}
}
