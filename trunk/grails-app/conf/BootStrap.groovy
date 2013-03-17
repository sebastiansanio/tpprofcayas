import report.Report
import stakeholder.Customer;
import stakeholder.CustomsBroker;
import stakeholder.Supplier;

import org.apache.shiro.crypto.hash.Sha256Hash
import org.quartz.Scheduler
import org.quartz.SchedulerFactory
import org.quartz.impl.StdSchedulerFactory
import alert.AlertType
import login.*
import modal.*
import wish.*
import stakeholder.*
import product.*

class BootStrap {

    def init = { servletContext ->
				
		List supplierReportFields = ["opNumber","customer","supplier","shipper","supplierOrder","currencyFob","currency","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
			"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","visaChargePayment","visaChargePaymentConcept","shippingMark","customerLogoPunch","hsCodeToBeWritten",
			"amountOfMoneyInAdvanceTransferred","moneyBalance","dateOfBalancePayment","picturesOfPrintingBoxesAndLoadReceived","picturesOfLoadingContainerReceived","sourceCountry","port",
			"ship","docDraftApproved","cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber"
		]
		def supplierReport = new Report(name:'Proveedor',pendingOnly:true,fields:supplierReportFields)
		supplierReport.save()
		
		List customsBrokerReportFields = ["opNumber","customer","shipper","supplierOrder","priceCondition","currencyFob","estimatedTimeOfDeparture",
			"timeOfDeparture","estimatedTimeOfArrival","timeOfArrival","customsBroker","customsBrokerRefNumber","djaiNumber",
			"djaiFormalizationDate","shippingMark","ship","freightQuote","forwarderRefNumber","loadSecuredPercent",
			"cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber","dispatchNumber"
		]
		def customsBrokerReport = new Report(name:'Despachante',pendingOnly:true,fields:customsBrokerReportFields)
		customsBrokerReport.save()
				
		
		List customerReportFields = ["customerOpNumber","customer","shipper","supplierOrder","currencyFob","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
			"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","paymentStatus","customsBroker",
			"customsBrokerRefNumber","visaChargePayment","visaChargePaymentConcept","djaiNumber","djaiFormalizationDate","amountOfMoneyInAdvanceTransferred","moneyBalance","dateOfBalancePayment",
			"port",	"ship","forwarder","freightQuote","forwarderRefNumber","typeOfFreight","blNumber"
		]
		def customerReport = new Report(name:'Cliente',pendingOnly:true,fields:customerReportFields)
		customerReport.save()
		
		List generalReportFields = ["opNumber","customerOpNumber","customer","supplier","shipper","supplierOrder","priceCondition","currencyFob","currency","conversion",
			"foreignCurrencyFob","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
			"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","paymentStatus","customsBroker",
			"customsBrokerRefNumber","visaChargePayment","visaChargePaymentConcept","criterionValue","licenses",
			"djaiNumber","djaiFormalizationDate","djaiExpirationDate","djaiExtendedRequested","djaiExtendedExpiration",
			"shippingMark","customerLogoPunch","taxRegistryNumberAndCuitVerification","hsCodeToBeWritten",
			"amountOfMoneyInAdvanceTransferred","swiftReceivedDate","swiftSentToSupplierDate","moneyBalance","dateOfBalancePayment",
			"picturesOfPrintingBoxesAndLoadReceived","picturesOfLoadingContainerReceived","sourceCountry","port",
			"ship","docDraftApproved","forwarder","agent","freightQuote","forwarderRefNumber","loadSecuredPercent",
			"cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber","dispatchNumber","bill",
			"billDate","finishDate"
		]
		def generalReport = new Report(name:'General',pendingOnly:false,fields:generalReportFields)
		generalReport.save()
		
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
		roleAdmin.addToPermissions("availableLocale:*")
		roleAdmin.addToPermissions("report:*")
		roleAdmin.addToPermissions("*:show")
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
		roleOperator.addToPermissions("report:*")
		roleOperator.addToPermissions("*:show")
		roleOperator.save()
		
		def roleManager = new Role(name:"Manager")
		roleManager.addToPermissions("color:*")
		roleManager.addToPermissions("main:*")
		roleManager.addToPermissions("subFamily:*")
		roleManager.addToPermissions("family:*")
		roleManager.addToPermissions("alertType:*")
		roleManager.addToPermissions("country:*")
		roleManager.addToPermissions("currency:*")
		roleManager.addToPermissions("*:show")
		roleManager.save()
		
		def localeEs = new AvailableLocale(language:'es',country:'ES')
		localeEs.save()
		def localeEn = new AvailableLocale(language:'en',country:'EN')
		localeEn.save()
		
		def admin = new User(username:"admin", passwordHash: new Sha256Hash("admin").toHex())
		admin.addToRoles(roleAdmin)
		admin.save()
		
		def user = new User(username:"cayas", passwordHash: new Sha256Hash("cayas").toHex())
		user.addToRoles(roleOperator)
		user.save()
		
		def manager = new User(username:"manager", passwordHash: new Sha256Hash("manager").toHex())
		manager.addToRoles(roleManager)
		manager.save()
		
		def documentType = new DocumentType(name:'CI with Visa at consulate',type:'phase1',requiresVisa:true)
		documentType.save()
		documentType = new DocumentType(name:'PL',type:'phase1')
		documentType.save()
		documentType = new DocumentType(name:'BL - CO',type:'phase1',isBl: true)
		documentType.save()
		documentType = new DocumentType(name:'CI',type:'phase1')
		documentType.save()
		documentType = new DocumentType(name:'Export Certificate with Visa',type:'phase2')
		documentType.save()
		documentType = new DocumentType(name:'Price List with Visa',type:'phase2')
		documentType.save()
		
		
		def ship = new Ship (name:'Ship')
		ship.save()
		
		def country = new Country(name:"CHINA")
		country.save()
								
		def customer = new Customer(defaultReport:customerReport,defaultLocale:localeEs,name:"PLACASUR",country:country,address:".",cuit:"30-34948484-4")
		customer.save()
		customer = new Customer(defaultReport:customerReport,defaultLocale:localeEs,name:"DELTA",country:country,address:".",cuit:"30-34948484-4")
		customer.save()
		customer = new Customer(defaultReport:customerReport,defaultLocale:localeEs,name:"RICCHEZZE",country:country,address:".",cuit:"30-34948484-4")
		customer.save()
		
		
		
		def supplier = new Supplier(defaultReport:supplierReport,defaultLocale:localeEn,name:"HAI HUI",country:country,address:".",taxRegistryNumber:"2312232")
		supplier.save()
		supplier = new Supplier(defaultReport:supplierReport,defaultLocale:localeEn,name:"Triumph",country:country,address:".",taxRegistryNumber:"2312232")
		supplier.save()
		supplier = new Supplier(defaultReport:supplierReport,defaultLocale:localeEn,name:"TECBRIL",country:country,address:".",taxRegistryNumber:"2312232")
		supplier.save()
		
		
		def shipper = new Shipper(defaultReport:customerReport,defaultLocale:localeEs,name:"GUANGZHOU ANIMAL",country:country)
		shipper.save(failOnError:true)
		
		def customsBroker = new CustomsBroker(defaultReport:customsBrokerReport,defaultLocale:localeEs,name:"LEWKOWICK",country:country)
		customsBroker.save()
		
		def forwarder = new Forwarder(defaultReport:customerReport,defaultLocale:localeEs,name:"AirSeaLand",country:country)
		forwarder.save(failOnError:true)
		
		def agent = new Agent(defaultReport:customerReport,defaultLocale:localeEn,name:"SUNSHOW",country:country)
		agent.save()
		
		def port = new Port(country:country,name:"GUANGZHOU")
		port.save()
		
		def priceCondition = new PriceCondition(name:"FOB",description:"FOB")
		priceCondition.save()
		
		def color = new Color(description:"BLANCO")
		color.save()
		
		color = new Color(description:"NEGRO")
		color.save()
		
		def product = new Product(descriptionES:"Artículo 1",description:'Product 1',color:color)
		product.save()
		
		def product2 = new Product(descriptionES:"Artículo 2",description:'Product 2',color:color)
		product2.save()
		
		
		def paymentTerm = new PaymentTerm(name:"100 TT 15 días ETA",percentPaymentAfterDelivery:100,paymentDaysAfterTimeOfArrival:15)
		paymentTerm.save()
		paymentTerm = new PaymentTerm(name:"30 TT / 70 CAD",percentPaymentAfterDelivery:70,paymentDaysAfterTimeOfArrival:0)
		paymentTerm.save()
		paymentTerm = new PaymentTerm(name:"100 CAD",percentPaymentAfterDelivery:100,paymentDaysAfterTimeOfArrival:0)
		paymentTerm.save()
		
		
		def paymentStatus = new PaymentStatus(name:"A la espera del 100%")
		paymentStatus.save()
		
		def wishStatus = new WishStatus(name:"At production")
		wishStatus.save()
		
		def currency = new Currency(name:"PESO")
		currency.save()
		currency = new Currency(name:"DOLAR")
		currency.save()
		currency = new Currency(name:"YUAN")
		currency.save()
		
		
		def alertType = new AlertType(description:"Vencimiento de la Djai",nameOfEstimatedDateField:"djaiExpirationDate",nameOfCompletionField:"timeOfArrival",alertTerm:10)
    	alertType.save()
		
		alertType = new AlertType(description:"Enviar diseños de cajas",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:0,frequency:3)
		alertType.save()
		alertType = new AlertType(description:"Consultar fecha de delivery",nameOfEstimatedDateField:"dateToConfirmDeliveryDate",nameOfCompletionField:"confirmedDeliveryDate",alertTerm:5)
		alertType.save()
		alertType = new AlertType(description:"Reclamar swift al cliente",nameOfEstimatedDateField:"dateToDemandSwiftToClient",nameOfCompletionField:"swiftReceivedDate",alertTerm:0)
		alertType.save()
		alertType = new AlertType(description:"Enviar swift al proveedor",nameOfEstimatedDateField:"swiftReceivedDate",nameOfCompletionField:"swiftSentToSupplierDate",alertTerm:0)
		alertType.save()
		alertType = new AlertType(description:"Pedir drafts",nameOfEstimatedDateField:"deliveryDate",nameOfCompletionField:"docDraftApproved",alertTerm:20)
		alertType.save()
		alertType = new AlertType(description:"Solicitar al proveedor la gestión del visado",nameOfEstimatedDateField:"requireVisaDate",nameOfCompletionField:"visaReceivedDate",alertTerm:20)
		alertType.save()
		alertType = new AlertType(description:"Pedir fotos de las cajas",nameOfEstimatedDateField:"deliveryDate",nameOfCompletionField:"picturesOfPrintingBoxesAndLoadReceived",alertTerm:10)
		alertType.save()
		alertType = new AlertType(description:"Pedir pago del saldo",nameOfEstimatedDateField:"estimatedBalancePaymentDate",nameOfCompletionField:"dateOfBalancePayment",alertTerm:10)
		alertType.save()
		alertType = new AlertType(description:"Pedir fotos del container",nameOfEstimatedDateField:"forwarderSelectedDate",nameOfCompletionField:"picturesOfLoadingContainerReceived",alertTerm:0)
		alertType.save()
		alertType = new AlertType(description:"Pedir Bl",nameOfEstimatedDateField:"requireBlDate",nameOfCompletionField:"blReceivedDate",alertTerm:0)
		alertType.save()
		
		
	}
    def destroy = {
    }
}
