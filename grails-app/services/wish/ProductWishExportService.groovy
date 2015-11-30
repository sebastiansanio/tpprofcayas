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
import org.apache.poi.xssf.usermodel.*
import org.apache.poi.ss.usermodel.*
import org.apache.poi.ss.util.CellRangeAddress
import org.apache.poi.hssf.usermodel.HSSFWorkbook

class ProductWishExportService implements MessageSourceAware {

    static transactional = true
	def exportService
	MessageSource messageSource
	
	def exportWish(OutputStream outputStream,Locale locale,Report report, ProductWish order) {
		Workbook wb = new XSSFWorkbook()
		Sheet sheet = wb.createSheet(messageSource.getMessage("default.boolean.true",null,locale))
		
		PrintSetup printSetup = sheet.getPrintSetup()
		printSetup.setLandscape(true)
		sheet.setFitToPage(true)
		sheet.setHorizontallyCenter(true)
		
		wb.write(out)
		
	}

}
