package wish

import courier.DocumentsCourierRecord
import modal.DocumentType

class SecondStageDocument extends Document{

	Wish wish
	static constraints = {
		wish nullable:true
	}
}
