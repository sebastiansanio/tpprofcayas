package wish

import courier.DocumentsCourierRecord
import modal.DocumentType

import org.hibernate.envers.Audited

@Audited
class FirstStageDocument extends Document{
	
	static belongsTo	= [wish:Wish]
	
	static constraints = {
		wish nullable:true
	}

}
