package prices

/**
 * ExchangeRateController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PricesAlertsController {

    def index() {
        
        def priceVariableAlerts = PriceVariable.findAllByExpireDateLessThan(new Date().clearTime())
        def exchangeRateAlerts = ExchangeRate.findAllByDateLessThan(new Date().clearTime())

        [priceVariableAlerts: priceVariableAlerts, exchangeRateAlerts: exchangeRateAlerts]

    }

}
