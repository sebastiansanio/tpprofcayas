package stakeholder

class StakeholderRole {

	static String customerLabel = "wish.customer.label"
	static String supplierLabel = "wish.supplier.label"
	static String shipperLabel = "wish.shipper.label"
	static String customsBrokerLabel = "wish.customsBroker.label"
	static String forwarderLabel = "wish.forwarder.label"
	static String agentLabel = "wish.agent.label"
	
	String name
		
	static hasMany		= [stakeholders:Stakeholder]	
	
    static mapping = {
    }
    
	static constraints = {
		name inList:[customerLabel,supplierLabel,shipperLabel,customsBrokerLabel,forwarderLabel,agentLabel],unique:true
    }
	
	public String toString() {
		return name
	}
	public boolean isCustomer(){
		return name == customerLabel
	}
	public boolean isSupplier(){
		return name == supplierLabel
	}
	public boolean isShipper(){
		return name == shipperLabel
	}
	public boolean isCustomsBroker(){
		return name == customsBrokerLabel
	}
	public boolean isForwarder(){
		return name == forwarderLabel
	}
	public boolean isAgent(){
		return name == agentLabel
	}

}
