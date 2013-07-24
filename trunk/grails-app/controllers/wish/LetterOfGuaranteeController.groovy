package wish

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;

import org.springframework.dao.DataIntegrityViolationException

import stakeholder.Customer;
import stakeholder.Forwarder;

/**
 * LetterOfGuaranteeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class LetterOfGuaranteeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		def year = new Date()
				
		Calendar cal = Calendar.getInstance();
		cal.setTime(year);
		
		def forwarders = Forwarder.findAllByDateCreatedLessThanEquals(year)
		def customers = Customer.findAllByDateCreatedLessThanEquals(year)
		def letters = LetterOfGuarantee.findAllByYearBetween( cal.get(Calendar.YEAR) - 1, cal.get(Calendar.YEAR))
		
        [yearInit: 2012, yearCurrent: cal.get(Calendar.YEAR), forwarders: forwarders.asList(), customers: customers.asList(), letters: letters.asList()]
    }

    def create() {
        [letterOfGuaranteeInstance: new LetterOfGuarantee(params)]
    }

    def save() {
        def letterOfGuaranteeInstance = new LetterOfGuarantee(params)
		
        if (!letterOfGuaranteeInstance.save(flush: true)) {
            render(view: "create", model: [letterOfGuaranteeInstance: letterOfGuaranteeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), letterOfGuaranteeInstance.id])
        redirect(action: "show", params: params)
    }

    def show() {		
		def letterOfGuaranteeInstance = LetterOfGuarantee.get( new LetterOfGuarantee(params) )
		
        if (!letterOfGuaranteeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee'), params.id])
            redirect(action: "list")
            return
        }

        [letterOfGuaranteeInstance: letterOfGuaranteeInstance]
    }

    def edit() {
		
        def letterOfGuaranteeInstance = LetterOfGuarantee.get( new LetterOfGuarantee(params) )
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
