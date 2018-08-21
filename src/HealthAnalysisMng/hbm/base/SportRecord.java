/**
 * @author Brave Han
 *  2014年11月19日
 *  
 */
package HealthAnalysisMng.hbm.base;

import java.sql.Timestamp;

/**
 * @author onesun.hbm.base
 *  Brave Han
 */
public class SportRecord {
	/**
	 * dataId:TODO（primary key）
	 *
	 * @since Ver 1.1
	 */
	private String dataId;
	/**
	 * userId:TODO（用户ｉｄ）
	 *
	 * @since Ver 1.1
	 */
	private String userId;
	/** 距离*/
	private Double distdance;
	/** 卡路里*/
	private Double calorie;
	/** 步数*/
	private Double stepNumber;
	/**
	 * startTime:TODO（开始时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp startTime;
	/**
	 * endTime:TODO（结束时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp endTime;
	/**
	 * inDBTime:TODO（入库时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp inDBTime;
	/**
	 * dataSource:TODO（数据来源）
	 *
	 * @since Ver 1.1
	 */
	private String dataSource;
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
	 * distdance
	 *
	 * @return  the distdance
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getDistdance() {
		return distdance;
	}
	/**
	 * distdance
	 *
	 * @param   distdance    the distdance to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setDistdance(Double distdance) {
		this.distdance = distdance;
	}
	/**
	 * calorie
	 *
	 * @return  the calorie
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getCalorie() {
		return calorie;
	}
	/**
	 * calorie
	 *
	 * @param   calorie    the calorie to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCalorie(Double calorie) {
		this.calorie = calorie;
	}
	/**
	 * stepNumber
	 *
	 * @return  the stepNumber
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getStepNumber() {
		return stepNumber;
	}
	/**
	 * stepNumber
	 *
	 * @param   stepNumber    the stepNumber to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setStepNumber(Double stepNumber) {
		this.stepNumber = stepNumber;
	}
	/**
	 * startTime
	 *
	 * @return  the startTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getStartTime() {
		return startTime;
	}
	/**
	 * startTime
	 *
	 * @param   startTime    the startTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	/**
	 * endTime
	 *
	 * @return  the endTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getEndTime() {
		return endTime;
	}
	/**
	 * endTime
	 *
	 * @param   endTime    the endTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
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
	
}
