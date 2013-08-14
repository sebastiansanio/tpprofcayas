package wish

import stakeholder.Customer;
import stakeholder.Forwarder;

import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.transaction.annotation.Transactional

@Transactional
class LetterOfGuaranteeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		
		//año que se va a visualizar
		def yearCurrent = (params.year != null )? params.year.toInteger() : Calendar.getInstance().get(Calendar.YEAR);

		def firstDay = new Date()
		firstDay.set(year: yearCurrent, month: 1, date: 1)
		
		def lastDay = new Date()
		lastDay.set(year: yearCurrent, month: 12, date: 31)
		
		//cartas y pedidos del año actual
		def letters = LetterOfGuarantee.createCriteria()
			.add (Restrictions.eq("year", yearCurrent))
			.setProjection ( Projections.projectionList()
				.add( Projections.property("customer") )
				.add( Projections.property("forwarder") )
				.add( Projections.property("id") )
			)
			.list();
	
		def wishes = Wish.createCriteria()
			.add(Restrictions.ge("estimatedTimeOfArrival", firstDay))
			.add(Restrictions.le("estimatedTimeOfArrival", lastDay))
			.setProjection( Projections.projectionList()
				.add( Projections.property("customer") )
				.add( Projections.property("forwarder") )
			)
			.list();
		
		//min y max de los años para elegir
		def yearsWish = Wish.createCriteria().get{
			projections { 
				max("estimatedTimeOfArrival") 
				min("estimatedTimeOfArrival") 
			}
		}
		
		def yearsLetter = LetterOfGuarantee.createCriteria().get{
			projections {
				max("year")
				min("year")
			}
		}
		
		def yearMax = Math.max(1900 + yearsWish[0]?.year, (yearsLetter[0] == null)? 0: yearsLetter[0])
		def yearMin = Math.min(1900 + yearsWish[1]?.year, (yearsLetter[1] == null)? yearMax: yearsLetter[1])
		

		def customers = [] as Set
		def forwarders = [] as Set
		def listLetters = []
		
		// lista de cartas + pedidos
		wishes.each {
			
			def customerTemp = it[0]
			def forwarderTemp = it[1] 
			def letter = letters.find{
					it[0].id == customerTemp.id && it[1].id == forwarderTemp.id  
				}
			
			customers.add(customerTemp)
			forwarders.add(forwarderTemp)
			listLetters.add([customerTemp, forwarderTemp, (letter != null)? letter[2]: null, true ])
			
			if ( letter != null )
				letters.remove(letter)
		}
		
		letters.each {

			def customerTemp = it[0]
			def forwarderTemp = it[1] 
			
			customers.add(customerTemp)
			forwarders.add(forwarderTemp)
			listLetters.add([customerTemp, forwarderTemp, it[2], false])
		}
		
		[yearInit: yearMin, yearCurrent: yearMax, yearSelect: yearCurrent, forwarders: forwarders, customers: customers, letters: listLetters]

    }

    def create() {
		def letter = new LetterOfGuarantee(params)
		letter.year = Calendar.getInstance().get(Calendar.YEAR);
        [letterOfGuaranteeInstance: letter]
    }

    def save() {
        def letterOfGuaranteeInstance = new LetterOfGuarantee(params)
        if (!letterOfGuaranteeInstance.save(flush: true)) {
            render(view: "create", model: [letterOfGuaranteeInstance: letterOfGuaranteeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), letterOfGuaranteeInstance])
        redirect(action: "show", id: letterOfGuaranteeInstance.id)
    }

    def show() {
        def letterOfGuaranteeInstance = LetterOfGuarantee.get( params.id )
        if (!letterOfGuaranteeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), params.id])
            redirect(action: "list")
            return
        }

        [letterOfGuaranteeInstance: letterOfGuaranteeInstance]
    }

    def edit() {
        def letterOfGuaranteeInstance = LetterOfGuarantee.get(params.id)
        if (!letterOfGuaranteeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), params.id])
            redirect(action: "list")
            return
        }

        [letterOfGuaranteeInstance: letterOfGuaranteeInstance]
    }

    def update() {
        def letterOfGuaranteeInstance = LetterOfGuarantee.get(params.id)
        if (!letterOfGuaranteeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (letterOfGuaranteeInstance.version > version) {
                letterOfGuaranteeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee')] as Object[],
                          "Another user has updated this LetterOfGuarantee while you were editing")
                render(view: "edit", model: [letterOfGuaranteeInstance: letterOfGuaranteeInstance])
                return
            }
        }

        letterOfGuaranteeInstance.properties = params

        if (!letterOfGuaranteeInstance.save(flush: true)) {
            render(view: "edit", model: [letterOfGuaranteeInstance: letterOfGuaranteeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), letterOfGuaranteeInstance.id])
        redirect(action: "show", id: letterOfGuaranteeInstance.id)
    }

    def delete() {
        def letterOfGuaranteeInstance = LetterOfGuarantee.get(params.id)

        if (!letterOfGuaranteeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), params.id])
            redirect(action: "list")
            return
        }

        try {
            letterOfGuaranteeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
