/**
 * UserLog.java
 * onesun.model
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年3月14日 		DingMingLiang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.model;

import java.sql.Timestamp;
import java.util.Date;

/**
 * ClassName:UserLog Function: TODO ADD FUNCTION Reason: TODO ADD REASON
 *
 * @author DingMingLiang
 * @version
 * @since Ver 1.1
 * @Date 2015年3月14日 下午2:04:19
 *
 * @see
 * 
 */
public class UserLogModel {
	
	private String logId;
	private String active;
	private String content;
	private Timestamp time;
	private String detail;
	private String userName;
	private String loginIp;
	private String operationIp;
	private Date startTime;
	private Date endTime;
	/**
	 * logId
	 *
	 * @return  the logId
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getLogId() {
		return logId;
	}
	/**
	 * logId
	 *
	 * @param   logId    the logId to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setLogId(String logId) {
		this.logId = logId;
	}
	/**
	 * active
	 *
	 * @return  the active
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getActive() {
		return active;
	}
	/**
	 * active
	 *
	 * @param   active    the active to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setActive(String active) {
		this.active = active;
	}
	/**
	 * content
	 *
	 * @return  the content
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getContent() {
		return content;
	}
	/**
	 * content
	 *
	 * @param   content    the content to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * time
	 *
	 * @return  the time
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getTime() {
		return time;
	}
	/**
	 * time
	 *
	 * @param   time    the time to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setTime(Timestamp time) {
		this.time = time;
	}
	/**
	 * detail
	 *
	 * @return  the detail
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getDetail() {
		return detail;
	}
	/**
	 * detail
	 *
	 * @param   detail    the detail to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	/**
	 * userName
	 *
	 * @return  the userName
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getUserName() {
		return userName;
	}
	/**
	 * userName
	 *
	 * @param   userName    the userName to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * loginIp
	 *
	 * @return  the loginIp
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getLoginIp() {
		return loginIp;
	}
	/**
	 * loginIp
	 *
	 * @param   loginIp    the loginIp to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	/**
	 * operationIp
	 *
	 * @return  the operationIp
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getOperationIp() {
		return operationIp;
	}
	/**
	 * operationIp
	 *
	 * @param   operationIp    the operationIp to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setOperationIp(String operationIp) {
		this.operationIp = operationIp;
	}
	/**
	 * startTime
	 *
	 * @return  the startTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Date getStartTime() {
		return startTime;
	}
	/**
	 * startTime
	 *
	 * @param   startTime    the startTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	/**
	 * endTime
	 *
	 * @return  the endTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Date getEndTime() {
		return endTime;
	}
	/**
	 * endTime
	 *
	 * @param   endTime    the endTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
}
