package wish

import org.hibernate.envers.Audited;

@Audited
class SubtotalExtra {

	String 			description
	String 			equation
		
	static constraints = {
		description blank:false, nullable: false
		equation blank:false, nullable: false
    }
	
	def getTotal(AluminumSubWish wish) {
		/* busco una referencia a una propiedad del pedido (por
		 * ahora solo puede ser el subtotal)*/
		def equationAdapt = this.equation?.replaceAll(/([^\$]*)\$\{([^\}]+)\}/) {
            def property = wish."${it[2]}"
            "${it[1]}${property}"
        }
		def shell = new GroovyShell()
		BigDecimal number = shell.evaluate( equationAdapt )
		return number
	}
	
	@Override 
	public String toString() {
		return "${description}"
	}
}
