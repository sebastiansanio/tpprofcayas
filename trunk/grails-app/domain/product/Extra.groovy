package product

import org.hibernate.envers.Audited;
import wish.AluminumSubWish;

@Audited
class Extra {
		
	String 			description
	String 			equation
		
	static constraints = {
		description blank:false, nullable: false
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
	public String toString() {
		return "${description}";
	}
}
