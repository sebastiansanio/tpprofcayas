package stakeholder

import wish.Wish
import org.hibernate.envers.Audited

@Audited
class Shipper extends Stakeholder{

	static final String type = "shipper"

	String taxRegistryNumber
	String exportingName
	
    static hasMany		= [wishes: Wish]
	
	
	static constraints = {
		taxRegistryNumber blank:true,nullable:true
		exportingName blank:true,nullable:true,maxSize:512
    }
	

}
