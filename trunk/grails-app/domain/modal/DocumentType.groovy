package modal

class DocumentType {

	String name
	String type
		
    static mapping = {
    }
    
	static constraints = {
		name unique:true
		type nullable:false,inList: ["documentType.phase1.label","documentType.phase2.label", "documentType.bothPhases.label"]
    }
	
	public isPhase1(){
		return type == "documentType.phase1.label" || type == "documentType.bothPhases.label"
	}
	
	public isPhase2(){
		return type == "documentType.phase2.label" || type == "documentType.bothPhases.label"
	}

	public String toString() {
		return name
	}
}
