package alert

import org.drools.builder.KnowledgeBuilder
import org.drools.definition.KnowledgePackage
import org.drools.io.Resource
import org.drools.runtime.Environment
import org.drools.runtime.StatefulKnowledgeSession
import org.drools.builder.ResourceType
import org.drools.KnowledgeBase
import org.drools.KnowledgeBaseFactory
import org.drools.SessionConfiguration
import org.drools.builder.KnowledgeBuilderFactory
import org.drools.io.ResourceFactory
import org.jbpm.process.instance.ProcessInstance
import wish.Wish

class AlertManagerService {

    static transactional = true

    def updateAlerts() {

		final KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder()

		
		String myGlobals = """import java.util.Date; import wish.Wish;"""
		Resource myResourceGlobals = ResourceFactory.newReaderResource((Reader) new StringReader(myGlobals))	
		kbuilder.add(myResourceGlobals,ResourceType.DRL)
		
		String myResources = """dialect "java" rule "Wish" when wish: Wish (wish.getCustomerOpNumber()<4) then System.out.println(wish.getOpNumber());System.out.println(wish.getDate("dateCreated")); end""";
		Resource myResource = ResourceFactory.newReaderResource((Reader) new StringReader(myResources))	
		kbuilder.add(myResource,ResourceType.DRL)
		
		if(kbuilder.hasErrors()){
			System.out.println(kbuilder.getErrors().toString())
		}
		
		final Collection<KnowledgePackage> pkgs = kbuilder.getKnowledgePackages()
		KnowledgeBase knowledgeBase = KnowledgeBaseFactory.newKnowledgeBase()
		knowledgeBase.addKnowledgePackages(pkgs)
		final StatefulKnowledgeSession ksession = knowledgeBase.newStatefulKnowledgeSession()
				
		def activeWishes = Wish.findAll().each{
			if(it.isActive()){
				ksession.insert(it)
			}
			
		}
		
		ksession.fireAllRules()
		ksession.dispose()	
		
    }
}
