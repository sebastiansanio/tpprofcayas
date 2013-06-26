package courier

import stakeholder.Stakeholder
import wish.Document
import org.hibernate.envers.Audited

@Audited
class DocumentsCourierRecord extends CourierRecord {
	
	static hasMany = [documents:Document]
	

	Stakeholder getIssuer(){
		Stakeholder stakeholderTemp
		for(Document document:documents){
			stakeholderTemp = document.wish.supplier
			break
		}
		return stakeholderTemp
	}
	
	List getReceivers(){
		List receiversList = new ArrayList()
		for(Document document:documents){
			if(!receiversList.contains(document.wish.customer))
				receiversList.add(document.wish.customer)
		}
		return receiversList
	}
	
	String getDescription(){
		StringBuilder sb = new StringBuilder()
		String prefix = ""
		for(Document document:documents){
			sb.append(prefix)
			prefix = ", "
			sb.append(document.wish.supplierOrder)
		}
		return sb.toString()
	}
	
	boolean getRequiresVisa(){
		boolean requiresVisaTemp = false
		for(Document document:documents){
			if(document.requiresVisa()){
				requiresVisaTemp = true
				break
			}
		}
		return requiresVisaTemp
	}
}
