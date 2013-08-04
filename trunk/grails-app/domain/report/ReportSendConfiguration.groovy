package report

import stakeholder.Stakeholder
import stakeholder.Contact
import java.text.DateFormat
import java.text.SimpleDateFormat
import org.hibernate.envers.Audited

@Audited
class ReportSendConfiguration {

	private static final DateFormat DATE_FORMAT = new SimpleDateFormat("H:mm")
	
	static hasMany = [contacts: Contact]
	
	Date	dateCreated
	Date	lastUpdated
	
	Date nextSendDate
	String hour
	Integer frequencyInDays
	String subject
	String body
	
	Stakeholder stakeholder
	Report report
	
	boolean active

	Date lastSentDate
	    
	static constraints = {
		nextSendDate nullable:false
		frequencyInDays nullable:true
		stakeholder nullable:false
		subject nullable:false,blank:false
		body nullable:false,blank:false,maxSize: 1000
		report nullable:false
		hour nullable:false,blank:false,matches: "^([0-1]?[0-9]|2[0-3]):([0-5][0-9])\$"
		lastSentDate nullable:true
    }
	
	Date getNextSendDateTime(){
		Date date = new Date(nextSendDate.getTime())
		Date hourInDate = DATE_FORMAT.parse(hour)
		date.set(hourOfDay:hourInDate.getAt(Calendar.HOUR_OF_DAY),minute:hourInDate.getAt(Calendar.MINUTE))
		return date
	}
	public String toString() {
		return stakeholder.toString()+": "+subject
	}
}
