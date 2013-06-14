package wish
import org.hibernate.envers.Audited

@Audited
class PrintingBoxesPicture extends Picture{
	Wish wish

	static constraints = {
		wish nullable:true
	}
	
}
