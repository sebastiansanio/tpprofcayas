package schedule


class AlertsMailingJob {
	def alertsMailService
	def concurrent = false
	
	static triggers = {
      simple repeatInterval: 2L*1000L
    }

    def execute() {
		alertsMailService.sendAlerts()
    }
}
