package HealthAnalysisMng.hbm.base;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
/**
 * @author brave Han
 * @Message 用户运动轨迹数据
 * */
/**
 * ClassName:TrackAction
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   bravehan
 * @version  
 * @since    Ver 1.1
 * @Date	 2015	2015年3月14日		上午12:48:21
 *
 * @see 	 
 * 
 */
public class TrackAction implements Serializable{

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
	 * dataSource:TODO（数据来源）
	 *
	 * @since Ver 1.1
	 */
	private String dataSource;
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
	 * beginTime:TODO（开始时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp beginTime;
	/**
	 * endTime:TODO（结束时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp endTime;
	/**
	 * showTime:TODO（字符时间）
	 *
	 * @since Ver 1.1
	 */
	private String showTime;
	/**
	 * coord:TODO（ｔｙｐｅ：ｌｏｎｇｔｅｘｔ）
	 *
	 * @since Ver 1.1
	 */
	private String coord;//字符串格式经过工具类解析成TrackActionDataXY对象
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
	 * beginTime
	 *
	 * @return  the beginTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getBeginTime() {
		return beginTime;
	}
	/**
	 * beginTime
	 *
	 * @param   beginTime    the beginTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
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
	 * coord
	 *
	 * @return  the coord
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCoord() {
		return coord;
	}
	/**
	 * coord
	 *
	 * @param   coord    the coord to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCoord(String coord) {
		this.coord = coord;
	}
}
