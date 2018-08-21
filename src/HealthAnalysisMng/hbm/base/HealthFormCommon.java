package HealthAnalysisMng.hbm.base;

import java.sql.Timestamp;

/**
 * @author onesun.hbm.base
 *  wuhoushuang
 */
public class HealthFormCommon {
	
	/**
	 * dataId:TODO（primary key）
	 *
	 * @since Ver 1.1
	 */
	private String dataId;
	/**
	 * userId:TODO（用户ID）
	 * 
	 *
	 * @since Ver 1.1
	 */
	private String userId;
	/**
	 * memberCode:TODO（会员编号）
	 *
	 * @since Ver 1.1
	 */
	private String memberCode;
    /**
     * cardId:TODO（身份证号）
     *
     * @since Ver 1.1
     */
    private String cardId;
    /**
     * humenName:TODO（用户名）
     *
     * @since Ver 1.1
     */
    private String humenName;
    /**
     * genderAge:TODO（性别年龄）
     *
     * @since Ver 1.1
     */
    private String genderAge;
    /**
     * checkTime:TODO（监测时间）
     *
     * @since Ver 1.1
     */
    private Timestamp checkTime;
    /**
     * healthLevel:TODO（医疗等级）
     *
     * @since Ver 1.1
     */
    private String healthLevel;
    /**
     * seqNo:TODO（监测序列）
     *
     * @since Ver 1.1
     */
    private String seqNo;
    /**
     * previousCheckTime:TODO（前前次监测时间）
     *
     * @since Ver 1.1
     */
    private Timestamp previousCheckTime;
    /**
     * beforePreviousCheckTime:TODO（前一次监测时间）
     *
     * @since Ver 1.1
     */
    private Timestamp beforePreviousCheckTime;
    /**
     * nextInspectionDate:TODO（下一次监测时间）
     *
     * @since Ver 1.1
     */
    private Timestamp nextInspectionDate;
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
	 * memberCode
	 *
	 * @return  the memberCode
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getMemberCode() {
		return memberCode;
	}
	/**
	 * memberCode
	 *
	 * @param   memberCode    the memberCode to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	/**
	 * cardId
	 *
	 * @return  the cardId
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCardId() {
		return cardId;
	}
	/**
	 * cardId
	 *
	 * @param   cardId    the cardId to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	/**
	 * humenName
	 *
	 * @return  the humenName
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getHumenName() {
		return humenName;
	}
	/**
	 * humenName
	 *
	 * @param   humenName    the humenName to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setHumenName(String humenName) {
		this.humenName = humenName;
	}
	/**
	 * genderAge
	 *
	 * @return  the genderAge
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getGenderAge() {
		return genderAge;
	}
	/**
	 * genderAge
	 *
	 * @param   genderAge    the genderAge to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setGenderAge(String genderAge) {
		this.genderAge = genderAge;
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
	 * healthLevel
	 *
	 * @return  the healthLevel
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getHealthLevel() {
		return healthLevel;
	}
	/**
	 * healthLevel
	 *
	 * @param   healthLevel    the healthLevel to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setHealthLevel(String healthLevel) {
		this.healthLevel = healthLevel;
	}
	/**
	 * seqNo
	 *
	 * @return  the seqNo
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getSeqNo() {
		return seqNo;
	}
	/**
	 * seqNo
	 *
	 * @param   seqNo    the seqNo to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}
	/**
	 * previousCheckTime
	 *
	 * @return  the previousCheckTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getPreviousCheckTime() {
		return previousCheckTime;
	}
	/**
	 * previousCheckTime
	 *
	 * @param   previousCheckTime    the previousCheckTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPreviousCheckTime(Timestamp previousCheckTime) {
		this.previousCheckTime = previousCheckTime;
	}
	/**
	 * beforePreviousCheckTime
	 *
	 * @return  the beforePreviousCheckTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getBeforePreviousCheckTime() {
		return beforePreviousCheckTime;
	}
	/**
	 * beforePreviousCheckTime
	 *
	 * @param   beforePreviousCheckTime    the beforePreviousCheckTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBeforePreviousCheckTime(Timestamp beforePreviousCheckTime) {
		this.beforePreviousCheckTime = beforePreviousCheckTime;
	}
	/**
	 * nextInspectionDate
	 *
	 * @return  the nextInspectionDate
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getNextInspectionDate() {
		return nextInspectionDate;
	}
	/**
	 * nextInspectionDate
	 *
	 * @param   nextInspectionDate    the nextInspectionDate to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setNextInspectionDate(Timestamp nextInspectionDate) {
		this.nextInspectionDate = nextInspectionDate;
	}
	

}
