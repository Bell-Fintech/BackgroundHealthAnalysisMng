package HealthAnalysisMng.hbm.configEntity;

import java.sql.Timestamp;

/**@anthor Brave Han*/
public class UtilityConfig {

	private String dataID;
	private String userID;
	/**用户等级*/
	private String userLevel;
	/**创建时间*/
	private Timestamp createDate;
	/**结果单位*/
	private String operationAdmin;
	/**公式类型  example：BMI计算*/
	private String utilType;
	/**计算公式*/
	private String formula;
	/**代数个数*/
	private Integer formulaNum;
	/**需要的输入框计算单位和计算类型 example：身高cm 体重kg
	 * [{title:"身高",unit:"cm"},{title:"体重",unit:"kg",algebra:"A"}]*/
	private String jsonData; 
	private String flag;
	public String getDataID() {
		return dataID;
	}
	public String getJsonData() {
		return jsonData;
	}
	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}
	public void setDataID(String dataID) {
		this.dataID = dataID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getOperationAdmin() {
		return operationAdmin;
	}
	public void setOperationAdmin(String operationAdmin) {
		this.operationAdmin = operationAdmin;
	}
	public String getUtilType() {
		return utilType;
	}
	public void setUtilType(String utilType) {
		this.utilType = utilType;
	}
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}
	public Integer getFormulaNum() {
		return formulaNum;
	}
	public void setFormulaNum(Integer formulaNum) {
		this.formulaNum = formulaNum;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
}
