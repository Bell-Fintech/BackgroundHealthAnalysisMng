package HealthAnalysisMng.hbm.base;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * ClassName:Waistline
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年11月25日		上午12:50:26
 *
 * @see 	 
 * 
 */
public class Waistline implements Serializable{
	/**
	 * dataId:TODO（primary key ）
	 *
	 * @since Ver 1.1
	 */
	private String dataId;
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
	 * bust:TODO（胸围）
	 *
	 * @since Ver 1.1
	 */
	private Double bust;
	/**
	 * waistline:TODO（腰围）
	 *
	 * @since Ver 1.1
	 */
	private Double waistline;
	/**
	 * HIPS:TODO（臀围）
	 *
	 * @since Ver 1.1
	 */
	private Double HIPS;
	/**
	 * WHR:TODO（腰臀比）
	 *
	 * @since Ver 1.1
	 */
	private Double WHR;
	/**
	 * checkResultOnly:TODO（唯一监测约束）
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
	 * bust
	 *
	 * @return  the bust
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBust() {
		return bust;
	}
	/**
	 * bust
	 *
	 * @param   bust    the bust to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBust(Double bust) {
		this.bust = bust;
	}
	/**
	 * waistline
	 *
	 * @return  the waistline
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getWaistline() {
		return waistline;
	}
	/**
	 * waistline
	 *
	 * @param   waistline    the waistline to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setWaistline(Double waistline) {
		this.waistline = waistline;
	}
	/**
	 * hIPS
	 *
	 * @return  the hIPS
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getHIPS() {
		return HIPS;
	}
	/**
	 * hIPS
	 *
	 * @param   hIPS    the hIPS to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setHIPS(Double hIPS) {
		HIPS = hIPS;
	}
	/**
	 * wHR
	 *
	 * @return  the wHR
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getWHR() {
		return WHR;
	}
	/**
	 * wHR
	 *
	 * @param   wHR    the wHR to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setWHR(Double wHR) {
		WHR = wHR;
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
