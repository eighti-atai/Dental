package com.atai.dental.jasper.form;

import org.hibernate.validator.constraints.NotEmpty;

public class JasperInputForm {
	
	@NotEmpty
	private String FormName;
	private String PatientName;
	private String PdfLocationUrl;
	public String getPdfLocationUrl() {
		return PdfLocationUrl;
	}
	public void setPdfLocationUrl(String pdfLocationUrl) {
		PdfLocationUrl = pdfLocationUrl;
	}
	public String getFormName() {
		return FormName;
	}
	public void setFormName(String formName) {
		FormName = formName;
	}
	public String getPatientName() {
		return PatientName;
	}
	public void setPatientName(String patientName) {
		PatientName = patientName;
	}

}
