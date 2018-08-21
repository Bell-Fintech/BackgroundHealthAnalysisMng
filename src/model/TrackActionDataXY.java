package HealthAnalysisMng.model;

import java.io.Serializable;
/**
 * @author brave Han
 * @Message 一次运动轨迹的数据
 * */
public class TrackActionDataXY implements Serializable{

	private String dataId; 
	/**
	 *  point坐标    X,Y坐标
	 * */
	private String point;
	private String pointX;
	private String pointY;
	private String currentTime;
	private String addressMessage;
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getPointX() {
		return pointX;
	}
	public void setPointX(String pointX) {
		this.pointX = pointX;
	}
	public String getPointY() {
		return pointY;
	}
	public void setPointY(String pointY) {
		this.pointY = pointY;
	}
	public String getCurrentTime() {
		return currentTime;
	}
	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}
	public String getAddressMessage() {
		return addressMessage;
	}
	public void setAddressMessage(String addressMessage) {
		this.addressMessage = addressMessage;
	}
	
}
