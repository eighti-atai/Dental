package com.atai.dental.report.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsCsvView;
import org.springframework.ui.Model;

import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.invent.model.InventoryPart;
import com.atai.dental.report.record.ReportRec;
import com.atai.dental.report.record.ReportRecInvoicePatientTreatment;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;

@RestController
public class Report{
	
	
	@Autowired
	protected  DataSource LocalDataSource;
	@Autowired
	ServletContext ServeletContext;
	
	@GetMapping(value = "/loadjspreport")
    public ModelAndView loadSurveyPg() {
		ModelAndView view = new ModelAndView("loadjspreport");
 
        return view;
}

	@PostMapping(value = "/GenerateReport")
	public ResponseEntity<ReportRec> GenerateReport(ReportRec object){	
		HashMap<String, Object> hParams;
		String FormName = object.getFormName();
		String RealPath = ServeletContext.getRealPath("") + File.separator + "report" + File.separator + FormName;		
		byte[] bytes = null;
		OutputStream outputStream = null;
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		File ReportFile = new File(RealPath + timestamp +".jasper");
		File PdfReportFile = new File(RealPath + timestamp + ".pdf");
		System.out.println(timestamp);
		if (!ReportFile.exists()){
			try {
				Connection conn = LocalDataSource.getConnection();
				hParams = object.setReportParams();
				
				JasperCompileManager.compileReportToFile(RealPath + ".jrxml", ReportFile.getPath());
				JasperReport JasperReport = (JasperReport) JRLoader.loadObjectFromFile(ReportFile.getPath());
				JasperPrint JaserPrint = JasperFillManager.fillReport(JasperReport, hParams, conn);
			
				bytes = JasperRunManager.runReportToPdf(JasperReport,hParams,conn);
				outputStream = new FileOutputStream(PdfReportFile);
				outputStream.write(bytes);
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
		//object.setPdfLocationUrl(PdfReportFile.getPath());
		return new ResponseEntity<ReportRec>(HttpStatus.OK);
	}
	
}
