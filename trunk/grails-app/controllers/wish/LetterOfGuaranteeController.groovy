package wish

import stakeholder.Customer;
import stakeholder.Forwarder;

import org.springframework.dao.DataIntegrityViolationException

import org.springframework.transaction.annotation.Transactional

@Transactional
class LetterOfGuaranteeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		
		def yearCurrent

		if (params.year != null )
			yearCurrent = params.year.toInteger()
		else
			yearCurrent = Calendar.getInstance().get(Calendar.YEAR)

		def firstDay = new Date()
		firstDay.set(year: yearCurrent, month: 1, date: 1)
		
		def lastDay = new Date()
		lastDay.set(year: yearCurrent, month: 12, date: 31)
		
		def letters = LetterOfGuarantee.findAllWhere( year:yearCurrent )
		
		def wishes = Wish.executeQuery("select distinct new list( w.customer, w.forwarder) from Wish w " + 
										"where w.wishDate >= ? and w.wishDate <= ?",
										[firstDay, lastDay])	
		
		def customers = [] as Set 
		def forwarders = [] as Set
		def listLetters = []
		
		wishes.each {
			
			def customerTemp = it[0]
			def forwarderTemp = it[1] 
			customers.add(customerTemp)
			forwarders.add(forwarderTemp)
			listLetters.add([customerTemp, forwarderTemp, letters.find {
			it.customer.id == customerTemp.id && it.forwarder.id == forwarderTemp.id }?.id])
		}
		
		[yearInit: 2012, yearCurrent: Calendar.getInstance().get(Calendar.YEAR), yearSelect: yearCurrent, forwarders: forwarders, customers: customers, letters: listLetters]

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
