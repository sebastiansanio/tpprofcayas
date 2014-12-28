package wish

import org.hibernate.envers.Audited

@Audited
class SubtotalExtra {

	String 			code
	String 			description
	BigDecimal   	number
		
	static constraints = {
		code size:1..3
		description blank:false, nullable: false
		number min:0.0000, scale:4
    }

	@Override 
	public String toString() {
		return "${description}"
	}
}
