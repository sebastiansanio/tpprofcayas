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
		
		def stakeholder = new Stakeholder(name:"UN CLIENTE")
		stakeholder.save()
		
		def country = new Country(name:"ARGENTINA")
		country.save()
		
		def port = new Port(country:country,name:"UN PUERTO")
		port.save()
		
		def priceCondition = new PriceCondition(name:"Condicion de precio",description:"Descripcion 1")
		priceCondition.save()
		
		def paymentTerm = new PaymentTerm(name:"Payment term 1")
		paymentTerm.save()
		
		def paymentStatus = new PaymentStatus(name:"Payment status")
		paymentStatus.save()
		
		def wishStatus = new WishStatus(name:"Wish status")
		wishStatus.save()
		
		def currency = new Currency(name:"PESO")
		currency.save()
    }
    def destroy = {
    }
}
