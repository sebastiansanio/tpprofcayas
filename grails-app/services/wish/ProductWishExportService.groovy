package wish

import java.io.OutputStream;
import java.util.Date;
import java.util.Map;

import login.User
import modal.Country;
import modal.CriterionValue;
import modal.Port;
import modal.Ship;
import modal.ShippingMark;
import modal.TypeOfFreight
import modal.WishStatus
import org.springframework.context.MessageSource
import report.ProductWishReport
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
	
	def exportWish(OutputStream out,Locale locale,ProductWishReport report, ProductWish order) {
		Workbook wb = new XSSFWorkbook()
		
		Sheet sheet = wb.createSheet(messageSource.getMessage("productWish.export.sheet.label",null,locale))
		
		PrintSetup printSetup = sheet.getPrintSetup()
		printSetup.setLandscape(true)
		sheet.setFitToPage(true)
		sheet.setHorizontallyCenter(true)
		
		Map styles = createStyles(wb)
		
		Row row
		Cell cell
		
		addHeaderRow(sheet,0,"Importador",order.customer.toString(),styles["default"])
		addHeaderRow(sheet,1,"C.U.I.T.:",order.customer.cuit.toString(),styles["default"])
		addHeaderRow(sheet,2,"Proveedor:","POR FAVOR NO DECLARAR NOMBRE DEL PROVEEDOR",styles["default"])
		addHeaderRow(sheet,3,"Fecha de Delivery:",order.deliveryDate,styles["defaultDate"])
		addHeaderRow(sheet,4,"Fecha de arribo:",order.arrivalDate,styles["defaultDate"])
		addHeaderRow(sheet,5,"Anticipo: (SI TIENE O NO?):",order.hasAdvancedPayment?"SI":"NO",styles["defaultDate"])
		addHeaderRow(sheet,6,"FECHA Y MODO GIRO DE DIVISAS:",order.currencyExchangeInformation,styles["default"])
		addHeaderRow(sheet,7,"Flete:",order.freight,styles["default"])
		addHeaderRow(sheet,8,"Seguro:",order.insurance,styles["default"])
		addHeaderRow(sheet,9,"País de origen:",order.countryOfOrigin.toString(),styles["default"])
		addHeaderRow(sheet,10,"País de procedencia:",order.countryOfProcedence.toString(),styles["default"])
		addHeaderRow(sheet,11,"Condición de precio:",order.priceCondition.toString(),styles["default"])
		addHeaderRow(sheet,12,"Shipping mark:",order.shippingMark.toString(),styles["default"])
		addSingleHeaderRow(sheet,14,order.code,styles["defaultBorderedBold"])
		
		row = sheet.createRow(15)
		for(int i = 0; i < report.fields.size(); i++){
			cell = row.createCell(i)
			cell.setCellValue(messageSource.getMessage("productWishItem."+report.fields[i]+".label",null,locale))
			cell.setCellStyle(styles["defaultBordered"])
		}
		
		int rowIndex = 16
		
		for(ProductWishItem item: order.items){
			row = sheet.createRow(rowIndex)
			for(int i = 0; i < report.fields.size(); i++){
				cell = row.createCell(i)
				cell.setCellValue(item[report.fields[i]].toString())
				cell.setCellStyle(styles["defaultBordered"])
			}
			rowIndex += 1
		}
		
		wb.write(out)
	}
	
	private addHeaderRow(sheet,rowIndex,label,value,style){
		Cell cell
		Row row = sheet.createRow(rowIndex)
		cell = row.createCell(0)
		cell.setCellValue(label)
		cell.setCellStyle(style)
		cell = row.createCell(1)
		cell.setCellValue(value)
		cell.setCellStyle(style)
	}
	
	private addSingleHeaderRow(sheet,rowIndex,value,style){
		Cell cell
		Row row = sheet.createRow(rowIndex)
		cell = row.createCell(0)
		cell.setCellValue(value)
		cell.setCellStyle(style)
	}
	
	private static Map<String, CellStyle> createStyles(Workbook wb){
		Map<String, CellStyle> styles = new HashMap<String, CellStyle>();
		
		Font defaultFont = wb.createFont();
		defaultFont.setFontHeightInPoints((short)10);
		defaultFont.setFontName("Arial");
		
		Font boldFont = wb.createFont();
		boldFont.setFontHeightInPoints((short)10);
		boldFont.setFontName("Arial");
		boldFont.setBold(true)
		
		CellStyle style;
		
		style = wb.createCellStyle();
		style.setFont(defaultFont);
		style.setAlignment(CellStyle.ALIGN_LEFT);
		styles.put("default", style);
		
		style = wb.createCellStyle();
		style.setFont(defaultFont);
		style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		style.setBorderRight(XSSFCellStyle.BORDER_THIN);
		style.setBorderTop(XSSFCellStyle.BORDER_THIN);
		style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		style.setAlignment(CellStyle.ALIGN_LEFT);
		styles.put("defaultBordered", style);
		
		style = wb.createCellStyle();
		style.setFont(boldFont);
		style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		style.setBorderRight(XSSFCellStyle.BORDER_THIN);
		style.setBorderTop(XSSFCellStyle.BORDER_THIN);
		style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		style.setAlignment(CellStyle.ALIGN_CENTER);
		styles.put("defaultBorderedBold", style);
		
		style = wb.createCellStyle();
		CreationHelper createHelper = wb.getCreationHelper();
		style.setDataFormat(createHelper.createDataFormat().getFormat("d/m/yyyy"));
		style.setFont(defaultFont);
		style.setAlignment(CellStyle.ALIGN_LEFT);
		styles.put("defaultDate", style);

		return styles;
	}

}
