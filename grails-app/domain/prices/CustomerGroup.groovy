package prices

import stakeholder.Customer

import org.hibernate.envers.Audited

@Audited
class CustomerGroup {

	Date	dateCreated
	Date	lastUpdated
	String name

	static hasMany		= [customers: Customer]

	static mapping = {
	}

	static constraints = {
		name nullable: false, blank: false, unique: true
	}

	public String toString() {
		name
	}
}
