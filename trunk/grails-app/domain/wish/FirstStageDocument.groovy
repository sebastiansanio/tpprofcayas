package wish

import courier.DocumentsCourierRecord
import modal.DocumentType

import org.hibernate.envers.Audited

@Audited
class FirstStageDocument extends Document{
	
	Wish wish
	static constraints = {
		wish nullable:true
	}

}
