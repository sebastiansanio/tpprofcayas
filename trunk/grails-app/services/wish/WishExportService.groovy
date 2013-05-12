package wish

import java.io.OutputStream;
import java.util.Date;

import login.User
import modal.Country;
import modal.CriterionValue;
import modal.Port;
import modal.Ship;
import modal.ShippingMark;
import modal.TypeOfFreight
import org.springframework.context.MessageSource
import report.Report
import stakeholder.*
import org.springframework.context.MessageSource
import org.springframework.context.MessageSourceAware


class WishExportService implements MessageSourceAware {

    static transactional = true
	def exportService
	MessageSource messageSource
	
	
	def exportWishByStakeholder(String format,OutputStream outputStream,Locale locale,def stakeholder){
		Report report = stakeholder.defaultReport
		
		List fields = report.fields
		List wishes = new ArrayList()
		wishes.addAll(stakeholder.wishes)
		wishes.sort{it.opNumber}
		
		if(report.pendingOnly==true)
			wishes = wishes.findAll{
				it.isActive()
			}
				
		doExport(format,outputStream,locale,fields,wishes)
	}
	
	def exportWish(String format,OutputStream outputStream,Locale locale,long reportId) {

		Report report = Report.get(reportId)
		
		List wishes = Wish.list(sort:'opNumber')
		
		if(report.pendingOnly==true)
			wishes = wishes.findAll{
				it.isActive()
			}
		
		doExport(format,outputStream,locale,report.fields,wishes)
	}
	
	
	
	def doExport(String format,OutputStream outputStream,Locale locale,List fields,List wishes){	
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")
		}
		Map labels = new HashMap()
		Map formatters = new HashMap()
		def wishDomainClass = new Wish().domainClass
				
		fields.each{
			labels.put(it, messageSource.getMessage("wish."+it+".label",null,locale))
			if(wishDomainClass.getPropertyByName(it).type == Date)
				formatters.put(it, dateFormatter)
		}
		Map parameters = [title: messageSource.getMessage("wish.label",null,locale)]
		exportService.export(format,outputStream,wishes,fields,labels,formatters,parameters)
	}

}
