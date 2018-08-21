package HealthAnalysisMng.hbm.base;

import java.sql.Timestamp;
/**
 * ClassName:HighWeight
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年11月12日		下午11:52:57
 *
 * @see 	 
 * 
 */
public class HighWeight implements java.io.Serializable {
    // Fields    
     /**
     * dataId:TODO（ｐｒｉｍａｒｙ　ｋｅｙ）
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
     * checkSourceCode:TODO（监测来源编码）
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
     * checkDeviceType:TODO（设备类型）
     *
     * @since Ver 1.1
     */
    private String checkDeviceType;
     /**
     * checkDeviceName:TODO（设备名称）
     *
     * @since Ver 1.1
     */
    private String checkDeviceName;
     /**
     * hospitalCode:TODO（医疗编码）
     *
     * @since Ver 1.1
     */
    private String hospitalCode;
     /**
     * hospitalName:TODO（医疗机构）
     *
     * @since Ver 1.1
     */
    private String hospitalName;
     /**
     * height:TODO（身高）
     *
     * @since Ver 1.1
     */
    private Double height;
     /**
     * weight:TODO（体重）
     *
     * @since Ver 1.1
     */
    private Double weight;
     /**
     * bmi:TODO（身高体重比）
     *
     * @since Ver 1.1
     */
    private Double bmi;
     /**
     * checkResultOnly:TODO（唯一监测约束）
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
    // Constructors
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
	 * height
	 *
	 * @return  the height
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getHeight() {
		return height;
	}
	/**
	 * height
	 *
	 * @param   height    the height to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setHeight(Double height) {
		this.height = height;
	}
	/**
	 * weight
	 *
	 * @return  the weight
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getWeight() {
		return weight;
	}
	/**
	 * weight
	 *
	 * @param   weight    the weight to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	/**
	 * bmi
	 *
	 * @return  the bmi
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBmi() {
		return bmi;
	}
	/**
	 * bmi
	 *
	 * @param   bmi    the bmi to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBmi(Double bmi) {
		this.bmi = bmi;
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