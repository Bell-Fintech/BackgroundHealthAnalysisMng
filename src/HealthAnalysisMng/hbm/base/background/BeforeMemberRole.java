package HealthAnalysisMng.hbm.base.background;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

//角色
public class BeforeMemberRole implements Serializable {
	private String Id;
	private String role;
	private String name;
	private Integer power;
	private Integer status;
	private String statusValue;
	private String templateId;
	// 角色用户
	private Set customUsers = new HashSet(0);
	// 角色权限
	private Set permissions = new HashSet(0);

	public BeforeMemberRole() {
		super();
	}

	public Set getCustomUsers() {
		return customUsers;
	}

	public void setCustomUsers(Set customUsers) {
		this.customUsers = customUsers;
	}

	public BeforeMemberRole(String id, String role, String name, Integer power,
			Integer status, Set permissions) {
		super();
		Id = id;
		this.role = role;
		this.name = name;
		this.power = power;
		this.status = status;
		// this.roles = roles;
		this.permissions = permissions;
	}

	public Set getPermissions() {
		return permissions;
	}

	public void setPermissions(Set permissions) {
		this.permissions = permissions;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPower() {
		return power;
	}

	public void setPower(Integer power) {
		this.power = power;
	}

	/**
	 * @return the status
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * statusValue
	 *
	 * @return the statusValue
	 * @since CodingExample Ver 1.0
	 */

	public String getStatusValue() {
		return statusValue;
	}

	/**
	 * statusValue
	 *
	 * @param statusValue
	 *            the statusValue to set
	 * @since CodingExample Ver 1.0
	 */

	public void setStatusValue(String statusValue) {
		this.statusValue = statusValue;
	}

	/**
	 * templateId
	 *
	 * @return the templateId
	 * @since CodingExample Ver 1.0
	 */

	public String getTemplateId() {
		return templateId;
	}

	/**
	 * templateId
	 *
	 * @param templateId
	 *            the templateId to set
	 * @since CodingExample Ver 1.0
	 */

	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}

	@Override
	public String toString() {
		return "BeforeMemberRole [Id=" + Id + ", role=" + role + ", name="
				+ name + ", power=" + power + ", customUsers=" + customUsers
				+ ", permissions=" + permissions + "]";
	}

}
