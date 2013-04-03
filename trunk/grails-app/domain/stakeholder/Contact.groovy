package stakeholder

class Contact {
	
	Date	dateCreated
	String name
	String email
	String position
	
	static belongsTo	= [stakeholder:Stakeholder]
		    
	static constraints = {
		name blank:false,nullable:false
		email email:true,blank:true,nullable:true
		position blank:true,nullable:true
    }
	
	public String toString() {
		return name
	}
}
