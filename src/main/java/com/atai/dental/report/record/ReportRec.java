package com.atai.dental.report.record;

import java.util.HashMap;

import org.hibernate.validator.constraints.NotEmpty;

public class ReportRec {
	
	@NotEmpty
	private String formName;
	private String pdfLocationUrl;
	public String getPdfLocationUrl() {
		return pdfLocationUrl;
	}
	public void setPdfLocationUrl(String pdfLocationUrl) {
		this.pdfLocationUrl = pdfLocationUrl;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	
	public HashMap<String, Object> setReportParams(){
		HashMap<String, Object> hParams = new HashMap<String, Object>();	
		return hParams;
	}

}
