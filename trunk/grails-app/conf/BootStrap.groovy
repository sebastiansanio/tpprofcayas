import org.apache.shiro.crypto.hash.Sha256Hash
import alert.AlertType
import login.*
import modal.*
import wish.*
import stakeholder.*

class BootStrap {

    def init = { servletContext ->
		
		def roleAdmin = new Role(name:"Admin")
		roleAdmin.addToPermissions("user:*")
		roleAdmin.addToPermissions("main:*")
		roleAdmin.addToPermissions("criterionValue:*")
		roleAdmin.addToPermissions("documentType:*")
		roleAdmin.addToPermissions("shippingMark:*")
		roleAdmin.addToPermissions("typeOfFreight:*")
		roleAdmin.addToPermissions("paymentStatus:*")
		roleAdmin.addToPermissions("paymentTerm:*")
		roleAdmin.addToPermissions("priceCondition:*")
		roleAdmin.addToPermissions("visaChargePaymentConcept:*")
		roleAdmin.addToPermissions("wishStatus:*")
		roleAdmin.save()
	
		def roleOperator = new Role(name:"Operador")
		roleOperator.addToPermissions("alert:*")
		roleOperator.addToPermissions("main:*")
		roleOperator.addToPermissions("picture:*")
		roleOperator.addToPermissions("product:*")
		roleOperator.addToPermissions("wish:*")
		roleOperator.addToPermissions("customer:*")
		roleOperator.addToPermissions("supplier:*")
		roleOperator.addToPermissions("agent:*")
		roleOperator.addToPermissions("customsBroker:*")
		roleOperator.addToPermissions("forwarder:*")
		roleOperator.addToPermissions("shipper:*")
		roleOperator.addToPermissions("port:*")
		roleOperator.addToPermissions("ship:*")
		roleOperator.save()
		
		def roleManager = new Role(name:"Manager")
		roleManager.addToPermissions("color:*")
		roleManager.addToPermissions("main:*")
		roleManager.addToPermissions("subFamily:*")
		roleManager.addToPermissions("family:*")
		roleManager.addToPermissions("alertType:*")
		roleManager.addToPermissions("country:*")
		roleManager.addToPermissions("currency:*")
		roleManager.save()
		
		def admin = new User(username:"admin", passwordHash: new Sha256Hash("admin").toHex())
		admin.addToRoles(roleAdmin)
		admin.save()
		
		def user = new User(username:"cayas", passwordHash: new Sha256Hash("cayas").toHex())
		user.addToRoles(roleOperator)
		user.save()
		
		def manager = new User(username:"manager", passwordHash: new Sha256Hash("manager").toHex())
		manager.addToRoles(roleManager)
		manager.save()
		
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
		
		def paymentTerm = new PaymentTerm(name:"100 TT 15 días ETA",percentPaymentAfterDelivery:100,paymentDaysAfterTimeOfArrival:15)
		paymentTerm.save()
		
		def paymentStatus = new PaymentStatus(name:"A la espera del 100%")
		paymentStatus.save()
		
		def wishStatus = new WishStatus(name:"At production")
		wishStatus.save()
		
		def currency = new Currency(name:"DOLAR")
		currency.save()
		
		def alertType = new AlertType(frequency:0,description:"Vencimiento de la Djai",nameOfEstimatedDateField:"djaiExpirationDate",nameOfCompletionField:"timeOfArrival",alertTerm:10)
    	alertType.save()
		alertType = new AlertType(frequency:0,description:"Salida del barco",nameOfEstimatedDateField:"estimatedTimeOfDeparture",nameOfCompletionField:"timeOfDeparture",alertTerm:5)
		alertType.save()
		alertType = new AlertType(frequency:0,description:"Llegada del barco",nameOfEstimatedDateField:"estimatedTimeOfArrival",nameOfCompletionField:"timeOfArrival",alertTerm:5)
		alertType.save()
		
		
	}
    def destroy = {
    }
}
