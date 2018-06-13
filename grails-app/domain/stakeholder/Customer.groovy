package stakeholder

import prices.CustomerGroup
import wish.Wish
import org.hibernate.envers.Audited

@Audited
class Customer extends Stakeholder{

	static final String type = "customer"

	CustomerGroup group
	String address
	String cuit
	String prefix

	static hasMany		= [wishes: Wish]

	static mapping = {
	}

	static constraints = {
		prefix nullable: false, blank:false, unique: true
		group nullable: true
	}
}
