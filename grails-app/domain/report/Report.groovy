package report

class Report {


	Date	dateCreated
	Date	lastUpdated
	
	static hasMany		= [fields: String]	
	
	String name
	boolean pendingOnly

	static constraints = {
		name nullable:false,blank:false
    }
	
	public String toString() {
		return name
	}
}
