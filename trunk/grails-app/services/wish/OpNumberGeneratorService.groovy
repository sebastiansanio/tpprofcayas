package wish

import stakeholder.Customer

class OpNumberGeneratorService {

    static transactional = true

    def serviceMethod() {

    }
	
	Long getNextCustomerOpNumber(Customer customer){
		Long lastCustomerOpNumberAux = 0
		customer.wishes.each{
			if(it.customerOpNumber > lastCustomerOpNumberAux)
				lastCustomerOpNumberAux =  it.customerOpNumber
		}
		return lastCustomerOpNumberAux + 1	
	}
	
	Long getNextOpNumber(){
		def array = Wish.executeQuery("select max(a.opNumber) from Wish a")
		if(array.size()==0)
			return 1
		return array[0]+1
		
	}
	
}
