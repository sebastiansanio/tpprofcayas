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
import modal.WishStatus
import org.springframework.context.MessageSource
import report.Report
import stakeholder.*
import org.springframework.context.MessageSource
import org.springframework.context.MessageSourceAware


class WishExportService implements MessageSourceAware {

    static transactional = true
	def exportService
	MessageSource messageSource
	
	def exportWishByWishStatus(String format,OutputStream outputStream,Locale locale,WishStatus wishStatus,Report report){
		List fields = report.fields
		List wishes = new ArrayList()
		wishes.addAll(wishStatus.wishes)
		
		if(report.pendingOnly==true){
			wishes = wishes.findAll{
				it.isPending()
			}
		}
		wishes = wishes.sort{it.opNumber}
		doExport(format,outputStream,locale,fields,wishes)
	}
	
	
	def exportWishByStakeholder(String format,OutputStream outputStream,Locale locale,def stakeholder){
		Report report = stakeholder.defaultReport
		exportWishByStakeholder(format,outputStream,locale,stakeholder,report)
	}
	
	def exportWishByStakeholder(String format,OutputStream outputStream,Locale locale,def stakeholder,Report report){
		List fields = report.fields
		List wishes = new ArrayList()
		wishes.addAll(stakeholder.wishes)
		
		if(report.pendingOnly==true){
			wishes = wishes.findAll{
				it.isPending()
			}
		}
		wishes = wishes.sort{it.opNumber}
		doExport(format,outputStream,locale,fields,wishes)		
		return wishes.size()
	}
	
	
	def exportWish(String format,OutputStream outputStream,Locale locale,long reportId) {
		Report report = Report.get(reportId)
		List wishes = Wish.list(sort:'opNumber')
		if(report.pendingOnly==true)
			wishes = wishes.findAll{
				it.isPending()
			}
		doExport(format,outputStream,locale,report.fields,wishes)
	}
	
	
	
	def getMaxWidth(List wishes,String fieldName,int initialMaxWidth){
		int maxWidth = initialMaxWidth
		wishes.each{
			if(it[fieldName].toString().length()>maxWidth){
				maxWidth = it[fieldName].toString().length()
			}
		}
		return maxWidth * 1.2
	}
	
	def doExport(String format,OutputStream outputStream,Locale locale,List fields,List wishes){	
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")
		}
		def booleanFormatter = {domain, value->
			return value?messageSource.getMessage("default.boolean.true",null,locale):messageSource.getMessage("default.boolean.false",null,locale)
		}
		Map labels = new HashMap()
		Map formatters = new HashMap()
		def wishDomainClass = new Wish().domainClass
		
		List widths = new ArrayList()
				
		fields.each{
			String label = messageSource.getMessage("wish."+it+".label",null,locale)
			labels.put(it, label)
			if(wishDomainClass.getPropertyByName(it).type == Date)
				formatters.put(it, dateFormatter)
			if(wishDomainClass.getPropertyByName(it).type == boolean)
				formatters.put(it, booleanFormatter)
			widths.add(getMaxWidth(wishes,it,label.length()))
		}
		Map parameters = [title: messageSource.getMessage("wish.label",null,locale),'column.widths':widths]
		exportService.export(format,outputStream,wishes,fields,labels,formatters,parameters)
	}

}
