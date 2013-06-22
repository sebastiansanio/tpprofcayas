package wish
import org.hibernate.envers.Audited

@Audited
class LoadingContainerPicture extends Picture{

	static belongsTo	= [wish:Wish]

	static constraints = {
		wish nullable:true
	}
}
