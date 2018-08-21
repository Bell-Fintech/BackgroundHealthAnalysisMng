/**
 * @author Brave Han
 *  2014年10月27日
 *  
 */
package HealthAnalysisMng.hbm.base;

import java.sql.Timestamp;

/**
 * @author onesun.hbm.base
 *  Brave Han
 */
public class OneCommonInspection {

	private String dataId;
	private String userId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	private String memberCode;
	private Double height;
	private Double weight;
	private Double idealWeight;
	private Double BMI;
	private Double bodyFat;
	private Double waistline;
	private Double hipline;
	private Double whr;//腰臀比
	private Double bloodPressure;
	private Double sittingRArm;
	private Double sittingLArm;
	private Double pulse;
	private Double breathe;
	private Double chest;
	private Double sniffChest;
	private Double lowerLimbEdema;
	private Timestamp checkTime;
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getIdealWeight() {
		return idealWeight;
	}
	public void setIdealWeight(Double idealWeight) {
		this.idealWeight = idealWeight;
	}
	public Double getBMI() {
		return BMI;
	}
	public void setBMI(Double bMI) {
		BMI = bMI;
	}
	public Double getBodyFat() {
		return bodyFat;
	}
	public void setBodyFat(Double bodyFat) {
		this.bodyFat = bodyFat;
	}
	public Double getWaistline() {
		return waistline;
	}
	public void setWaistline(Double waistline) {
		this.waistline = waistline;
	}
	public Double getHipline() {
		return hipline;
	}
	public void setHipline(Double hipline) {
		this.hipline = hipline;
	}
	public Double getWhr() {
		return whr;
	}
	public void setWhr(Double whr) {
		this.whr = whr;
	}
	public Double getBloodPressure() {
		return bloodPressure;
	}
	public void setBloodPressure(Double bloodPressure) {
		this.bloodPressure = bloodPressure;
	}
	public Double getSittingRArm() {
		return sittingRArm;
	}
	public void setSittingRArm(Double sittingRArm) {
		this.sittingRArm = sittingRArm;
	}
	public Double getSittingLArm() {
		return sittingLArm;
	}
	public void setSittingLArm(Double sittingLArm) {
		this.sittingLArm = sittingLArm;
	}
	public Double getPulse() {
		return pulse;
	}
	public void setPulse(Double pulse) {
		this.pulse = pulse;
	}
	public Double getBreathe() {
		return breathe;
	}
	public void setBreathe(Double breathe) {
		this.breathe = breathe;
	}
	public Double getChest() {
		return chest;
	}
	public void setChest(Double chest) {
		this.chest = chest;
	}
	public Double getSniffChest() {
		return sniffChest;
	}
	public void setSniffChest(Double sniffChest) {
		this.sniffChest = sniffChest;
	}
	public Double getLowerLimbEdema() {
		return lowerLimbEdema;
	}
	public void setLowerLimbEdema(Double lowerLimbEdema) {
		this.lowerLimbEdema = lowerLimbEdema;
	}
	public Timestamp getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Timestamp checkTime) {
		this.checkTime = checkTime;
	}
	
}
