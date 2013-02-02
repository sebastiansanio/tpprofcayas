import org.apache.shiro.crypto.hash.Sha256Hash
import alert.AlertType
import login.*
import modal.*
import wish.*
import stakeholder.*

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:"cayas", passwordHash: new Sha256Hash("cayas").toHex())
		user.addToPermissions("alert:*")
		user.addToPermissions("color:*")
		user.addToPermissions("family:*")
		user.addToPermissions("main:*")
		user.addToPermissions("picture:*")
		user.addToPermissions("product:*")
		user.addToPermissions("wish:*")
		user.save()
		
		def country = new Country(name:"CHINA")
		country.save()
								
		def customer = new Customer(name:"PLACASUR",country:country,address:".",cuit:"30-34948484-4")
		customer.save()
		
		def supplier = new Supplier(name:"HAI HUI",country:country,address:".",taxRegistryNumber:"2312232")
		supplier.save()
		
		def shipper = new Shipper(name:"GUANGZHOU ANIMAL",country:country)
		shipper.save(failOnError:true)
		
		def customsBroker = new CustomsBroker(name:"LEWKOWICK",country:country)
		customsBroker.save()
		
		def forwarder = new Forwarder(name:"AirSeaLand",country:country)
		forwarder.save(failOnError:true)
		
		def agent = new Agent(name:"SUNSHOW",country:country)
		agent.save()
		
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
		
		def alertType = new AlertType(description:"Vencimiento de la Djai",nameOfEstimatedDateField:"djaiExpirationDate",nameOfCompletionField:"timeOfArrival",alertTerm:10)
    	alertType.save()
		alertType = new AlertType(description:"Salida del barco",nameOfEstimatedDateField:"estimatedTimeOfDeparture",nameOfCompletionField:"timeOfDeparture",alertTerm:5)
		alertType.save()
		alertType = new AlertType(description:"Llegada del barco",nameOfEstimatedDateField:"estimatedTimeOfArrival",nameOfCompletionField:"timeOfArrival",alertTerm:5)
		alertType.save()
		
		
	}
    def destroy = {
    }
}