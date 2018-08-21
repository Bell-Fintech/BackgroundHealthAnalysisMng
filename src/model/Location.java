package HealthAnalysisMng.model;

public class Location {
	private String province;
	private String city;
	private String area;
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@Override
	public String toString() {
		return "Location [province=" + province + ", city=" + city + ", area="
				+ area + "]";
	}
	

}
