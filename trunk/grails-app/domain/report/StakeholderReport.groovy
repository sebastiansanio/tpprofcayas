package report
import org.hibernate.envers.Audited
import stakeholder.Stakeholder

@Audited
class StakeholderReport {

	Date	dateCreated
	Date	lastUpdated
	List fields
	
	static hasMany		= [fields: String]	
	static belongsTo = [stakeholder: Stakeholder]
	
	String name
	boolean pendingOnly
	
	
	static constraints = {
		name nullable:false,blank:false
    }
	
	public String toString() {
		return name
	}
}
