package com.data.excel;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class WriteExcel {
	
	public static boolean createFile(Object [] header,Map<String, Object[]> data,String fileName,String directory,XSSFWorkbook workbook,String sheetName ){
		
		//Create a blank sheet
        XSSFSheet sheet = workbook.createSheet(sheetName);
        int rownum = 0;
        
        //Make header 
        Row headerrow = sheet.createRow(rownum++);
        int cellnume = 0;
        for (Object obj : header)
        {
           Cell cell = headerrow.createCell(cellnume++);
           if(obj instanceof String){
                cell.setCellValue((String)obj);
           }
            else if(obj instanceof Integer){
                cell.setCellValue((Integer)obj);
            }
        }
        
        
        Set<String> keyset = data.keySet();
        for (String key : keyset)
        {
            Row row = sheet.createRow(rownum++);
            Object [] objArr = data.get(key);
            int cellnum = 0;
            for (Object obj : objArr)
            {
               Cell cell = row.createCell(cellnum++);
               if(obj instanceof String){
                    cell.setCellValue((String)obj);
               }
                else if(obj instanceof Integer){
                    cell.setCellValue((Integer)obj);
                }
            }
        }
        
        try
        {
            //Write the workbook in file system
            FileOutputStream out = new FileOutputStream(new File(directory+fileName));
            workbook.write(out);
            out.close();
            System.out.println("howtodoinjava_demo.xlsx written successfully on disk.");
            return true;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
            return false;
        }
        
        
        
        
		
	}
	/*
	 public static void main(String[] args) 
	    {
	        //Blank workbook
	        XSSFWorkbook workbook = new XSSFWorkbook(); 
	         
	        //Create a blank sheet
	        XSSFSheet sheet = workbook.createSheet("Employee Data");
	        
	        XSSFSheet playeur = workbook.createSheet("Playeurs Data");
	        
	        //This data needs to be written (Object[])
	        Map<String, Object[]> data = new TreeMap<String, Object[]>();
	        data.put("1", new Object[] {"ID", "NAME", "LASTNAME"});
	        data.put("2", new Object[] {1, "Amit", "Shukla"});
	        data.put("3", new Object[] {2, "Lokesh", "Gupta"});
	        data.put("4", new Object[] {3, "John", "Adwards"});
	        data.put("5", new Object[] {4, "Brian", "Schultz"});
	          
	        //Iterate over data and write to sheet
	        Set<String> keyset = data.keySet();
	        int rownum = 0;
	        for (String key : keyset)
	        {
	            Row row = sheet.createRow(rownum);
	            Row rowp = playeur.createRow(rownum++);
	            Object [] objArr = data.get(key);
	            int cellnum = 0;
	            for (Object obj : objArr)
	            {
	               Cell cell = row.createCell(cellnum);
	               Cell cellp = rowp.createCell(cellnum++);
	               if(obj instanceof String){
	                    cell.setCellValue((String)obj);
	                    cellp.setCellValue((String)obj);
	               }
	                else if(obj instanceof Integer){
	                    cell.setCellValue((Integer)obj);
	                    cellp.setCellValue((Integer)obj);
	                }
	            }
	        }
	        
	      //This data needs to be written (Object[])
	     
	        try
	        {
	            //Write the workbook in file system
	            FileOutputStream out = new FileOutputStream(new File("C:/Users/Junior Aby/Desktop/TutoVideo/howtodoinjava_demo.xlsx"));
	            workbook.write(out);
	            out.close();
	            System.out.println("howtodoinjava_demo.xlsx written successfully on disk.");
	        } 
	        catch (Exception e) 
	        {
	            e.printStackTrace();
	        }
	    }
	 //*/
}
