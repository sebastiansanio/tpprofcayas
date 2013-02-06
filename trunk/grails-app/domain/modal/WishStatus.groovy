package modal

import wish.Wish;

class WishStatus {


	String name
	String description
	
	static hasMany = [whishes: Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		name blank:false
		description nullable:true
    }
	
	public String toString() {
		return name;
	}
}
