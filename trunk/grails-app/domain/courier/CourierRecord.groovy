package courier

import wish.Document
import org.hibernate.envers.Audited

@Audited
class CourierRecord {
	
	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= [courier:Courier]
	
	String trackingNumber
	
	Date departureDate
	Date estimatedArrivalDate
	Date arrivalDate
	
	String costsInChargeOf
	String aditionalCosts
	String observations

	String source
	String destination
		
	static constraints = {
		courier nullable:false
		trackingNumber nullable:false,blank:false,unique: 'courier'
		departureDate nullable:true
		estimatedArrivalDate nullable:true
		arrivalDate nullable:true
		costsInChargeOf nullable:true,blank:true,inList: ["Supplier","Customer"]
		aditionalCosts nullable:true,blank:true
		observations nullable:true,blank:true
		source nullable:true,blank:true
		destination nullable:true,blank:true
    }
	
	boolean delivered(){
		arrivalDate!=null
	}

	public String toString() {
		return courier.toString() + ' - '+trackingNumber
	}
}
