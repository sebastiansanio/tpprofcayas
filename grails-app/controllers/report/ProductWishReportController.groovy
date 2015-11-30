package report

import java.text.DateFormat;
import java.text.SimpleDateFormat
import login.User
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.transaction.annotation.Transactional
import org.apache.shiro.SecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils
import wish.ProductWish

@Transactional
class ProductWishReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [productWishReportInstanceList: ProductWishReport.list(params), productWishReportInstanceTotal: ProductWishReport.count()]
    }

    def create() {
        [productWishReportInstance: new ProductWishReport(params)]
    }

    def save() {
        def productWishReportInstance = new ProductWishReport(params)
        if (!productWishReportInstance.save(flush: true)) {
            render(view: "create", model: [productWishReportInstance: productWishReportInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'productWishReport.label', default: 'ProductWishReport'), productWishReportInstance.id])
        redirect(action: "show", id: productWishReportInstance.id)
    }

    def show() {
        def productWishReportInstance = ProductWishReport.get(params.id)
        if (!productWishReportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productWishReport.label', default: 'ProductWishReport'), params.id])
            redirect(action: "list")
            return
        }

        [productWishReportInstance: productWishReportInstance]
    }

    def edit() {
        def productWishReportInstance = ProductWishReport.get(params.id)
        if (!productWishReportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productWishReport.label', default: 'ProductWishReport'), params.id])
            redirect(action: "list")
            return
        }

        [productWishReportInstance: productWishReportInstance]
    }

    def update() {
        def productWishReportInstance = ProductWishReport.get(params.id)
        if (!productWishReportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productWishReport.label', default: 'ProductWishReport'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productWishReportInstance.version > version) {
                productWishReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productWishReport.label', default: 'ProductWishReport')] as Object[],
                          "Another user has updated this ProductWishReport while you were editing")
                render(view: "edit", model: [productWishReportInstance: productWishReportInstance])
                return
            }
        }

        productWishReportInstance.properties = params

        if (!productWishReportInstance.save(flush: true)) {
            render(view: "edit", model: [productWishReportInstance: productWishReportInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'productWishReport.label', default: 'ProductWishReport'), productWishReportInstance.id])
        redirect(action: "show", id: productWishReportInstance.id)
    }

    def delete() {
        def productWishReportInstance = ProductWishReport.get(params.id)
        if (!productWishReportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productWishReport.label', default: 'ProductWishReport'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productWishReportInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'productWishReport.label', default: 'ProductWishReport'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productWishReport.label', default: 'ProductWishReport'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	

}
