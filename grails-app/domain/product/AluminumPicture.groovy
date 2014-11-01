package product

import org.hibernate.envers.Audited;

@Audited
class AluminumPicture {

	byte[] image
	String fileName
    	
	static constraints = {
		image size: 1..9999999
		fileName nullable:true,blank:true
    }
}
