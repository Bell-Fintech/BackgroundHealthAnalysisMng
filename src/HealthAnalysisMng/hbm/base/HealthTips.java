package HealthAnalysisMng.hbm.base;

import java.io.Serializable;

/**
 * ClassName:HealthTips
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年11月8日		下午11:50:01
 *
 * @see 	 
 * 
 */
public class HealthTips implements Serializable{
	/**
	 * adviceid:TODO（primary key）
	 *
	 * @since Ver 1.1
	 */
	private String adviceid;
	/**
	 * advicecontent:TODO（消息串）
	 *
	 * @since Ver 1.1
	 */
	private String advicecontent;
	/**
	 * kbtype:TODO（信息类型）
	 *
	 * @since Ver 1.1
	 */
	private String kbtype;
	/**
	 * flag:TODO（有效标识）
	 *
	 * @since Ver 1.1
	 */
	private String flag;
	/**
	 * adviceid
	 *
	 * @return  the adviceid
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getAdviceid() {
		return adviceid;
	}
	/**
	 * adviceid
	 *
	 * @param   adviceid    the adviceid to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setAdviceid(String adviceid) {
		this.adviceid = adviceid;
	}
	/**
	 * advicecontent
	 *
	 * @return  the advicecontent
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getAdvicecontent() {
		return advicecontent;
	}
	/**
	 * advicecontent
	 *
	 * @param   advicecontent    the advicecontent to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setAdvicecontent(String advicecontent) {
		this.advicecontent = advicecontent;
	}
	/**
	 * kbtype
	 *
	 * @return  the kbtype
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getKbtype() {
		return kbtype;
	}
	/**
	 * kbtype
	 *
	 * @param   kbtype    the kbtype to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setKbtype(String kbtype) {
		this.kbtype = kbtype;
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
