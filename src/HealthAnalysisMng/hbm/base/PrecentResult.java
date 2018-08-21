package HealthAnalysisMng.hbm.base;

public class PrecentResult {
	private Double BMIPrecent;
	private Double riskPrecent;
	private Double metabolicPrecent;
	private Double ateryPrecent;
	private Double pressurePrecent;
	private Double sugarPrecent;
	private Double waistHeightPrecent;
	private Double waistlinePrecent;
	private Double fatPrecent;
	private Double fatRatePrecent;
	public Double getBMIPrecent() {
		return BMIPrecent;
	}
	public void setBMIPrecent(Double bMIPrecent) {
		BMIPrecent = bMIPrecent;
	}
	public Double getRiskPrecent() {
		return riskPrecent;
	}
	public void setRiskPrecent(Double riskPrecent) {
		this.riskPrecent = riskPrecent;
	}
	public Double getMetabolicPrecent() {
		return metabolicPrecent;
	}
	public void setMetabolicPrecent(Double metabolicPrecent) {
		this.metabolicPrecent = metabolicPrecent;
	}
	public Double getAteryPrecent() {
		return ateryPrecent;
	}
	public void setAteryPrecent(Double ateryPrecent) {
		this.ateryPrecent = ateryPrecent;
	}
	public Double getPressurePrecent() {
		return pressurePrecent;
	}
	public void setPressurePrecent(Double pressurePrecent) {
		this.pressurePrecent = pressurePrecent;
	}
	public Double getSugarPrecent() {
		return sugarPrecent;
	}
	public void setSugarPrecent(Double sugarPrecent) {
		this.sugarPrecent = sugarPrecent;
	}
	public Double getWaistHeightPrecent() {
		return waistHeightPrecent;
	}
	public void setWaistHeightPrecent(Double waistHeightPrecent) {
		this.waistHeightPrecent = waistHeightPrecent;
	}
	public Double getWaistlinePrecent() {
		return waistlinePrecent;
	}
	public void setWaistlinePrecent(Double waistlinePrecent) {
		this.waistlinePrecent = waistlinePrecent;
	}
	public Double getFatPrecent() {
		return fatPrecent;
	}
	public void setFatPrecent(Double fatPrecent) {
		this.fatPrecent = fatPrecent;
	}
	public Double getFatRatePrecent() {
		return fatRatePrecent;
	}
	public void setFatRatePrecent(Double fatRatePrecent) {
		this.fatRatePrecent = fatRatePrecent;
	}
	@Override
	public String toString() {
		return "PrecentResult [BMIPrecent=" + BMIPrecent + ", riskPrecent="
				+ riskPrecent + ", metabolicPrecent=" + metabolicPrecent
				+ ", ateryPrecent=" + ateryPrecent + ", pressurePrecent="
				+ pressurePrecent + ", sugarPrecent=" + sugarPrecent
				+ ", waistHeightPrecent=" + waistHeightPrecent
				+ ", waistlinePrecent=" + waistlinePrecent + ", fatPrecent="
				+ fatPrecent + ", fatRatePrecent=" + fatRatePrecent + "]";
	}
	

}
