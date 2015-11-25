package wish

import org.springframework.dao.DataIntegrityViolationException

import org.springframework.transaction.annotation.Transactional

class ProductWishController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productWishInstanceList: ProductWish.list(params), productWishInstanceTotal: ProductWish.count()]
    }

    def create() {
        [productWishInstance: new ProductWish(params)]
    }

	@Transactional
    def save() {
        def productWishInstance = new ProductWish(params)
		productWishInstance?.items?.removeAll { it.product.id == null }
        if (!productWishInstance.save(flush: true)) {
            render(view: "create", model: [productWishInstance: productWishInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'productWish.label', default: 'ProductWish'), productWishInstance.id])
        redirect(action: "edit", id: productWishInstance.id)
    }

    def show() {
        def productWishInstance = ProductWish.get(params.id)
        if (!productWishInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productWish.label', default: 'ProductWish'), params.id])
            redirect(action: "list")
            return
        }

        [productWishInstance: productWishInstance]
    }

    def edit() {
        def productWishInstance = ProductWish.get(params.id)
        if (!productWishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productWish.label', default: 'ProductWish'), params.id])
            redirect(action: "list")
            return
        }

        [productWishInstance: productWishInstance]
    }
	@Transactional
    def update() {
        def productWishInstance = ProductWish.get(params.id)
        if (!productWishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productWish.label', default: 'ProductWish'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productWishInstance.version > version) {
                productWishInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productWish.label', default: 'ProductWish')] as Object[],
                          "Another user has updated this ProductWish while you were editing")
                render(view: "edit", model: [productWishInstance: productWishInstance])
                return
            }
        }
		def productIds = new ProductWish(params).items*.product*.id
		productWishInstance.properties = params		
		for (productWishItem in productWishInstance.items.findAll{!productIds.contains(it.product.id)}) {
			productWishItem.delete()
		}
		productWishInstance.items.removeAll { !productIds.contains(it.product.id) }
		
        if (!productWishInstance.save(flush: true)) {
            render(view: "edit", model: [productWishInstance: productWishInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'productWish.label', default: 'ProductWish'), productWishInstance.id])
        redirect(action: "edit", id: productWishInstance.id)
    }
	@Transactional
    def delete() {
        def productWishInstance = ProductWish.get(params.id)
        if (!productWishInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productWish.label', default: 'ProductWish'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productWishInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'productWish.label', default: 'ProductWish'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productWish.label', default: 'ProductWish'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
