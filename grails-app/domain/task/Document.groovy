package task

class Document {
	
	static belongsTo	= [documentsDelivery:DocumentsDelivery, documentType:DocumentType]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
