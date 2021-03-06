package wish

import org.apache.shiro.SecurityUtils
import stakeholder.Customer
import login.User

class WishExternalController {

	static final Integer DEFAULT_PAGINATION_MAX = 100
	
	
    def index() {
        redirect(action: "listPending", params: params)
    }
	
	def list() {
		List wishes = new ArrayList()
		User user = User.findByUsername(SecurityUtils.subject.principal)		
		if(user.stakeholder!=null){
			wishes.addAll(user.stakeholder.wishes)
			wishes.sort{it.opNumber}
		}		
		[wishInstanceList: wishes,user:user]
	}
	
	def listPending(){
		List wishes = new ArrayList()
		User user = User.findByUsername(SecurityUtils.subject.principal)
		if(user.stakeholder!=null){
			wishes.addAll(user.stakeholder.wishes.findAll{it.isPending()})
			wishes.sort{it.opNumber}
		}
		render(view: "list", model: [wishInstanceList: wishes,user:user])
	}
	
	def listBilled(){
		List wishes = new ArrayList()
		User user = User.findByUsername(SecurityUtils.subject.principal)
		if(user.stakeholder!=null){
			wishes.addAll(user.stakeholder.wishes.findAll{it.finishDate==null && it.billDate!=null})
			wishes.sort{it.opNumber}
		}
		render(view: "list", model: [wishInstanceList: wishes,user:user])
	}

	def listFinished(){
		List wishes = new ArrayList()
		User user = User.findByUsername(SecurityUtils.subject.principal)
		if(user.stakeholder!=null){
			wishes.addAll(user.stakeholder.wishes.findAll{it.finishDate!=null})
			wishes.sort{it.opNumber}
		}
		render(view: "list", model: [wishInstanceList: wishes,user:user])
	}


    def show() {
        def wishInstance = Wish.findByCustomerAndCustomerOpNumber(Customer.get(params.customerId),params.customerOpNumber)
		User user = User.findByUsername(SecurityUtils.subject.principal)
		
        if (!wishInstance || user.stakeholder==null || wishInstance[user.stakeholder.type]!=user.stakeholder) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }

        [wishInstance: wishInstance,user:user]
    }
		
}
