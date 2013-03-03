package modal

class AvailableLocale {
	
	Date	dateCreated
	Date	lastUpdated

	String language
	String country
		
    static mapping = {
    }
    
	static constraints = {
    }
	
	Locale getLocale(){
		Locale locale = new Locale(language,country)
		return locale
	}
	
	public String toString() {
		return language + " (" + country + ")"
	}
}
