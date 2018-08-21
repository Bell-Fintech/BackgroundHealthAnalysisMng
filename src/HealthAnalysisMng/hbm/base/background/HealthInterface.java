package HealthAnalysisMng.hbm.base.background;

import java.io.Serializable;

public class HealthInterface implements Serializable{
	
	private String id;
	private String interfaceName;
	private String description;
	private String createTime;
	private String abbreviate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInterfaceName() {
		return interfaceName;
	}
	public void setInterfaceName(String interfaceName) {
		this.interfaceName = interfaceName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getAbbreviate() {
		return abbreviate;
	}
	public void setAbbreviate(String abbreviate) {
		this.abbreviate = abbreviate;
	}
	@Override
	public String toString() {
		return "HealthInterface [id=" + id + ", interfaceName=" + interfaceName
				+ ", description=" + description + ", createTime=" + createTime
				+ ", abbreviate=" + abbreviate + "]";
	}
	

}
