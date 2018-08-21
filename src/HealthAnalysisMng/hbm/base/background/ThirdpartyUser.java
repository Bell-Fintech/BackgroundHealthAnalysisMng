package HealthAnalysisMng.hbm.base.background;

import java.io.Serializable;

public class ThirdpartyUser implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2873870543991464596L;
	private String id;
	private String name;
	private String username;
	private String password;
	private String token;
	private String healthExamination;
	private String healthIndicator;
	private String interfaceName;
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getHealthExamination() {
		return healthExamination;
	}
	public void setHealthExamination(String healthExamination) {
		this.healthExamination = healthExamination;
	}
	public String getHealthIndicator() {
		return healthIndicator;
	}
	public void setHealthIndicator(String healthIndicator) {
		this.healthIndicator = healthIndicator;
	}
	public String getInterfaceName() {
		return interfaceName;
	}
	public void setInterfaceName(String interfaceName) {
		this.interfaceName = interfaceName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ThirdpartyUser [id=" + id + ", name=" + name + ", username="
				+ username + ", password=" + password + ", token=" + token
				+ ", healthExamination=" + healthExamination
				+ ", healthIndicator=" + healthIndicator + ", interfaceName="
				+ interfaceName + ", status=" + status + "]";
	}
	
	
	
}
