package com.atai.dental.jasper.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.jasperreports.JasperReportsCsvView;

import com.atai.dental.jasper.form.JasperInputForm;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

@RestController
public class LoadJasperReport {
	
	@Autowired
	protected  DataSource LocalDataSource;
	@Autowired
	ServletContext ServeletContext;

	@PostMapping(value = "/GenerateReport")
	public ResponseEntity<JasperInputForm> GenerateReport(@RequestBody JasperInputForm object){
		
		String FormName = object.getFormName();
		String RealPath = ServeletContext.getRealPath("") + File.separator + "jasper" + File.separator + FormName;
		HashMap<String, Object> hParams = new HashMap<String, Object>();	
		byte[] bytes = null;
		OutputStream outputStream = null;
					
		File ReportFile = new File(RealPath + ".jasper");
		File PdfReportFile = new File(RealPath + ".pdf");
		if (!ReportFile.exists()){
			try {
				Connection conn = LocalDataSource.getConnection();
				JasperCompileManager.compileReportToFile(RealPath + ".jrxml", RealPath+".jasper");
				JasperReport JasperReport = (JasperReport) JRLoader.loadObjectFromFile(ReportFile.getPath());
				JasperPrint JaserPrint = JasperFillManager.fillReport(JasperReport, hParams, conn);
				
				bytes = JasperRunManager.runReportToPdf(JasperReport,hParams,conn);
				outputStream = new FileOutputStream(PdfReportFile);
				outputStream.write(bytes, 0, bytes.length);
				outputStream.flush();
				outputStream.close();
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		object.setPdfLocationUrl(PdfReportFile.getPath());
		return new ResponseEntity<JasperInputForm>(object, HttpStatus.OK);
	}
	
}
