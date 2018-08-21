package HealthAnalysisMng.hbm.base;

import java.sql.Timestamp;

import javax.persistence.Transient;

/**
 * ClassName:Electrocardio
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年12月13日		下午11:01:05
 *
 * @see 	 
 * 
 */
public class Electrocardio {
	/**
	 * dataId:TODO（primary key）
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
	 * apptype:TODO（软件类型）
	 *
	 * @since Ver 1.1
	 */
	private String apptype;
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
	 * pictureurl:TODO（图片值）
	 *
	 * @since Ver 1.1
	 */
	private String pictureurl;
	/**
	 * showTime:TODO（字符时间）
	 *
	 * @since Ver 1.1
	 */
	@Transient
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
	 * apptype
	 *
	 * @return  the apptype
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getApptype() {
		return apptype;
	}
	/**
	 * apptype
	 *
	 * @param   apptype    the apptype to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setApptype(String apptype) {
		this.apptype = apptype;
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
	 * pictureurl
	 *
	 * @return  the pictureurl
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getPictureurl() {
		return pictureurl;
	}
	/**
	 * pictureurl
	 *
	 * @param   pictureurl    the pictureurl to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
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
