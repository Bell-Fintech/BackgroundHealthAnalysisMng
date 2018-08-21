package HealthAnalysisMng.hbm.base;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ClassName:InBody
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	2014年11月9日		下午11:56:47
 *
 * @see 	 
 * 
 */
public class InBody implements Serializable{
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
	 * inDBTime:TODO（入库时间）
	 *
	 * @since Ver 1.1
	 */
	private Timestamp inDBTime;
	/**
	 * showTime:TODO（字符时间）
	 *
	 * @since Ver 1.1
	 */
	private String showTime;
	/**
	 * BMI:TODO（身高体重比）
	 *
	 * @since Ver 1.1
	 */
	private Double BMI;
	/**
	 * BMIMax:TODO（最大身高体重比）
	 *
	 * @since Ver 1.1
	 */
	private Double BMIMax;
	/**
	 * BMIMin:TODO（最小身高体重比）
	 *
	 * @since Ver 1.1
	 */
	private Double BMIMin;
	/**
	 * bodyFatMass:TODO（体脂肪量）
	 *
	 * @since Ver 1.1
	 */
	private Double bodyFatMass;
	/**
	 * BFMMax:TODO（最大体脂肪量）
	 *
	 * @since Ver 1.1
	 */
	private Double BFMMax;
	/**
	 * BFMMin:TODO（最小体脂肪量）
	 *
	 * @since Ver 1.1
	 */
	private Double BFMMin;
	/**
	 * BMR:TODO（基础代谢率）
	 *
	 * @since Ver 1.1
	 */
	private Double BMR;
	/**
	 * fatFreeMass:TODO（去脂体重）
	 *
	 * @since Ver 1.1
	 */
	private Double fatFreeMass;
	/**
	 * height:TODO（身高）
	 *
	 * @since Ver 1.1
	 */
	private Double height;
	/**
	 * mineral:TODO（无机盐）
	 *
	 * @since Ver 1.1
	 */
	private Double mineral;
	/**
	 * mineralMax:TODO（最大无机盐）
	 *
	 * @since Ver 1.1
	 */
	private Double mineralMax;
	/**
	 * mineralMin:TODO（最小无机盐）
	 *
	 * @since Ver 1.1
	 */
	private Double mineralMin;
	/**
	 * percentBodyFat:TODO（去脂肪率）
	 *
	 * @since Ver 1.1
	 */
	private Double percentBodyFat;
	/**
	 * percentBodyFatMass:TODO（去脂体重百分比）
	 *
	 * @since Ver 1.1
	 */
	private Double percentBodyFatMass;
	/**
	 * percentBodyFatMax:TODO（最大去脂体重百分比）
	 *
	 * @since Ver 1.1
	 */
	private Double percentBodyFatMax;
	/**
	 * percentBodyFatMin:TODO（最小去脂体重百分比）
	 *
	 * @since Ver 1.1
	 */
	private Double percentBodyFatMin;
	/**
	 * protein:TODO（蛋白质）
	 *
	 * @since Ver 1.1
	 */
	private Double protein;
	/**
	 * proteinMax:TODO（最大蛋白质）
	 *
	 * @since Ver 1.1
	 */
	private Double proteinMax;
	/**
	 * proteinMin:TODO（最小蛋白质）
	 *
	 * @since Ver 1.1
	 */
	private Double proteinMin;
	/**
	 * softLeanMass:TODO（肌肉量）
	 *
	 * @since Ver 1.1
	 */
	private Double softLeanMass;
	/**
	 * targetWeight:TODO（目标体重）
	 *
	 * @since Ver 1.1
	 */
	private Double targetWeight;
	/**
	 * totalBodyWater:TODO（身体水分含量）
	 *
	 * @since Ver 1.1
	 */
	private Double totalBodyWater;
	/**
	 * TBWMax:TODO（最大水分含量）
	 *
	 * @since Ver 1.1
	 */
	private Double TBWMax;
	/**
	 * TBWMin:TODO（最小水分含量）
	 *
	 * @since Ver 1.1
	 */
	private Double TBWMin;
	/**
	 * weight:TODO（体重）
	 *
	 * @since Ver 1.1
	 */
	private Double weight;
	/**
	 * weightMax:TODO（最大体重）
	 *
	 * @since Ver 1.1
	 */
	private Double weightMax;
	/**
	 * weightMin:TODO（最小体重）
	 *
	 * @since Ver 1.1
	 */
	private Double weightMin;
	/**
	 * result:TODO（结果判断）
	 *
	 * @since Ver 1.1
	 */
	private String result;
	/**
	 * dataSource:TODO（数据来源）
	 *
	 * @since Ver 1.1
	 */
	private String dataSource;
	private Double visceralFatLevel;
	
	public Double getVisceralFatLevel() {
		return visceralFatLevel;
	}
	public void setVisceralFatLevel(Double visceralFatLevel) {
		this.visceralFatLevel = visceralFatLevel;
	}
	// Constructors
	
	@Override
	public String toString() {
		return "InBody [dataId=" + dataId + ", userId=" + userId
				+ ", checkTime=" + checkTime + ", inDBTime=" + inDBTime
				+ ", showTime=" + showTime + ", BMI=" + BMI + ", BMIMax="
				+ BMIMax + ", BMIMin=" + BMIMin + ", bodyFatMass="
				+ bodyFatMass + ", BFMMax=" + BFMMax + ", BFMMin=" + BFMMin
				+ ", BMR=" + BMR + ", fatFreeMass=" + fatFreeMass + ", height="
				+ height + ", mineral=" + mineral + ", mineralMax="
				+ mineralMax + ", mineralMin=" + mineralMin
				+ ", percentBodyFat=" + percentBodyFat
				+ ", percentBodyFatMass=" + percentBodyFatMass
				+ ", percentBodyFatMax=" + percentBodyFatMax
				+ ", percentBodyFatMin=" + percentBodyFatMin + ", protein="
				+ protein + ", proteinMax=" + proteinMax + ", proteinMin="
				+ proteinMin + ", softLeanMass=" + softLeanMass
				+ ", targetWeight=" + targetWeight + ", totalBodyWater="
				+ totalBodyWater + ", TBWMax=" + TBWMax + ", TBWMin=" + TBWMin
				+ ", weight=" + weight + ", weightMax=" + weightMax
				+ ", weightMin=" + weightMin + ", result=" + result
				+ ", dataSource=" + dataSource + "]";
	}

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
	 * inDBTime
	 *
	 * @return  the inDBTime
	 * @since   CodingExample Ver 1.0
	 */
	
	public Timestamp getInDBTime() {
		return inDBTime;
	}

	/**
	 * inDBTime
	 *
	 * @param   inDBTime    the inDBTime to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setInDBTime(Timestamp inDBTime) {
		this.inDBTime = inDBTime;
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
	 * bMI
	 *
	 * @return  the bMI
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBMI() {
		return BMI;
	}

	/**
	 * bMI
	 *
	 * @param   bMI    the bMI to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBMI(Double bMI) {
		BMI = bMI;
	}

	/**
	 * bMIMax
	 *
	 * @return  the bMIMax
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBMIMax() {
		return BMIMax;
	}

	/**
	 * bMIMax
	 *
	 * @param   bMIMax    the bMIMax to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBMIMax(Double bMIMax) {
		BMIMax = bMIMax;
	}

	/**
	 * bMIMin
	 *
	 * @return  the bMIMin
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBMIMin() {
		return BMIMin;
	}

	/**
	 * bMIMin
	 *
	 * @param   bMIMin    the bMIMin to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBMIMin(Double bMIMin) {
		BMIMin = bMIMin;
	}

	/**
	 * bodyFatMass
	 *
	 * @return  the bodyFatMass
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBodyFatMass() {
		return bodyFatMass;
	}

	/**
	 * bodyFatMass
	 *
	 * @param   bodyFatMass    the bodyFatMass to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBodyFatMass(Double bodyFatMass) {
		this.bodyFatMass = bodyFatMass;
	}

	/**
	 * bFMMax
	 *
	 * @return  the bFMMax
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBFMMax() {
		return BFMMax;
	}

	/**
	 * bFMMax
	 *
	 * @param   bFMMax    the bFMMax to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBFMMax(Double bFMMax) {
		BFMMax = bFMMax;
	}

	/**
	 * bFMMin
	 *
	 * @return  the bFMMin
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBFMMin() {
		return BFMMin;
	}

	/**
	 * bFMMin
	 *
	 * @param   bFMMin    the bFMMin to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBFMMin(Double bFMMin) {
		BFMMin = bFMMin;
	}

	/**
	 * bMR
	 *
	 * @return  the bMR
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBMR() {
		return BMR;
	}

	/**
	 * bMR
	 *
	 * @param   bMR    the bMR to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBMR(Double bMR) {
		BMR = bMR;
	}

	/**
	 * fatFreeMass
	 *
	 * @return  the fatFreeMass
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getFatFreeMass() {
		return fatFreeMass;
	}

	/**
	 * fatFreeMass
	 *
	 * @param   fatFreeMass    the fatFreeMass to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setFatFreeMass(Double fatFreeMass) {
		this.fatFreeMass = fatFreeMass;
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
	 * mineral
	 *
	 * @return  the mineral
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getMineral() {
		return mineral;
	}

	/**
	 * mineral
	 *
	 * @param   mineral    the mineral to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMineral(Double mineral) {
		this.mineral = mineral;
	}

	/**
	 * mineralMax
	 *
	 * @return  the mineralMax
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getMineralMax() {
		return mineralMax;
	}

	/**
	 * mineralMax
	 *
	 * @param   mineralMax    the mineralMax to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMineralMax(Double mineralMax) {
		this.mineralMax = mineralMax;
	}

	/**
	 * mineralMin
	 *
	 * @return  the mineralMin
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getMineralMin() {
		return mineralMin;
	}

	/**
	 * mineralMin
	 *
	 * @param   mineralMin    the mineralMin to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMineralMin(Double mineralMin) {
		this.mineralMin = mineralMin;
	}

	/**
	 * percentBodyFat
	 *
	 * @return  the percentBodyFat
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getPercentBodyFat() {
		return percentBodyFat;
	}

	/**
	 * percentBodyFat
	 *
	 * @param   percentBodyFat    the percentBodyFat to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPercentBodyFat(Double percentBodyFat) {
		this.percentBodyFat = percentBodyFat;
	}

	/**
	 * percentBodyFatMass
	 *
	 * @return  the percentBodyFatMass
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getPercentBodyFatMass() {
		return percentBodyFatMass;
	}

	/**
	 * percentBodyFatMass
	 *
	 * @param   percentBodyFatMass    the percentBodyFatMass to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPercentBodyFatMass(Double percentBodyFatMass) {
		this.percentBodyFatMass = percentBodyFatMass;
	}

	/**
	 * percentBodyFatMax
	 *
	 * @return  the percentBodyFatMax
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getPercentBodyFatMax() {
		return percentBodyFatMax;
	}

	/**
	 * percentBodyFatMax
	 *
	 * @param   percentBodyFatMax    the percentBodyFatMax to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPercentBodyFatMax(Double percentBodyFatMax) {
		this.percentBodyFatMax = percentBodyFatMax;
	}

	/**
	 * percentBodyFatMin
	 *
	 * @return  the percentBodyFatMin
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getPercentBodyFatMin() {
		return percentBodyFatMin;
	}

	/**
	 * percentBodyFatMin
	 *
	 * @param   percentBodyFatMin    the percentBodyFatMin to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPercentBodyFatMin(Double percentBodyFatMin) {
		this.percentBodyFatMin = percentBodyFatMin;
	}

	/**
	 * protein
	 *
	 * @return  the protein
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getProtein() {
		return protein;
	}

	/**
	 * protein
	 *
	 * @param   protein    the protein to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setProtein(Double protein) {
		this.protein = protein;
	}

	/**
	 * proteinMax
	 *
	 * @return  the proteinMax
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getProteinMax() {
		return proteinMax;
	}

	/**
	 * proteinMax
	 *
	 * @param   proteinMax    the proteinMax to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setProteinMax(Double proteinMax) {
		this.proteinMax = proteinMax;
	}

	/**
	 * proteinMin
	 *
	 * @return  the proteinMin
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getProteinMin() {
		return proteinMin;
	}

	/**
	 * proteinMin
	 *
	 * @param   proteinMin    the proteinMin to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setProteinMin(Double proteinMin) {
		this.proteinMin = proteinMin;
	}

	/**
	 * softLeanMass
	 *
	 * @return  the softLeanMass
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getSoftLeanMass() {
		return softLeanMass;
	}

	/**
	 * softLeanMass
	 *
	 * @param   softLeanMass    the softLeanMass to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setSoftLeanMass(Double softLeanMass) {
		this.softLeanMass = softLeanMass;
	}

	/**
	 * targetWeight
	 *
	 * @return  the targetWeight
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getTargetWeight() {
		return targetWeight;
	}

	/**
	 * targetWeight
	 *
	 * @param   targetWeight    the targetWeight to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setTargetWeight(Double targetWeight) {
		this.targetWeight = targetWeight;
	}

	/**
	 * totalBodyWater
	 *
	 * @return  the totalBodyWater
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getTotalBodyWater() {
		return totalBodyWater;
	}

	/**
	 * totalBodyWater
	 *
	 * @param   totalBodyWater    the totalBodyWater to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setTotalBodyWater(Double totalBodyWater) {
		this.totalBodyWater = totalBodyWater;
	}

	/**
	 * tBWMax
	 *
	 * @return  the tBWMax
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getTBWMax() {
		return TBWMax;
	}

	/**
	 * tBWMax
	 *
	 * @param   tBWMax    the tBWMax to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setTBWMax(Double tBWMax) {
		TBWMax = tBWMax;
	}

	/**
	 * tBWMin
	 *
	 * @return  the tBWMin
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getTBWMin() {
		return TBWMin;
	}

	/**
	 * tBWMin
	 *
	 * @param   tBWMin    the tBWMin to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setTBWMin(Double tBWMin) {
		TBWMin = tBWMin;
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
	 * weightMax
	 *
	 * @return  the weightMax
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getWeightMax() {
		return weightMax;
	}

	/**
	 * weightMax
	 *
	 * @param   weightMax    the weightMax to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setWeightMax(Double weightMax) {
		this.weightMax = weightMax;
	}

	/**
	 * weightMin
	 *
	 * @return  the weightMin
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getWeightMin() {
		return weightMin;
	}

	/**
	 * weightMin
	 *
	 * @param   weightMin    the weightMin to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setWeightMin(Double weightMin) {
		this.weightMin = weightMin;
	}

	/**
	 * result
	 *
	 * @return  the result
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getResult() {
		return result;
	}

	/**
	 * result
	 *
	 * @param   result    the result to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setResult(String result) {
		this.result = result;
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
