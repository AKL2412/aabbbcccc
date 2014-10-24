package com.data.excel;
import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
public class ReadExcel {
	public static void main(String[] args) 
    {
        try
        {
            FileInputStream file = new FileInputStream(new File("C:/Users/Junior Aby/Desktop/test.xlsx"));
 
            //Create Workbook instance holding reference to .xlsx file
            XSSFWorkbook workbook = new XSSFWorkbook(file);
            //Get first/desired sheet from the workbook
           Iterator<XSSFSheet> iterator = workbook.iterator();
           while(iterator.hasNext()){
        	   XSSFSheet sheet = iterator.next();
               System.out.println("\n"+sheet.getSheetName()+"\n-------------------------");
               //Iterate through each rows one by one
               Iterator<Row> rowIterator = sheet.iterator();
               System.out.print(Cell.CELL_TYPE_BLANK+" blank \n"+
                       Cell.CELL_TYPE_BOOLEAN+" boolean \n"+
                        		Cell.CELL_TYPE_ERROR+" errro \n"+
                       Cell.CELL_TYPE_FORMULA+" formula \n"+
                        		Cell.CELL_TYPE_NUMERIC+" numeric \n"+
                       Cell.CELL_TYPE_STRING+" string");
               while (rowIterator.hasNext()) 
               {
                   Row row = rowIterator.next();
                   //For each row, iterate through all the columns
                   Iterator<Cell> cellIterator = row.cellIterator();
                   
                   while (cellIterator.hasNext()) 
                   {
                       Cell cell = cellIterator.next();
                       //Check the cell type and format accordingly
                       
                       switch (cell.getCellType()) 
                       {
                           case Cell.CELL_TYPE_NUMERIC:
                               System.out.print(cell.getNumericCellValue()+ "\t\t");
                               break;
                           case Cell.CELL_TYPE_STRING:
                               System.out.print(cell.getStringCellValue() + "\t\t");
                               break;
                           case Cell.CELL_TYPE_BLANK:
                               System.out.print(cell.getCellComment()+ "\t\t");
                               break;
                           case Cell.CELL_TYPE_ERROR:
                               System.out.print(cell.getErrorCellValue() + "\t\t");
                               break;
                           case Cell.CELL_TYPE_FORMULA:
                               System.out.print(cell.getCellFormula() + "\t\t");     
                       }
                   }
                   System.out.println("");
               }
           }
            file.close();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
}
