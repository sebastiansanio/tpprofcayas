package wish


import aluminum.AluminumCalculator
import java.text.DateFormat
import java.text.SimpleDateFormat
import org.apache.poi.xssf.usermodel.*
import org.apache.poi.ss.usermodel.*
import org.apache.poi.ss.util.CellRangeAddress
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import product.Extra

class AluminumWishExportService {

	private static final DateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy")
	private static final ArrayList PRE_TITLES = ["JMA REF.","CUS CODE.","QUANTITY (PCS)","LENGTH(M)","Linear weight (kg/m)",
			"Net WEIGHT (KG)","FOB SHENZHEN 5,5% packing (USD/KG)","TOTAL AMOUNT", "", "WEIGHT (KG)",
			"FOB SHENZHEN WITHOUT 5,5% packing (USD/KG)","TOTAL AMOUNT","",	"Lingtong"]
	
	
	private static final ArrayList POST_TITLES = ["5,5% packing","Subtotal unit price","Total U\$S x Kg","","E2","U\$S Price x Piece"]
	
	
    static transactional = true

    def exportXlsx(AluminumWish aluminumWish, OutputStream out) {
		def calculator = new AluminumCalculator(aluminumWish)
		
		Set extras = new HashSet()
		for(subWish in aluminumWish.subWish){
			extras.addAll(subWish.extras)
		}		
		List extrasList = extras.toList().sort{it.description}
		List titles = new ArrayList()
		titles.addAll(PRE_TITLES)
		titles.addAll(extrasList*.description)
		titles.addAll(POST_TITLES)
		
		Workbook wb = new XSSFWorkbook()
		Sheet sheet = wb.createSheet("invoice-real")

        PrintSetup printSetup = sheet.getPrintSetup();
        printSetup.setLandscape(true);
        sheet.setFitToPage(true);
        sheet.setHorizontallyCenter(true);
		
		
		Map styles = createStyles(wb)
		Row row
		Cell cell
		
		row = sheet.createRow(0)
		
		cell = row.createCell(1)
		cell.setCellValue("Lingtong price")
		cell.setCellStyle(styles["defaultBordered"])
		cell = row.createCell(2)
		cell.setCellValue("Date")
		cell.setCellStyle(styles["defaultBordered"])
		
		row = sheet.createRow(1)
		
		cell = row.createCell(1)
		cell.setCellValue(aluminumWish.lintongx)
		cell.setCellStyle(styles["defaultBordered"])
		cell = row.createCell(2)
		cell.setCellValue(DATE_FORMAT.format(aluminumWish.dateCreated))
		cell.setCellStyle(styles["defaultBordered"])
		
		row = sheet.createRow(3)
		for(int i=0;i < titles.size(); i++){
			cell = row.createCell(i)
			cell.setCellValue(titles[i])
			cell.setCellStyle(styles["defaultBorderedBold"])
		}
		
		for(int j=0;j < aluminumWish.subWish.size(); j++){
			row = sheet.createRow(4+j)
			AluminumSubWish subWish = aluminumWish.subWish.get(j)
			addCell(row,0,subWish.aluminum.descriptionEN,styles)
			addCell(row,1,subWish.aluminum.cayasCode,styles)
			addCell(row,2,subWish.quantityPCS,styles)
			addCell(row,3,subWish.aluminum.length,styles)
			addCell(row,4,subWish.aluminum.theoricalWeight,styles)
			addCell(row,5,subWish.totalTheoricalWeight,styles)
			addCell(row,6,subWish.total.setScale(3, BigDecimal.ROUND_HALF_EVEN),styles)
			addCell(row,7,subWish.totalTheoricalWeight.multiply(subWish.total).setScale(2, BigDecimal.ROUND_HALF_EVEN),styles)
			
			addCell(row,9,subWish.totalTheoricalWeight.setScale(2, BigDecimal.ROUND_HALF_EVEN),styles)
			addCell(row,10,subWish.subtotal.setScale(2, BigDecimal.ROUND_HALF_EVEN),styles)
			addCell(row,11,subWish.totalTheoricalWeight.setScale(2, BigDecimal.ROUND_HALF_EVEN).multiply(subWish.subtotal).setScale(2, BigDecimal.ROUND_HALF_EVEN),styles)
			
			addCell(row,13,aluminumWish.lintongx,styles)
			
			int columnIndex = 14;
			for(Extra extra: extras){
				addCell(row,columnIndex,subWish.calculateExtraValue(extra),styles)
				columnIndex = columnIndex + 1
			}
			
			addCell(row,columnIndex,subWish.packing.setScale(2, BigDecimal.ROUND_HALF_EVEN),styles)
			columnIndex = columnIndex + 1
			addCell(row,columnIndex,subWish.subtotal.setScale(2, BigDecimal.ROUND_HALF_EVEN),styles)
			columnIndex = columnIndex + 1
			addCell(row,columnIndex,subWish.total.setScale(4, BigDecimal.ROUND_HALF_EVEN),styles)
			columnIndex = columnIndex + 1

			addCell(row,columnIndex,subWish.totalTheoricalWeight.setScale(2, BigDecimal.ROUND_HALF_EVEN).multiply(subWish.subtotal).multiply(new BigDecimal(1.1)).setScale(2, BigDecimal.ROUND_HALF_EVEN),styles)
			columnIndex = columnIndex + 1
			addCell(row,columnIndex,subWish.priceXpiece.setScale(4, BigDecimal.ROUND_HALF_EVEN),styles)
			columnIndex = columnIndex + 1
			
			
		}
		int endOfTable = 4 + aluminumWish.subWish.size() + 2
		
		addSummaryRecord(sheet, endOfTable, "FOB SHENZHEN WITHOUT 5,5 % packing", calculator.fobShenzhenWithoutPacking.setScale(2, BigDecimal.ROUND_HALF_EVEN), styles)
		addSummaryRecord(sheet, endOfTable+2, "FOB SHENZHEN with 5,5 %", calculator.fobShenzhenWithPacking.setScale(2, BigDecimal.ROUND_HALF_EVEN), styles)
		addSummaryRecord(sheet, endOfTable+4, "E1", calculator.getDifferentBetweenWithAndWithoutPacking().setScale(2, BigDecimal.ROUND_HALF_EVEN), styles)
		addSummaryRecord(sheet, endOfTable+6, "Amount to be declare at Chinesse custom", calculator.getAmountToBeDeclareAtChinesseCustom().setScale(2, BigDecimal.ROUND_HALF_EVEN), styles)
		addSummaryRecord(sheet, endOfTable+8, "Diferencia", calculator.different.setScale(2, BigDecimal.ROUND_HALF_EVEN), styles)
		addSummaryRecord(sheet, endOfTable+10, "10% de descuento por extras", calculator.getDiscountXextras().setScale(2, BigDecimal.ROUND_HALF_EVEN), styles)
		addSummaryRecord(sheet, endOfTable+12, "Diferencia final neta", calculator.getNetFinalDifference().setScale(2, BigDecimal.ROUND_HALF_EVEN), styles)
		
		for(int i=0;i < titles.size(); i++){
			sheet.autoSizeColumn(i)
		}
		
		wb.write(out)
    }
	
	private addSummaryRecord(sheet, int rowIndex, String name, BigDecimal value, styles){
		Cell cell
		
		Row row = sheet.createRow(rowIndex)
		cell = row.createCell(0)
		cell.setCellValue(name)
		cell.setCellStyle(styles["defaultBordered"])
		cell = row.createCell(1)
		cell.setCellValue(value)
		cell.setCellStyle(styles["defaultBordered"])
		
	}
	
	private addCell(row,i,value,styles){
		Cell cell = row.createCell(i)
		cell.setCellValue(value)
		cell.setCellStyle(styles["defaultBordered"])
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
        style.setBorderLeft(XSSFCellStyle.BORDER_THIN);             
        style.setBorderRight(XSSFCellStyle.BORDER_THIN);            
        style.setBorderTop(XSSFCellStyle.BORDER_THIN);              
        style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		style.setAlignment(CellStyle.ALIGN_CENTER);
		styles.put("defaultBordered", style);
		
		style = wb.createCellStyle();
		style.setFont(boldFont);
        style.setBorderLeft(XSSFCellStyle.BORDER_THIN);             
        style.setBorderRight(XSSFCellStyle.BORDER_THIN);            
        style.setBorderTop(XSSFCellStyle.BORDER_THIN);              
        style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		style.setAlignment(CellStyle.ALIGN_CENTER);
		styles.put("defaultBorderedBold", style);
		

		return styles;
	}
}
