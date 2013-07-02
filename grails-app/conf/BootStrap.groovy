import report.Report
import stakeholder.Customer;
import stakeholder.CustomsBroker;
import stakeholder.Supplier;
import grails.util.Environment;

import org.apache.shiro.crypto.hash.Sha256Hash
import org.quartz.Scheduler
import org.quartz.SchedulerFactory
import org.quartz.impl.StdSchedulerFactory
import alert.AlertMessage
import alert.AlertType
import courier.Courier
import courier.DocumentsCourierRecord
import courier.SpecialCourierRecord
import login.*
import modal.*
import wish.*
import stakeholder.*
import product.*

class BootStrap {
	def alertManagerService
	
    def init = { servletContext ->
		
		if(Environment.current != Environment.PRODUCTION) {
			User.withTransaction{		
				List supplierReportFields = ["opNumber","customer","supplier","shipper","supplierOrder","currencyFob","currency","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
					"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","visaChargePayment","visaChargePaymentConcept","shippingMark","customerLogoPunch","hsCodeToBeWritten",
					"amountOfMoneyInAdvanceTransferred","moneyBalance","dateOfBalancePayment","picturesOfPrintingBoxesAndLoadReceived","picturesOfLoadingContainerReceived","sourceCountry","port",
					"ship","docDraftApproved","cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber"
				]
				def supplierReport = new Report(name:'Proveedor',pendingOnly:true,fields:supplierReportFields)
				supplierReport.save(flush:true)
				
				List customsBrokerReportFields = ["opNumber","customer","shipper","supplierOrder","priceCondition","currencyFob","estimatedTimeOfDeparture",
					"timeOfDeparture","estimatedTimeOfArrival","timeOfArrival","customsBroker","customsBrokerRefNumber","djaiNumber",
					"djaiFormalizationDate","shippingMark","ship","freightQuote","forwarderRefNumber","loadSecuredPercent",
					"cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber","dispatchNumber"
				]
				def customsBrokerReport = new Report(name:'Despachante',pendingOnly:true,fields:customsBrokerReportFields)
				customsBrokerReport.save(flush:true)
						
				
				List customerReportFields = ["customerOpNumber","customer","shipper","supplierOrder","currencyFob","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
					"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","paymentStatus","customsBroker",
					"customsBrokerRefNumber","visaChargePayment","visaChargePaymentConcept","djaiNumber","djaiFormalizationDate","amountOfMoneyInAdvanceTransferred","moneyBalance","dateOfBalancePayment",
					"port",	"ship","forwarder","freightQuote","forwarderRefNumber","typeOfFreight","blNumber"
				]
				def customerReport = new Report(name:'Cliente',pendingOnly:true,fields:customerReportFields)
				customerReport.save(flush:true)
				
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
				generalReport.save(flush:true)
				
				def permission = new Permission(description:'Usuarios - control total',permissionString:'user:*')
				permission.save()
				permission = new Permission(description:'Ver pantalla de inicio',permissionString:'main:*')
				permission.save()
				permission = new Permission(description:'Valores criterio - control total',permissionString:'criterionValue:*')
				permission.save()
				permission = new Permission(description:'Tipos de documento - control total',permissionString:'documentType:*')
				permission.save()
				permission = new Permission(description:'Shipping marks - control total',permissionString:'shippingMark:*')
				permission.save()
				permission = new Permission(description:'Tipos de flete - control total',permissionString:'typeOfFreight:*')
				permission.save()
				permission = new Permission(description:'Estado de pago - control total',permissionString:'paymentStatus:*')
				permission.save()
				permission = new Permission(description:'Condición de pago - control total',permissionString:'paymentTerm:*')
				permission.save()
				permission = new Permission(description:'Condición de precio - control total',permissionString:'priceCondition:*')
				permission.save()
				permission = new Permission(description:'Concepto del pago de visados - control total',permissionString:'visaChargePaymentConcept:*')
				permission.save()
				permission = new Permission(description:'Estado de la carga - control total',permissionString:'wishStatus:*')
				permission.save()
				permission = new Permission(description:'Idiomas - control total',permissionString:'availableLocale:*')
				permission.save()
				permission = new Permission(description:'Reportes - control total',permissionString:'report:*')
				permission.save()
				permission = new Permission(description:'Todo - ver',permissionString:'*:show')
				permission.save()
				permission = new Permission(description:'Permisos - control total',permissionString:'permission:*')
				permission.save()
				permission = new Permission(description:'Roles - control total',permissionString:'role:*')
				permission.save()
				permission = new Permission(description:'Colores - control total',permissionString:'color:*')
				permission.save()
				permission = new Permission(description:'Subfamilias de prod - control total',permissionString:'subFamily:*')
				permission.save()
				permission = new Permission(description:'Familias de prod - control total',permissionString:'family:*')
				permission.save()
				permission = new Permission(description:'Tipos de alerta - control total',permissionString:'alertType:*')
				permission.save()
				permission = new Permission(description:'Mensajes de alerta - control total',permissionString:'alertMessage:*')
				permission.save()
				permission = new Permission(description:'Países - control total',permissionString:'country:*')
				permission.save()
				permission = new Permission(description:'Monedas - control total',permissionString:'currency:*')
				permission.save()
				permission = new Permission(description:'Alertas - control total',permissionString:'alert:*')
				permission.save()
				permission = new Permission(description:'Productos - control total',permissionString:'product:*')
				permission.save()
				permission = new Permission(description:'Pedidos - control total',permissionString:'wish:*')
				permission.save()
				permission = new Permission(description:'Clientes - control total',permissionString:'customer:*')
				permission.save()
				permission = new Permission(description:'Proveedores - control total',permissionString:'supplier:*')
				permission.save()
				permission = new Permission(description:'Agentes - control total',permissionString:'agent:*')
				permission.save()
				permission = new Permission(description:'Despachantes - control total',permissionString:'customsBroker:*')
				permission.save()
				permission = new Permission(description:'Forwarders - control total',permissionString:'forwarder:*')
				permission.save()
				permission = new Permission(description:'Shippers - control total',permissionString:'shipper:*')
				permission.save()
				permission = new Permission(description:'Puertos - control total',permissionString:'port:*')
				permission.save()
				permission = new Permission(description:'Buques - control total',permissionString:'ship:*')
				permission.save()
				permission = new Permission(description:'Contactos - control total',permissionString:'contact:*')
				permission.save()
				//Nuevo
				permission = new Permission(description:'Envío automático de reportes - control total',permissionString:'reportSendConfiguration:*')
				permission.save()
				permission = new Permission(description:'Couriers - control total',permissionString:'courier:*')
				permission.save()
				permission = new Permission(description:'Otras empresas - control total',permissionString:'otherStakeholder:*')
				permission.save()
				permission = new Permission(description:'Registros de courier - control total',permissionString:'courierRecord:*')
				permission.save()
				permission = new Permission(description:'Ver auditoría',permissionString:'audit:*')
				permission.save()
				
				
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
				roleAdmin.addToPermissions("permission:*")
				roleAdmin.addToPermissions("role:*")
				
				//Nuevo
				roleAdmin.addToPermissions("otherStakeholder:*")
				roleAdmin.save(flush:true)
			
				def roleOperator = new Role(name:"Operador")
				roleOperator.addToPermissions("alert:*")
				roleOperator.addToPermissions("main:*")
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
				roleOperator.addToPermissions("contact:*")
				roleOperator.addToPermissions("*:show")
				//Nuevo
				roleOperator.addToPermissions("reportSendConfiguration:*")
				roleOperator.addToPermissions("courier:*")
				roleOperator.addToPermissions("courierRecord:*")
				roleOperator.addToPermissions("audit:*")
				
				roleOperator.save(flush:true)
				
				def roleManager = new Role(name:"Manager")
				roleManager.addToPermissions("color:*")
				roleManager.addToPermissions("main:*")
				roleManager.addToPermissions("subFamily:*")
				roleManager.addToPermissions("family:*")
				roleManager.addToPermissions("alertType:*")
				roleManager.addToPermissions("alertMessage:*")
				roleManager.addToPermissions("country:*")
				roleManager.addToPermissions("currency:*")
				roleManager.addToPermissions("*:show")
				roleManager.save(flush:true)
				
				def localeEs = new AvailableLocale(language:'es',country:'ES')
				localeEs.save(flush:true)
				def localeEn = new AvailableLocale(language:'en',country:'EN')
				localeEn.save(flush:true)
				
				def admin = new User(username:"admin", passwordHash: new Sha256Hash("admin").toHex())
				admin.addToRoles(roleAdmin)
				admin.save(flush:true)
				
				def user = new User(username:"cayas", passwordHash: new Sha256Hash("cayas").toHex())
				user.addToRoles(roleOperator)
				user.save(flush:true)
				
				def manager = new User(username:"manager", passwordHash: new Sha256Hash("manager").toHex())
				manager.addToRoles(roleManager)
				manager.save(flush:true)
				
				def documentType = new DocumentType(name:'CI with Visa at consulate',type:'phase1',requiresVisa:true)
				documentType.save(flush:true)
				documentType = new DocumentType(name:'PL',type:'phase1')
				documentType.save(flush:true)
				documentType = new DocumentType(name:'BL - CO',type:'phase1',isBl: true)
				documentType.save(flush:true)
				documentType = new DocumentType(name:'CI',type:'phase1')
				documentType.save(flush:true)
				documentType = new DocumentType(name:'Export Certificate with Visa',type:'phase2')
				documentType.save(flush:true)
				documentType = new DocumentType(name:'Price List with Visa',type:'phase2')
				documentType.save(flush:true)
				
				
				def ship = new Ship (name:'Ship')
				ship.save(flush:true)
				
				def country = new Country(name:"CHINA")
				country.save(flush:true)
										
				def customer = new Customer(defaultReport:customerReport,defaultLocale:localeEs,name:"PLACASUR",country:country,address:".",cuit:"30-34948484-4")
				customer.save(flush:true)
				customer = new Customer(defaultReport:customerReport,defaultLocale:localeEs,name:"DELTA",country:country,address:".",cuit:"30-34948484-4")
				customer.save(flush:true)
				customer = new Customer(defaultReport:customerReport,defaultLocale:localeEs,name:"RICCHEZZE",country:country,address:".",cuit:"30-34948484-4")
				customer.save(flush:true)
				
				
				
				def supplier = new Supplier(defaultReport:supplierReport,defaultLocale:localeEn,name:"HAI HUI",country:country,address:".",taxRegistryNumber:"2312232")
				supplier.save(flush:true)
				supplier = new Supplier(defaultReport:supplierReport,defaultLocale:localeEn,name:"Triumph",country:country,address:".",taxRegistryNumber:"2312232")
				supplier.save(flush:true)
				supplier = new Supplier(defaultReport:supplierReport,defaultLocale:localeEn,name:"TECBRIL",country:country,address:".",taxRegistryNumber:"2312232")
				supplier.save(flush:true)
				
				
				def shipper = new Shipper(defaultReport:customerReport,defaultLocale:localeEs,name:"GUANGZHOU ANIMAL",country:country)
				shipper.save(failOnError:true)
				
				def customsBroker = new CustomsBroker(defaultReport:customsBrokerReport,defaultLocale:localeEs,name:"LEWKOWICK",country:country)
				customsBroker.save(flush:true)
				
				def forwarder = new Forwarder(defaultReport:customerReport,defaultLocale:localeEs,name:"AirSeaLand",country:country)
				forwarder.save(failOnError:true)
				
				def agent = new Agent(defaultReport:customerReport,defaultLocale:localeEn,name:"SUNSHOW",country:country)
				agent.save(flush:true)
				
				def port = new Port(country:country,name:"GUANGZHOU")
				port.save(flush:true)
				
				def priceCondition = new PriceCondition(name:"FOB",description:"FOB")
				priceCondition.save(flush:true)
				
				def color = new Color(description:"BLANCO")
				color.save(flush:true)
				
				color = new Color(description:"NEGRO")
				color.save(flush:true)
				
				def product = new Product(descriptionES:"Artículo 1",description:'Product 1',color:color)
				product.save(flush:true)
				
				def product2 = new Product(descriptionES:"Artículo 2",description:'Product 2',color:color)
				product2.save(flush:true)
				
				
				def paymentTerm = new PaymentTerm(name:"100 TT 15 días ETA",percentPaymentAfterDelivery:100,paymentDaysAfterTimeOfArrival:15)
				paymentTerm.save(flush:true)
				paymentTerm = new PaymentTerm(name:"30 TT / 70 CAD",percentPaymentAfterDelivery:70,paymentDaysAfterTimeOfArrival:0)
				paymentTerm.save(flush:true)
				paymentTerm = new PaymentTerm(name:"100 CAD",percentPaymentAfterDelivery:100,paymentDaysAfterTimeOfArrival:0)
				paymentTerm.save(flush:true)
				
				
				def paymentStatus = new PaymentStatus(name:"A la espera del 100%")
				paymentStatus.save(flush:true)
				
				def wishStatus1 = new WishStatus(name:"At production")
				wishStatus1.save(flush:true)
				def wishStatus2 = new WishStatus(name:"Traveling")
				wishStatus2.save(flush:true)
				def wishStatus3 = new WishStatus(name:"Arrived")
				wishStatus3.save(flush:true)
				
				
				def currency = new Currency(name:"PESO")
				currency.save(flush:true)
				currency = new Currency(name:"DOLAR")
				currency.save(flush:true)
				currency = new Currency(name:"YUAN")
				currency.save(flush:true)
				
				
				def alertType = new AlertType(description:"Vencimiento de la Djai",nameOfEstimatedDateField:"djaiExpirationDate",nameOfCompletionField:"originalDjaiFinished",alertTerm:10)
		    	alertType.save(flush:true)
				
				alertType = new AlertType(description:"Enviar diseños de cajas",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:0,frequency:3)
				alertType.save(flush:true)
				alertType = new AlertType(description:"Consultar fecha de delivery",nameOfEstimatedDateField:"dateToConfirmDeliveryDate",nameOfCompletionField:"deliveryDate",alertTerm:0)
				alertType.addToStakeholders('supplier')
				alertType.save(flush:true)
				AlertMessage alertMessage = new AlertMessage(language:localeEn,alertType:alertType,subject:'Fecha de delivery',message:'Hello...\n [supplier]:[supplierOrder] [customerOpNumber] \n Bye')
				alertMessage.save()
				
				alertType = new AlertType(description:"Reclamar swift al cliente",nameOfEstimatedDateField:"dateToDemandSwiftToClient",nameOfCompletionField:"swiftReceivedDate",alertTerm:0)
				alertType.save(flush:true)
				alertType = new AlertType(description:"Enviar swift al proveedor",nameOfEstimatedDateField:"swiftReceivedDate",nameOfCompletionField:"swiftSentToSupplierDate",alertTerm:0)
				alertType.save(flush:true)
				alertType = new AlertType(description:"Pedir drafts",nameOfEstimatedDateField:"deliveryDate",nameOfCompletionField:"docDraftFinished",alertTerm:20)
				alertType.save(flush:true)
				alertType = new AlertType(description:"Solicitar al proveedor la gestión del visado",nameOfEstimatedDateField:"requireVisaDate",nameOfCompletionField:"visaReceivedDate",alertTerm:20)
				alertType.save(flush:true)
				alertType = new AlertType(description:"Pedir fotos de las cajas",nameOfEstimatedDateField:"deliveryDate",nameOfCompletionField:"picturesOfPrintingBoxesAndLoadFinished",alertTerm:10)
				alertType.save(flush:true)
				alertType = new AlertType(description:"Pedir pago del saldo",nameOfEstimatedDateField:"estimatedBalancePaymentDate",nameOfCompletionField:"dateOfBalancePayment",alertTerm:10)
				alertType.save(flush:true)
				alertType = new AlertType(description:"Pedir fotos del container",nameOfEstimatedDateField:"dateToRequirePicturesOfLoadingContainer",nameOfCompletionField:"picturesOfLoadingContainerFinished",alertTerm:0)
				alertType.save(flush:true)
				alertType = new AlertType(description:"Pedir Bl",nameOfEstimatedDateField:"requireBlDate",nameOfCompletionField:"blReceivedDate",alertTerm:0)
				alertType.save(flush:true)
				
				
				for(int i = 1;i<=5;i++){
					Wish wish = new Wish(customsBroker:customsBroker,'customer.id':1,'supplier.id':5,opNumber:i,customerOpNumber:i,wishDate:new Date().clearTime())
					wish.save(failOnError:true)
				}

				for(int i = 1;i<=5;i++){
					Wish wish = new Wish(djaiFormalizationDate:new Date().clearTime(),wishStatus:wishStatus1,forwarder:forwarder,shipper:shipper,'customer.id':2,finishDate:new Date().clearTime(),'supplier.id':5,opNumber:(i+10),customerOpNumber:i,wishDate:new Date().clearTime())
					wish.save(failOnError:true)
				}

				for(int i = 1;i<=5;i++){
					Wish wish = new Wish(djaiFormalizationDate:new Date().clearTime(),wishStatus:wishStatus2,agent:agent,'paymentTerm.id':1,'customer.id':3,billDate:new Date().clearTime(),'supplier.id':5,opNumber:(i+20),customerOpNumber:i,wishDate:new Date().clearTime())
					wish.save(failOnError:true)
				}

				for(int i = 1;i<=5;i++){
					Wish wish = new Wish(djaiFormalizationDate:new Date().clearTime(),wishStatus:wishStatus3,agent:agent,'paymentTerm.id':1,'customer.id':3,'supplier.id':5,opNumber:(i+30),customerOpNumber:i+15,wishDate:new Date().clearTime())
					wish.save(failOnError:true)
				}


				Courier courier = new Courier(name: 'DHL',web: 'www.dhl.com.ar')
				courier.save()
				Courier courier2 = new Courier(name:'TNT')
				courier2.save()

				DocumentsCourierRecord cr = new DocumentsCourierRecord(courier:courier,trackingNumber:"1")
				cr.save(failOnError:true)
				cr = new DocumentsCourierRecord(courier:courier,trackingNumber:"2")
				cr.save(failOnError:true)
				cr = new DocumentsCourierRecord(courier:courier,trackingNumber:"3")
				cr.save(failOnError:true)
				cr = new DocumentsCourierRecord(courier:courier,trackingNumber:"4")
				cr.save(failOnError:true)
				SpecialCourierRecord scr = new SpecialCourierRecord(courier:courier2,trackingNumber:"1",issuer:customer,requiresVisa:true)
				scr.save()
				scr = new SpecialCourierRecord(courier:courier2,trackingNumber:"2",issuer:customer,requiresVisa:false)
				scr.save()
				
				
				alertManagerService.checkAllAlerts()
				alertManagerService.generateAllAlerts()
				
			}
		}
	}
    def destroy = {
    }
}
