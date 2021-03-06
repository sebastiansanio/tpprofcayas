package modal
import org.hibernate.envers.Audited

@Audited
class DocumentType {

	String name
	String type
	boolean requiresVisa	
	boolean isBl
	
    static mapping = {
    }
    
	static constraints = {
		name unique:true
		type nullable:false,inList: ["phase1","phase2", "bothPhases"]
    }
	
	public isPhase1(){
		return type == "phase1" || type == "bothPhases"
	}
	
	public isPhase2(){
		return type == "phase2" || type == "bothPhases"
	}
	
	public String toString() {
		return name
	}
}
