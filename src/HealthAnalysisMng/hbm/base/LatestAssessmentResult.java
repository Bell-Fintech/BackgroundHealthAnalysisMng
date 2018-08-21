package HealthAnalysisMng.hbm.base;

import java.util.Date;


/**
 * ClassName:LatestAssessmentResult
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年11月14日		上午12:13:17
 *
 * @see 	 
 *  
 */
public class LatestAssessmentResult {
	/**
	 * evaluateId:主键
	 *
	 * @since Ver 1.1
	 */
	private String evaluateId;
     /**
     * userId:用户ID
     *
     * @since Ver 1.1
     */
    private String userId;
     /**
     * metabolicResultFlag:代谢综合症
     *
     * @since Ver 1.1
     */
    private String metabolicResultFlag;
     /**
     * waistHeightResultFlag:腰围身高比
     *
     * @since Ver 1.1
     */
    private String waistHeightResultFlag;
     /**
     * riskResultFlag:肥胖风险
     *
     * @since Ver 1.1
     */
    private String riskResultFlag;
     /**
     * bmiResultFlag:BMI
     *
     * @since Ver 1.1
     */
    private String bmiResultFlag;
     /**
     * pressureResultFlag:血压
     *
     * @since Ver 1.1
     */
    private String pressureResultFlag;
     /**
     * fatResultFlag:血脂
     *
     * @since Ver 1.1
     */
    private String fatResultFlag;
     /**
     * ateryResultFlag:动脉粥样硬化指数
     *
     * @since Ver 1.1
     */
    private String ateryResultFlag;
     /**
     * sugarResultFlag:血糖
     *
     * @since Ver 1.1
     */
    private String sugarResultFlag;
     /**
     * waistlineResultFlag:腰围
     *
     * @since Ver 1.1
     */
    private String waistlineResultFlag;
     /**
     * fatRateResultFlag:体脂肪率
     *
     * @since Ver 1.1
     */
    private String fatRateResultFlag;
     /**
     * bloodOxygenResultFlag:血氧
     *
     * @since Ver 1.1
     */
    private String bloodOxygenResultFlag;
     /**
     * heartRateResultFlag:心率
     *
     * @since Ver 1.1
     */
    private String heartRateResultFlag;
     /**
     * temperatureResultFlag:体温
     *
     * @since Ver 1.1
     */
    private String temperatureResultFlag;
     /**
     * boneMineralResultFlag:骨密度
     *
     * @since Ver 1.1
     */
    private String boneMineralResultFlag;
     /**
     * evaluate:日期
     *
     * @since Ver 1.1
     */
    private Date  evaluate;
   
	@Override
	public String toString() {
		return "LatestAssessmentResult [evaluateId=" + evaluateId + ", userId="
				+ userId + ", metabolicResultFlag=" + metabolicResultFlag
				+ ", waistHeightResultFlag=" + waistHeightResultFlag
				+ ", riskResultFlag=" + riskResultFlag + ", bmiResultFlag="
				+ bmiResultFlag + ", pressureResultFlag=" + pressureResultFlag
				+ ", fatResultFlag=" + fatResultFlag + ", ateryResultFlag="
				+ ateryResultFlag + ", sugarResultFlag=" + sugarResultFlag
				+ ", waistlineResultFlag=" + waistlineResultFlag
				+ ", fatRateResultFlag=" + fatRateResultFlag + ", evaluate="
				+ evaluate + "]";
	}

	/**
	 * evaluateId
	 *
	 * @return  the evaluateId
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getEvaluateId() {
		return evaluateId;
	}

	/**
	 * evaluateId
	 *
	 * @param   evaluateId    the evaluateId to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setEvaluateId(String evaluateId) {
		this.evaluateId = evaluateId;
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
	 * metabolicResultFlag
	 *
	 * @return  the metabolicResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getMetabolicResultFlag() {
		return metabolicResultFlag;
	}

	/**
	 * metabolicResultFlag
	 *
	 * @param   metabolicResultFlag    the metabolicResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMetabolicResultFlag(String metabolicResultFlag) {
		this.metabolicResultFlag = metabolicResultFlag;
	}

	/**
	 * waistHeightResultFlag
	 *
	 * @return  the waistHeightResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getWaistHeightResultFlag() {
		return waistHeightResultFlag;
	}

	/**
	 * waistHeightResultFlag
	 *
	 * @param   waistHeightResultFlag    the waistHeightResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setWaistHeightResultFlag(String waistHeightResultFlag) {
		this.waistHeightResultFlag = waistHeightResultFlag;
	}

	/**
	 * riskResultFlag
	 *
	 * @return  the riskResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getRiskResultFlag() {
		return riskResultFlag;
	}

	/**
	 * riskResultFlag
	 *
	 * @param   riskResultFlag    the riskResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setRiskResultFlag(String riskResultFlag) {
		this.riskResultFlag = riskResultFlag;
	}

	/**
	 * bmiResultFlag
	 *
	 * @return  the bmiResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getBmiResultFlag() {
		return bmiResultFlag;
	}

	/**
	 * bmiResultFlag
	 *
	 * @param   bmiResultFlag    the bmiResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBmiResultFlag(String bmiResultFlag) {
		this.bmiResultFlag = bmiResultFlag;
	}

	/**
	 * pressureResultFlag
	 *
	 * @return  the pressureResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getPressureResultFlag() {
		return pressureResultFlag;
	}

	/**
	 * pressureResultFlag
	 *
	 * @param   pressureResultFlag    the pressureResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPressureResultFlag(String pressureResultFlag) {
		this.pressureResultFlag = pressureResultFlag;
	}

	/**
	 * fatResultFlag
	 *
	 * @return  the fatResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getFatResultFlag() {
		return fatResultFlag;
	}

	/**
	 * fatResultFlag
	 *
	 * @param   fatResultFlag    the fatResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setFatResultFlag(String fatResultFlag) {
		this.fatResultFlag = fatResultFlag;
	}

	/**
	 * ateryResultFlag
	 *
	 * @return  the ateryResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getAteryResultFlag() {
		return ateryResultFlag;
	}

	/**
	 * ateryResultFlag
	 *
	 * @param   ateryResultFlag    the ateryResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setAteryResultFlag(String ateryResultFlag) {
		this.ateryResultFlag = ateryResultFlag;
	}

	/**
	 * sugarResultFlag
	 *
	 * @return  the sugarResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getSugarResultFlag() {
		return sugarResultFlag;
	}

	/**
	 * sugarResultFlag
	 *
	 * @param   sugarResultFlag    the sugarResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setSugarResultFlag(String sugarResultFlag) {
		this.sugarResultFlag = sugarResultFlag;
	}

	/**
	 * waistlineResultFlag
	 *
	 * @return  the waistlineResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getWaistlineResultFlag() {
		return waistlineResultFlag;
	}

	/**
	 * waistlineResultFlag
	 *
	 * @param   waistlineResultFlag    the waistlineResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setWaistlineResultFlag(String waistlineResultFlag) {
		this.waistlineResultFlag = waistlineResultFlag;
	}

	/**
	 * fatRateResultFlag
	 *
	 * @return  the fatRateResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getFatRateResultFlag() {
		return fatRateResultFlag;
	}

	/**
	 * fatRateResultFlag
	 *
	 * @param   fatRateResultFlag    the fatRateResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setFatRateResultFlag(String fatRateResultFlag) {
		this.fatRateResultFlag = fatRateResultFlag;
	}

	/**
	 * bloodOxygenResultFlag
	 *
	 * @return  the bloodOxygenResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getBloodOxygenResultFlag() {
		return bloodOxygenResultFlag;
	}

	/**
	 * bloodOxygenResultFlag
	 *
	 * @param   bloodOxygenResultFlag    the bloodOxygenResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBloodOxygenResultFlag(String bloodOxygenResultFlag) {
		this.bloodOxygenResultFlag = bloodOxygenResultFlag;
	}

	/**
	 * heartRateResultFlag
	 *
	 * @return  the heartRateResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getHeartRateResultFlag() {
		return heartRateResultFlag;
	}

	/**
	 * heartRateResultFlag
	 *
	 * @param   heartRateResultFlag    the heartRateResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setHeartRateResultFlag(String heartRateResultFlag) {
		this.heartRateResultFlag = heartRateResultFlag;
	}

	/**
	 * temperatureResultFlag
	 *
	 * @return  the temperatureResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getTemperatureResultFlag() {
		return temperatureResultFlag;
	}

	/**
	 * temperatureResultFlag
	 *
	 * @param   temperatureResultFlag    the temperatureResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setTemperatureResultFlag(String temperatureResultFlag) {
		this.temperatureResultFlag = temperatureResultFlag;
	}

	/**
	 * boneMineralResultFlag
	 *
	 * @return  the boneMineralResultFlag
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getBoneMineralResultFlag() {
		return boneMineralResultFlag;
	}

	/**
	 * boneMineralResultFlag
	 *
	 * @param   boneMineralResultFlag    the boneMineralResultFlag to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBoneMineralResultFlag(String boneMineralResultFlag) {
		this.boneMineralResultFlag = boneMineralResultFlag;
	}

	/**
	 * evaluate
	 *
	 * @return  the evaluate
	 * @since   CodingExample Ver 1.0
	 */
	
	public Date getEvaluate() {
		return evaluate;
	}

	/**
	 * evaluate
	 *
	 * @param   evaluate    the evaluate to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setEvaluate(Date evaluate) {
		this.evaluate = evaluate;
	}
}
