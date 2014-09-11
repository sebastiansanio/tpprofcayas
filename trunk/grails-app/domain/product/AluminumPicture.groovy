package product

import org.hibernate.envers.Audited;

@Audited
class AluminumPicture {

	byte[] image
    	
	static constraints = {
		image size: 1..9999999
    }
}
