package modal

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional
import wish.Wish


@Transactional
class PaymentStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.sort = params.sort?: 'name'
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [paymentStatusInstanceList: PaymentStatus.list(params), paymentStatusInstanceTotal: PaymentStatus.count()]
    }

    def create() {
        [paymentStatusInstance: new PaymentStatus(params)]
    }

    def save() {
        def paymentStatusInstance = new PaymentStatus(params)
        if (!paymentStatusInstance.save(flush: true)) {
            render(view: "create", model: [paymentStatusInstance: paymentStatusInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'paymentStatus.label', default: 'PaymentStatus'), paymentStatusInstance.id])
        redirect(action: "show", id: paymentStatusInstance.id)
    }

    def show() {
        def paymentStatusInstance = PaymentStatus.get(params.id)
        if (!paymentStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentStatus.label', default: 'PaymentStatus'), params.id])
            redirect(action: "list")
            return
        }

        [paymentStatusInstance: paymentStatusInstance]
    }

    def edit() {
        def paymentStatusInstance = PaymentStatus.get(params.id)
        if (!paymentStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentStatus.label', default: 'PaymentStatus'), params.id])
            redirect(action: "list")
            return
        }

        [paymentStatusInstance: paymentStatusInstance]
    }

    def update() {
        def paymentStatusInstance = PaymentStatus.get(params.id)
        if (!paymentStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentStatus.label', default: 'PaymentStatus'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (paymentStatusInstance.version > version) {
                paymentStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'paymentStatus.label', default: 'PaymentStatus')] as Object[],
                          "Another user has updated this PaymentStatus while you were editing")
                render(view: "edit", model: [paymentStatusInstance: paymentStatusInstance])
                return
            }
        }

        paymentStatusInstance.properties = params

        if (!paymentStatusInstance.save(flush: true)) {
            render(view: "edit", model: [paymentStatusInstance: paymentStatusInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'paymentStatus.label', default: 'PaymentStatus'), paymentStatusInstance.id])
        redirect(action: "show", id: paymentStatusInstance.id)
    }

    def delete() {
        def paymentStatusInstance = PaymentStatus.get(params.id)
        if (!paymentStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentStatus.label', default: 'PaymentStatus'), params.id])
            redirect(action: "list")
            return
        }
		if(Wish.countByPaymentStatus(paymentStatusInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'paymentStatus.label'),message(code: 'wish.label')])
			redirect(action: "show", id: params.id)
			return
		}
        try {
            paymentStatusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'paymentStatus.label', default: 'PaymentStatus'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'paymentStatus.label', default: 'PaymentStatus'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
