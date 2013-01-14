import org.apache.shiro.crypto.hash.Sha256Hash
import login.*
import modal.*
import wish.*
import stakeholder.*

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:"cayas", passwordHash: new Sha256Hash("cayas").toHex())
		user.addToPermissions("*:*")

		user.save()
		
								
		def customer = new Customer(name:"PLACASUR")
		customer.save()
		
		def supplier = new Supplier(name:"HAI HUI")
		supplier.save()
		
		def shipper = new Shipper(name:"GUANGZHOU ANIMAL")
		shipper.save()
		
		def customsBroker = new CustomsBroker(name:"LEWKOWICK")
		customsBroker.save()
		
		def forwarder = new Forwarder(name:"AirSeaLand")
		forwarder.save()
		
		def agent = new Agent(name:"SUNSHOW")
		agent.save()
		
		
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
