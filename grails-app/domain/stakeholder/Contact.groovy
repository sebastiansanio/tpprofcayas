package stakeholder

class Contact {
	
	Date	dateCreated
	String 	name
	String 	email
	String 	position
	Date birthday
	String phone
	String cellPhone
	String note
	
	boolean sendAlerts
	boolean sendReports
	
	
	static belongsTo	= [stakeholder:Stakeholder]
		    
	static constraints = {
		name blank:false,nullable:false
		email email:true,blank:true,nullable:true
		position blank:true,nullable:true
		
		birthday nullable:true
		phone nullable:true,blank:true
		cellPhone nullable:true,blank:true
		note nullable:true,blank:true
    }
	
	public String toString() {
		return name
	}
}
