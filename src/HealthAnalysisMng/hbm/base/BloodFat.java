package HealthAnalysisMng.hbm.base;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * ClassName:BloodFat
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author  wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	2014年2月8日		下午8:34:21
 *
 * @see 	 
 * 
 */
public class BloodFat implements Serializable{
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
	 * TC:TODO（总胆固醇）
	 *
	 * @since Ver 1.1
	 */
	private Double TC;
	/**
	 * TG:TODO（甘油三脂）
	 *
	 * @since Ver 1.1
	 */
	private Double TG;
	/**
	 * HDL:TODO（高密度脂蛋白胆固醇）
	 *
	 * @since Ver 1.1
	 */
	private Double HDL;
	/**
	 * LDL:TODO（低密度脂蛋白胆固醇）
	 *
	 * @since Ver 1.1
	 */
	private Double LDL;
	/**
	 * flag:TODO（有效标识）
	 *
	 * @since Ver 1.1
	 */
	private String flag;
	/** 
	 *
	 * @return dataId 
	 *
	 */
	public String getDataId() {
		return dataId;
	}
	/**
	 *
	 * @param dataId the dataId to set
	 *
	 */
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	/** 
	 *
	 * @return userId 
	 *
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 *
	 * @param userId the userId to set
	 *
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/** 
	 *
	 * @return checkTime 
	 *
	 */
	public Timestamp getCheckTime() {
		return checkTime;
	}
	/**
	 *
	 * @param checkTime the checkTime to set
	 *
	 */
	public void setCheckTime(Timestamp checkTime) {
		this.checkTime = checkTime;
	}
	/** 
	 *
	 * @return indbTime 
	 *
	 */
	public Timestamp getIndbTime() {
		return indbTime;
	}
	/**
	 *
	 * @param indbTime the indbTime to set
	 *
	 */
	public void setIndbTime(Timestamp indbTime) {
		this.indbTime = indbTime;
	}
	/** 
	 *
	 * @return showTime 
	 *
	 */
	public String getShowTime() {
		return showTime;
	}
	/**
	 *
	 * @param showTime the showTime to set
	 *
	 */
	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
	/** 
	 *
	 * @return dataSource 
	 *
	 */
	public String getDataSource() {
		return dataSource;
	}
	/**
	 *
	 * @param dataSource the dataSource to set
	 *
	 */
	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}
	/** 
	 *
	 * @return tC 
	 *
	 */
	public Double getTC() {
		return TC;
	}
	/**
	 *
	 * @param tC the tC to set
	 *
	 */
	public void setTC(Double tC) {
		TC = tC;
	}
	/** 
	 *
	 * @return tG 
	 *
	 */
	public Double getTG() {
		return TG;
	}
	/**
	 *
	 * @param tG the tG to set
	 *
	 */
	public void setTG(Double tG) {
		TG = tG;
	}
	/** 
	 *
	 * @return hDL 
	 *
	 */
	public Double getHDL() {
		return HDL;
	}
	/**
	 *
	 * @param hDL the hDL to set
	 *
	 */
	public void setHDL(Double hDL) {
		HDL = hDL;
	}
	/** 
	 *
	 * @return lDL 
	 *
	 */
	public Double getLDL() {
		return LDL;
	}
	/**
	 *
	 * @param lDL the lDL to set
	 *
	 */
	public void setLDL(Double lDL) {
		LDL = lDL;
	}
	/** 
	 *
	 * @return flag 
	 *
	 */
	public String getFlag() {
		return flag;
	}
	/**
	 *
	 * @param flag the flag to set
	 *
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	

	
	

}
