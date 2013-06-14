package wish
import org.hibernate.envers.Audited

@Audited
class LoadingContainerPicture extends Picture{

	Wish wish

	static constraints = {
		wish nullable:true
	}
}
