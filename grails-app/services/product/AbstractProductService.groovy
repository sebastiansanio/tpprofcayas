package product
import wish.Note;

class AbstractProductService {

    static transactional = true

	def getHistoricalPriceList( idProduct ) {
		
		return HistoricalPrice.withCriteria {
			eq("product.id", idProduct )
			order "dateFrom", "desc"
		}.asList()
	}
		
}
