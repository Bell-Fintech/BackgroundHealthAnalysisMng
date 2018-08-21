package HealthAnalysisMng.hbm.base;

/**
 * @author onesun.hbm.base
 *体检表的营养建议子项  关联OuterHealthForm
 */
/**
 * ClassName:NutritionalRecommendation
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年11月23日		上午12:15:13
 *
 * @see 	 
 * 
 */
public class NutritionalRecommendation {

	/**
	 * dataID:TODO（primary key ）
	 *
	 * @since Ver 1.1
	 */
	private String dataID;
	/**
	 * userId:TODO（用户ｉｄ）
	 *
	 * @since Ver 1.1
	 */
	private String userId;
	/**
	 * sequence:TODO（序列）
	 *
	 * @since Ver 1.1
	 */
	private String sequence;
	/**
	 * dietLifestyle:TODO（样）
	 *
	 * @since Ver 1.1
	 */
	private String dietLifestyle;
	/**
	 * recommendedSupplement:TODO（ｒｅｃｏｍｍｅｎｔ）
	 *
	 * @since Ver 1.1
	 */
	private String recommendedSupplement;
	/**
	 * beatSourceFood:TODO（食物来源）
	 *
	 * @since Ver 1.1
	 */
	private String beatSourceFood;
	/**
	 * remarks:TODO（建议）
	 *
	 * @since Ver 1.1
	 */
	private String remarks;
	/**
	 * dataID
	 *
	 * @return  the dataID
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getDataID() {
		return dataID;
	}
	/**
	 * dataID
	 *
	 * @param   dataID    the dataID to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setDataID(String dataID) {
		this.dataID = dataID;
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
	 * sequence
	 *
	 * @return  the sequence
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getSequence() {
		return sequence;
	}
	/**
	 * sequence
	 *
	 * @param   sequence    the sequence to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	/**
	 * dietLifestyle
	 *
	 * @return  the dietLifestyle
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getDietLifestyle() {
		return dietLifestyle;
	}
	/**
	 * dietLifestyle
	 *
	 * @param   dietLifestyle    the dietLifestyle to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setDietLifestyle(String dietLifestyle) {
		this.dietLifestyle = dietLifestyle;
	}
	/**
	 * recommendedSupplement
	 *
	 * @return  the recommendedSupplement
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getRecommendedSupplement() {
		return recommendedSupplement;
	}
	/**
	 * recommendedSupplement
	 *
	 * @param   recommendedSupplement    the recommendedSupplement to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setRecommendedSupplement(String recommendedSupplement) {
		this.recommendedSupplement = recommendedSupplement;
	}
	/**
	 * beatSourceFood
	 *
	 * @return  the beatSourceFood
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getBeatSourceFood() {
		return beatSourceFood;
	}
	/**
	 * beatSourceFood
	 *
	 * @param   beatSourceFood    the beatSourceFood to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBeatSourceFood(String beatSourceFood) {
		this.beatSourceFood = beatSourceFood;
	}
	/**
	 * remarks
	 *
	 * @return  the remarks
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getRemarks() {
		return remarks;
	}
	/**
	 * remarks
	 *
	 * @param   remarks    the remarks to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
