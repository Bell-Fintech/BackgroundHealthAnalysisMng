package HealthAnalysisMng.hbm.base;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * ClassName:BloodPressure
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年2月9日		下午8:44:05
 *
 * @see 	 
 * 
 */
public class BloodPressure implements Serializable{
	
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
	/**
	 * checkSourceCode:TODO（检查资源码）
	 *
	 * @since Ver 1.1
	 */
	private String checkSourceCode;
	/**
	 * checkSource:TODO（监测来源）
	 *
	 * @since Ver 1.1
	 */
	private String checkSource;
	/**
	 * checkDeviceType:TODO（监测设备类型）
	 *
	 * @since Ver 1.1
	 */
	private String checkDeviceType;
	/**
	 * checkDeviceName:TODO（监测设备名）
	 *
	 * @since Ver 1.1
	 */
	private String checkDeviceName;
	/**
	 * hospitalCode:TODO（医疗机构编号）
	 *
	 * @since Ver 1.1
	 */
	private String hospitalCode;
	/**
	 * hospitalName:TODO（医疗机构名）
	 *
	 * @since Ver 1.1
	 */
	private String hospitalName;
	/**
	 * SBP:TODO（收缩压）
	 *
	 * @since Ver 1.1
	 */
	private Double SBP;
	/**
	 * DBP:TODO（平均压）
	 *
	 * @since Ver 1.1
	 */
	private Double DBP;
	/**
	 * MBP:TODO（舒张压）
	 *
	 * @since Ver 1.1
	 */
	private Double MBP;
	/**
	 * pulse:TODO（脉搏率）
	 *
	 * @since Ver 1.1
	 */
	private Double pulse;
	/**
	 * checkResultOnly:TODO（唯一检查约束）
	 *
	 * @since Ver 1.1
	 */
	private String checkResultOnly;
	/**
	 * checkTime:TODO（监测时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp checkTime;
	/**
	 * indbTime:TODO（入库时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp indbTime;
	/**
	 * flag:TODO（有效标识）
	 *
	 * @since Ver 1.1
	 */
	private String flag;
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
	 * checkSourceCode
	 *
	 * @return  the checkSourceCode
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCheckSourceCode() {
		return checkSourceCode;
	}
	/**
	 * checkSourceCode
	 *
	 * @param   checkSourceCode    the checkSourceCode to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCheckSourceCode(String checkSourceCode) {
		this.checkSourceCode = checkSourceCode;
	}
	/**
	 * checkSource
	 *
	 * @return  the checkSource
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCheckSource() {
		return checkSource;
	}
	/**
	 * checkSource
	 *
	 * @param   checkSource    the checkSource to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCheckSource(String checkSource) {
		this.checkSource = checkSource;
	}
	/**
	 * checkDeviceType
	 *
	 * @return  the checkDeviceType
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCheckDeviceType() {
		return checkDeviceType;
	}
	/**
	 * checkDeviceType
	 *
	 * @param   checkDeviceType    the checkDeviceType to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCheckDeviceType(String checkDeviceType) {
		this.checkDeviceType = checkDeviceType;
	}
	/**
	 * checkDeviceName
	 *
	 * @return  the checkDeviceName
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCheckDeviceName() {
		return checkDeviceName;
	}
	/**
	 * checkDeviceName
	 *
	 * @param   checkDeviceName    the checkDeviceName to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCheckDeviceName(String checkDeviceName) {
		this.checkDeviceName = checkDeviceName;
	}
	/**
	 * hospitalCode
	 *
	 * @return  the hospitalCode
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getHospitalCode() {
		return hospitalCode;
	}
	/**
	 * hospitalCode
	 *
	 * @param   hospitalCode    the hospitalCode to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setHospitalCode(String hospitalCode) {
		this.hospitalCode = hospitalCode;
	}
	/**
	 * hospitalName
	 *
	 * @return  the hospitalName
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getHospitalName() {
		return hospitalName;
	}
	/**
	 * hospitalName
	 *
	 * @param   hospitalName    the hospitalName to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	/**
	 * sBP
	 *
	 * @return  the sBP
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getSBP() {
		return SBP;
	}
	/**
	 * sBP
	 *
	 * @param   sBP    the sBP to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setSBP(Double sBP) {
		SBP = sBP;
	}
	/**
	 * dBP
	 *
	 * @return  the dBP
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getDBP() {
		return DBP;
	}
	/**
	 * dBP
	 *
	 * @param   dBP    the dBP to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setDBP(Double dBP) {
		DBP = dBP;
	}
	/**
	 * mBP
	 *
	 * @return  the mBP
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getMBP() {
		return MBP;
	}
	/**
	 * mBP
	 *
	 * @param   mBP    the mBP to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMBP(Double mBP) {
		MBP = mBP;
	}
	/**
	 * pulse
	 *
	 * @return  the pulse
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getPulse() {
		return pulse;
	}
	/**
	 * pulse
	 *
	 * @param   pulse    the pulse to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPulse(Double pulse) {
		this.pulse = pulse;
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
	 * indbTime
	 *
	 * @return  the indbTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getIndbTime() {
		return indbTime;
	}
	/**
	 * indbTime
	 *
	 * @param   indbTime    the indbTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setIndbTime(Timestamp indbTime) {
		this.indbTime = indbTime;
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
	  
	
	

}
