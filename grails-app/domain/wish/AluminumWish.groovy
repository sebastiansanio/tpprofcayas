package wish

import org.hibernate.envers.Audited;

@Audited
class AluminumWish {

	static hasMany		= [ subWish: AluminumSubWish ] 
	
	BigDecimal			lintongx
	List				subWish
	
	static constraints = {

    }
}
