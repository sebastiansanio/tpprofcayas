package audit

import org.hibernate.envers.RevisionType

class RevisionDetail {
	
	static belongsTo	= [revision: RevisionInformation]
	
	String className
	Long entityId
	RevisionType revisionType
	
    static mapping = {
		
    }
    
	static constraints = {
    }
	

}
