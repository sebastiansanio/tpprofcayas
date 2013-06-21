package schedule


class AlertsMailingJob {
	def alertsMailService
	def concurrent = false
	
	static triggers = {
      simple repeatInterval: 60L*1000L
    }

    def execute() {
		alertsMailService.sendAlerts()
    }
}
