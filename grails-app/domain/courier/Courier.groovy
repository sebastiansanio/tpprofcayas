package courier
import org.hibernate.envers.Audited

@Audited
class Courier {

	Date	dateCreated
	Date	lastUpdated
	
	static hasMany = [courierRecords:CourierRecord]
	
	String name
	String web
	String telephone
	String email
	String cuit
	
	static constraints = {
		name nullable:false,blank:false
		web nullable:true,blank:true
		telephone nullable:true,blank:true
		email email:true, blank:true, nullable:true
		cuit nullable:true,blank:true
    }
	

	public String toString() {
		return name
	}
}
