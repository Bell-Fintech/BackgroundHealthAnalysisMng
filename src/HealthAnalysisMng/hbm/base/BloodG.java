package HealthAnalysisMng.hbm.base;
/**@anthor 
 * wuhoushuang
 * */
import java.io.Serializable;
import java.sql.Timestamp;

public class BloodG implements Serializable{
	/**
	 * dataId:TODO（primary key）
	 *
	 * @since Ver 1.1
	 */
	private  String dataId;
	/**
	 * userId:TODO（用户ＩＤ）
	 *
	 * @since Ver 1.1
	 */
	private String userId;
	/**
	 * checkTime:TODO（监测时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp checkTime;
	/**
	 * inDBTime:TODO（入库时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp inDBTime;
	/**
	 * showTime:TODO（字符时间）
	 *
	 * @since Ver 1.1
	 */
	private String showTime;
	/**
	 * dataSource:TODO（数据来源）
	 *
	 * @since Ver 1.1
	 */
	private String dataSource;
	/**
	 * BGFasting:TODO（餐前血糖）
	 *
	 * @since Ver 1.1
	 */
	private Double BGFasting;
	/**
	 * BGAfterMeal:TODO（餐后血糖）
	 *
	 * @since Ver 1.1
	 */
	private Double BGAfterMeal;
	/**
	 * checkResultOnly:TODO（唯一检查约束）
	 *
	 * @since Ver 1.1
	 */
	private String checkResultOnly;
	/**
	 * flag:TODO（有效标识）
	 *
	 * @since Ver 1.1
	 */
	private String flag;
	/**
	 * dataId
	 *
	 * @return  the dataId
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getDataId() {
		return dataId;
	}
	/**
	 * dataId
	 *
	 * @param   dataId    the dataId to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	/**
	 * userId
	 *
	 * @return  the userId
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getUserId() {
		return userId;
	}
	/**
	 * userId
	 *
	 * @param   userId    the userId to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * checkTime
	 *
	 * @return  the checkTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getCheckTime() {
		return checkTime;
	}
	/**
	 * checkTime
	 *
	 * @param   checkTime    the checkTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCheckTime(Timestamp checkTime) {
		this.checkTime = checkTime;
	}
	/**
	 * inDBTime
	 *
	 * @return  the inDBTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getInDBTime() {
		return inDBTime;
	}
	/**
	 * inDBTime
	 *
	 * @param   inDBTime    the inDBTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setInDBTime(Timestamp inDBTime) {
		this.inDBTime = inDBTime;
	}
	/**
	 * showTime
	 *
	 * @return  the showTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getShowTime() {
		return showTime;
	}
	/**
	 * showTime
	 *
	 * @param   showTime    the showTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
	/**
	 * dataSource
	 *
	 * @return  the dataSource
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getDataSource() {
		return dataSource;
	}
	/**
	 * dataSource
	 *
	 * @param   dataSource    the dataSource to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}
	/**
	 * bGFasting
	 *
	 * @return  the bGFasting
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBGFasting() {
		return BGFasting;
	}
	/**
	 * bGFasting
	 *
	 * @param   bGFasting    the bGFasting to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBGFasting(Double bGFasting) {
		BGFasting = bGFasting;
	}
	/**
	 * bGAfterMeal
	 *
	 * @return  the bGAfterMeal
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBGAfterMeal() {
		return BGAfterMeal;
	}
	/**
	 * bGAfterMeal
	 *
	 * @param   bGAfterMeal    the bGAfterMeal to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBGAfterMeal(Double bGAfterMeal) {
		BGAfterMeal = bGAfterMeal;
	}
	/**
	 * checkResultOnly
	 *
	 * @return  the checkResultOnly
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCheckResultOnly() {
		return checkResultOnly;
	}
	/**
	 * checkResultOnly
	 *
	 * @param   checkResultOnly    the checkResultOnly to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCheckResultOnly(String checkResultOnly) {
		this.checkResultOnly = checkResultOnly;
	}
	/**
	 * flag
	 *
	 * @return  the flag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getFlag() {
		return flag;
	}
	/**
	 * flag
	 *
	 * @param   flag    the flag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	

}
