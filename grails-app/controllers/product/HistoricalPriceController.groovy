package product

import org.springframework.dao.DataIntegrityViolationException

/**
 * HistoricalPriceController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class HistoricalPriceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def show() {
        def historicalPriceInstance = HistoricalPrice.get(params.id)
        if (!historicalPriceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'historicalPrice.label', default: 'HistoricalPrice'), params.id])
            redirect(action: "list")
            return
        }

        [historicalPriceInstance: historicalPriceInstance]
    }

    def delete() {
        def historicalPriceInstance = HistoricalPrice.get(params.id)
        if (!historicalPriceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'historicalPrice.label', default: 'HistoricalPrice'), params.id])
            redirect(action: "list")
            return
        }

        try {
            historicalPriceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'historicalPrice.label', default: 'HistoricalPrice'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'historicalPrice.label', default: 'HistoricalPrice'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
