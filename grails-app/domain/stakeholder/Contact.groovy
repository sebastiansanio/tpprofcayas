package stakeholder

class Contact {
	
	String name
	String telephone
	String email
	boolean sendMails
	
	Date	dateCreated
	
	static belongsTo	= [stakeholder:Stakeholder]	
	
    static mapping = {
    }
    
	static constraints = {
		name blank:false
		telephone blank:true
		email email:true, blank:true
		stakeholder nullable:false
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
