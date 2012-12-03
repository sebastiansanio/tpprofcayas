package task


class DjaiStatus {

	String status
	
	static hasMany		= [djais: Djai]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return status;
	}
}
