package schedule


class ReportsMailingJob {
	def wishMailService
	def concurrent = false
	
	static triggers = {
      simple repeatInterval: 60L*1000L
    }

    def execute() {
		wishMailService.sendReports()
    }
}
