package alert
import wish.Wish
import org.junit.Test



class AlertTests {
	
	@Test
	void testAlertInspected() {
		Date now = new Date().clearTime()
		AlertType alertType = new AlertType(description:"Enviar diseños de cajas",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:0,frequency:3)
		Wish wish = new Wish(wishDate:now,alerts:new ArrayList())
		Alert alert = new Alert(alertType:alertType,deadline:now,attentionDate:now,wish:wish)
		alert.inspected()
		assertTrue(alert.isInspected())
	}
	
	@Test
	void testAlertFinalizedActivityFinished() {
		Date now = new Date().clearTime()
		AlertType alertType = new AlertType(description:"Enviar diseños de cajas",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:0,frequency:3)
		Wish wish = new Wish(wishDate:now,alerts:new ArrayList())
		Alert alert = new Alert(alertType:alertType,deadline:now,attentionDate:now,wish:wish)
		wish.alerts.add(alert)
		wish.checkAlerts()
		assertTrue(alert.isActive())
		wish.cartonPrintingInfoSentDate = now
		wish.checkAlerts()
		assertFalse(alert.isActive())
		assertEquals("activityFinished",alert.finalizedReason)
	}
	
	@Test
	void testAlertFinalizedDeadlineChanged() {
		Date now = new Date().clearTime()
		AlertType alertType = new AlertType(description:"Enviar diseños de cajas",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:0,frequency:3)
		Wish wish = new Wish(wishDate:now,alerts:new ArrayList())
		Alert alert = new Alert(alertType:alertType,deadline:now,attentionDate:now,wish:wish)
		wish.alerts.add(alert)
		wish.checkAlerts()
		assertTrue(alert.isActive())
		wish.wishDate = now.plus(1)
		wish.checkAlerts()
		assertFalse(alert.isActive())
		assertEquals("deadlineChanged",alert.finalizedReason)
	}
	
	@Test
	void testAlertFinalizedAttentionDateChanged() {
		Date now = new Date().clearTime()
		AlertType alertType = new AlertType(description:"Enviar diseños de cajas",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:0,frequency:3)
		Wish wish = new Wish(wishDate:now,alerts:new ArrayList())
		Alert alert = new Alert(alertType:alertType,deadline:now,attentionDate:now,wish:wish)
		wish.alerts.add(alert)
		wish.checkAlerts()
		assertTrue(alert.isActive())

		
		alertType.alertTerm = 1
		wish.checkAlerts()
		assertFalse(alert.isActive())
		assertEquals("attDateChanged",alert.finalizedReason)
		
	}
	
	@Test
	void testAlertFinalizedWishFinalized() {
		Date now = new Date().clearTime()
		AlertType alertType = new AlertType(description:"Enviar diseños de cajas",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:0,frequency:3)
		Wish wish = new Wish(wishDate:now,alerts:new ArrayList())
		Alert alert = new Alert(alertType:alertType,deadline:now,attentionDate:now,wish:wish)
		wish.alerts.add(alert)
		wish.checkAlerts()
		assertTrue(alert.isActive())
		wish.finishDate = now
		wish.checkAlerts()
		assertFalse(alert.isActive())
		assertEquals("wishFinalized",alert.finalizedReason)
		
	}
	
	@Test
	void testAlertInspectedMultiple() {
		Date now = new Date().clearTime()
		now = now.minus(3)
		AlertType alertType = new AlertType(description:"Enviar diseños de cajas",nameOfEstimatedDateField:"wishDate",nameOfCompletionField:"lastCartonPrintingInfoSentDate",alertTerm:0,frequency:1)
		Wish wish = new Wish(wishDate:now,alerts:new ArrayList())
		Alert alert = new Alert(alertType:alertType,deadline:now,attentionDate:now,wish:wish)
		wish.alerts.add(alert)
		alert.inspected()
		wish.checkAlerts()
		assertFalse(alert.isInspected())
		assertEquals(1,alert.timesRegenerated)
		alert.inspected()
		wish.checkAlerts()
		assertFalse(alert.isInspected())
		assertEquals(2,alert.timesRegenerated)
		alert.inspected()
		wish.checkAlerts()
		assertFalse(alert.isInspected())
		assertEquals(3,alert.timesRegenerated)
		alert.inspected()
		wish.checkAlerts()
		assertTrue(alert.isInspected())
		
	}
}
