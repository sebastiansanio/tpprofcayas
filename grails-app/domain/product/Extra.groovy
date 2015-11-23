package product

import org.hibernate.envers.Audited;
import wish.AluminumSubWish;
import stakeholder.Supplier

@Audited
class Extra {
		
	static belongsTo = Supplier
	static hasMany = [ suppliers: Supplier ]

	String 			description
	String 			equation


	static constraints = {
		description blank:false, nullable: false, unique: true
		equation blank:false, nullable: false
    }
	
	def getTotal(Aluminum aluminum) {
		/* busco una referencia a una propiedad del aluminio para
		obtener el valor correspondiente del objeto recibido por parámetro*/
		def equationAdapt = this.equation?.replaceAll(/([^\$]*)\$\{([^\}]+)\}/) {
            def property = aluminum."${it[2]}"
            "${it[1]}${property}"
        }
		def shell = new GroovyShell()
		BigDecimal number = shell.evaluate( equationAdapt )
		return number
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final Extra other = (Extra) obj;
		if (!this.description.equals(other.description)) {
			return false;
		}
		return true;
	}
	 
	@Override
	public int hashCode() {
		
		return description.hashCode();
	}
	
	@Override 
	public String toString() {
		return "${description}";
	}
}
