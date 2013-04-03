package wish



import alert.Alert
import alert.AlertType

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Wish)
class WishTests {

	@Test
    void testAddAlert() {
		Date now = new Date().clearTime()
		AlertType alertType1 = new AlertType(description:"Prueba 1",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:1,frequency:1)
		alertType1.id=1
		AlertType alertType2 = new AlertType(description:"Prueba 2",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:2,frequency:3)
		alertType2.id=2
		AlertType alertType3 = new AlertType(description:"Prueba 3",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"deliveryDate",alertTerm:3,frequency:3)
		alertType3.id=3
		Wish wish = new Wish(wishDate:now)
		wish.addAlert(alertType2)
		wish.addAlert(alertType1)
		wish.addAlert(alertType2)
		wish.addAlert(alertType3)
		assertEquals(3,wish.getActiveAlerts().size())
		
		wish.alerts.each{
			assertEquals(wish[it.alertType.nameOfEstimatedDateField].minus(it.alertType.alertTerm),it.attentionDate)
		}
		
		wish.cartonPrintingInfoSentDate = now
		wish.checkAlerts()
		assertEquals(1,wish.getActiveAlerts().size())
    }

	@Test
	void testCheckAlerts() {
		Date now = new Date().clearTime()
		AlertType alertType1 = new AlertType(description:"Prueba 1",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:1,frequency:1)
		alertType1.id=1
		AlertType alertType2 = new AlertType(description:"Prueba 2",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:2,frequency:3)
		alertType2.id=2
		AlertType alertType3 = new AlertType(description:"Prueba 3",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"deliveryDate",alertTerm:3,frequency:3)
		alertType3.id=3
		Wish wish = new Wish(wishDate:now)
		wish.addAlert(alertType1)
		wish.addAlert(alertType2)
		wish.addAlert(alertType3)
		wish.checkAlerts()
		assertEquals(3,wish.getActiveAlerts().size())
		wish.cartonPrintingInfoSentDate = now
		wish.checkAlerts()
		assertEquals(1,wish.getActiveAlerts().size())
		wish.deliveryDate = now
		wish.checkAlerts()
		assertEquals(0,wish.getActiveAlerts().size())
	}
	
	@Test
	void testActive() {
		Wish wish = new Wish()
		assertTrue(wish.isActive())
		wish.finishDate = new Date()
		assertFalse(wish.isActive())		
	}
}
