package stakeholder

import wish.Wish

class OtherStakeholder extends Stakeholder {

	static final String type = "otherStakeholder"	

	List getWishes(){
		return Wish.list()
	}
	
}
