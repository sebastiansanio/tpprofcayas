import org.apache.shiro.crypto.hash.Sha256Hash
import login.*
import modal.*
import wish.*
import stakeholder.*

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:"cayas", passwordHash: new Sha256Hash("cayas").toHex())
		user.addToPermissions("product:*")
		user.addToPermissions("family:*")
		user.addToPermissions("color:*")
		user.addToPermissions("main:*")
		user.addToPermissions("wish:*")
		user.save()
		
		
		def customerRole = new StakeholderRole(name:StakeholderRole.customerLabel)
		customerRole.save()
		def supplierRole = new StakeholderRole(name:StakeholderRole.supplierLabel)
		supplierRole.save()
		def shipperRole = new StakeholderRole(name:StakeholderRole.shipperLabel)
		shipperRole.save()
		def customsBrokerRole = new StakeholderRole(name:StakeholderRole.customsBrokerLabel)
		customsBrokerRole.save()
		def forwarderRole = new StakeholderRole(name:StakeholderRole.forwarderLabel)
		forwarderRole.save()
		def agentRole = new StakeholderRole(name:StakeholderRole.agentLabel)
		agentRole.save()
						
		def stakeholder = new Stakeholder(name:"PLACASUR")
		stakeholder.addToStakeholderRoles(customerRole)
		stakeholder.save()
		
		stakeholder = new Stakeholder(name:"HAI HUI")
		stakeholder.addToStakeholderRoles(supplierRole)
		stakeholder.save()
		
		stakeholder = new Stakeholder(name:"GUANGZHOU ANIMAL")
		stakeholder.addToStakeholderRoles(shipperRole)
		stakeholder.save()
		
		stakeholder = new Stakeholder(name:"LEWKOWICK")
		stakeholder.addToStakeholderRoles(customsBrokerRole)
		stakeholder.save()
		
		stakeholder = new Stakeholder(name:"AirSeaLand")
		stakeholder.addToStakeholderRoles(forwarderRole)
		stakeholder.save()
		
		stakeholder = new Stakeholder(name:"SUNSHOW")
		stakeholder.addToStakeholderRoles(agentRole)
		stakeholder.save()
		
		
		def country = new Country(name:"CHINA")
		country.save()
		
		def port = new Port(country:country,name:"GUANGZHOU")
		port.save()
		
		def priceCondition = new PriceCondition(name:"FOB",description:"FOB")
		priceCondition.save()
		
		def paymentTerm = new PaymentTerm(name:"100 TT 15 días ETA")
		paymentTerm.save()
		
		def paymentStatus = new PaymentStatus(name:"A la espera del 100%")
		paymentStatus.save()
		
		def wishStatus = new WishStatus(name:"At production")
		wishStatus.save()
		
		def currency = new Currency(name:"DOLAR")
		currency.save()
    }
    def destroy = {
    }
}
