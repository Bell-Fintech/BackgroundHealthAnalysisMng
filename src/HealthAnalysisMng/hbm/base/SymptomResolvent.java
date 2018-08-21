/**
 * @author Brave Han
 *  2014年10月20日
 *  
 */
package HealthAnalysisMng.hbm.base;

import java.sql.Timestamp;

/**
 * @author onesun.hbm.base
 *体检表的症状子项  关联OuterHealthForm
 */
public class SymptomResolvent {
	private String dataId;
	private String userId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	private String sequence;
	private String symptomName;
	private String checkItem;
	private Double result;
	private String healthManagement;
	private Timestamp checkTime;
	
	public String getCheckItem() {
		return checkItem;
	}
	public void setCheckItem(String checkItem) {
		this.checkItem = checkItem;
	}
	public Timestamp getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Timestamp checkTime) {
		this.checkTime = checkTime;
	}
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	public String getSymptomName() {
		return symptomName;
	}
	public void setSymptomName(String symptomName) {
		this.symptomName = symptomName;
	}
	public Double getResult() {
		return result;
	}
	public void setResult(Double result) {
		this.result = result;
	}
	public String getHealthManagement() {
		return healthManagement;
	}
	public void setHealthManagement(String healthManagement) {
		this.healthManagement = healthManagement;
	}
	

}
