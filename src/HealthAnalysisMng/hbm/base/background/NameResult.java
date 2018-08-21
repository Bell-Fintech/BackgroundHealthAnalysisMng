package HealthAnalysisMng.hbm.base.background;

import java.util.Date;
import java.util.List;

public class NameResult implements Cloneable{
	private String name;
	private Double result;
	private List<NameResult> resultList;
	private String scope;
	private Date date;
	private Integer healthNumber;
	private Integer subHealthNumber;
	private Integer patientNumber;
	private Integer highRiskNumber;
	
	
	public Integer getHealthNumber() {
		return healthNumber;
	}
	public void setHealthNumber(Integer healthNumber) {
		this.healthNumber = healthNumber;
	}
	public Integer getSubHealthNumber() {
		return subHealthNumber;
	}
	public void setSubHealthNumber(Integer subHealthNumber) {
		this.subHealthNumber = subHealthNumber;
	}
	public Integer getPatientNumber() {
		return patientNumber;
	}
	public void setPatientNumber(Integer patientNumber) {
		this.patientNumber = patientNumber;
	}
	public Integer getHighRiskNumber() {
		return highRiskNumber;
	}
	public void setHighRiskNumber(Integer highRiskNumber) {
		this.highRiskNumber = highRiskNumber;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getResult() {
		return result;
	}
	public void setResult(Double result) {
		this.result = result;
	}
	
	public List<NameResult> getResultList() {
		return resultList;
	}
	public void setResultList(List<NameResult> resultList) {
		this.resultList = resultList;
	}
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

}
