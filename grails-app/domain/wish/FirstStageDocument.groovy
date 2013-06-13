package wish

import courier.DocumentsCourierRecord
import modal.DocumentType

class FirstStageDocument extends Document{
	
	Wish wish
	static constraints = {
		wish nullable:true
	}

}
