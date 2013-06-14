package modal

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional


@Transactional
class PaymentTermController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.sort = params.sort?: 'name'
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [paymentTermInstanceList: PaymentTerm.list(params), paymentTermInstanceTotal: PaymentTerm.count()]
    }

    def create() {
        [paymentTermInstance: new PaymentTerm(params)]
    }

    def save() {
        def paymentTermInstance = new PaymentTerm(params)
        if (!paymentTermInstance.save(flush: true)) {
            render(view: "create", model: [paymentTermInstance: paymentTermInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'paymentTerm.label', default: 'PaymentTerm'), paymentTermInstance.id])
        redirect(action: "show", id: paymentTermInstance.id)
    }

    def show() {
        def paymentTermInstance = PaymentTerm.get(params.id)
        if (!paymentTermInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentTerm.label', default: 'PaymentTerm'), params.id])
            redirect(action: "list")
            return
        }

        [paymentTermInstance: paymentTermInstance]
    }

    def edit() {
        def paymentTermInstance = PaymentTerm.get(params.id)
        if (!paymentTermInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentTerm.label', default: 'PaymentTerm'), params.id])
            redirect(action: "list")
            return
        }

        [paymentTermInstance: paymentTermInstance]
    }

    def update() {
        def paymentTermInstance = PaymentTerm.get(params.id)
        if (!paymentTermInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentTerm.label', default: 'PaymentTerm'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (paymentTermInstance.version > version) {
                paymentTermInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'paymentTerm.label', default: 'PaymentTerm')] as Object[],
                          "Another user has updated this PaymentTerm while you were editing")
                render(view: "edit", model: [paymentTermInstance: paymentTermInstance])
                return
            }
        }

        paymentTermInstance.properties = params

        if (!paymentTermInstance.save(flush: true)) {
            render(view: "edit", model: [paymentTermInstance: paymentTermInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'paymentTerm.label', default: 'PaymentTerm'), paymentTermInstance.id])
        redirect(action: "show", id: paymentTermInstance.id)
    }

    def delete() {
        def paymentTermInstance = PaymentTerm.get(params.id)
        if (!paymentTermInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentTerm.label', default: 'PaymentTerm'), params.id])
            redirect(action: "list")
            return
        }

        try {
            paymentTermInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'paymentTerm.label', default: 'PaymentTerm'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'paymentTerm.label', default: 'PaymentTerm'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
