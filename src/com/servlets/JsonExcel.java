package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.data.excel.WriteExcel;

/**
 * Servlet implementation class JsonExcel
 */
@WebServlet("/JsonExcel")
public class JsonExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonExcel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		try{
			String directory = request.getServletContext().getInitParameter("file-upload");
			String fileName = "jsonToExcel.xlsx";
			 XSSFWorkbook workbook = new XSSFWorkbook(); 
			String datas =  request.getParameter("data");
			if(datas.equals("")){
				out.print("<h1>Données incorrectes</h1>");
			}else{
				String [] sheets = datas.split("&&");
				
				for(String sheet:sheets){
					String [] detailsSheet = sheet.split("##");
					String sheetName = detailsSheet[0];
					String [] sheetHeader = detailsSheet[1].split(";");
					Map<String, Object[]> data = extractedData(detailsSheet[2]);
					WriteExcel.createFile(sheetHeader, data, fileName, directory, workbook, sheetName);
				}
					
				out.print("<a href=\"/JsonToExcelFile/file/"+fileName+"\">Download your file</a>");
			}
		}catch(Exception e){
			out.print(e.getMessage());
		}
	}
	private Map<String, Object[]> extractedData(String content){
		 Map<String, Object[]> data = new TreeMap<String, Object[]>();
		 String [] cons = content.split("#");
		 Integer index = 0;
		 for(String s:cons){
			 data.put(index+"", s.split(";"));
			 index++;
		 }
		 
		 return data;
	}

}
