package schedule


class AlertsMailingJob {
	def alertManagerService
	def alertsMailService
	def concurrent = false
	
	static triggers = {
      simple repeatInterval: 60L*1000L*120L
    }

    def execute() {
		alertManagerService.checkAllAlerts()
		alertManagerService.generateAllAlerts()
		alertsMailService.sendAlerts()
    }
}
