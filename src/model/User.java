package HealthAnalysisMng.model;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import HealthAnalysisMng.util.JsonDateSerializer;

public class User {

	private String id;
	private String residentid;
	private String name;
	private String password;
	private Date createdatetime;
	private Date modifydatetime;

	private Date createdatetimeStart;
	private Date modifydatetimeStart;
	private Date createdatetimeEnd;
	private Date modifydatetimeEnd;
	private String ip;
	private String oldPassword;

	private String roleNames;
	private String resourceNames;
	private String roleIds;

	private Integer memberLock;

	public String getResidentid() {
		return residentid;
	}

	public void setResidentid(String residentid) {
		this.residentid = residentid;
	}

	public String getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}

	public String getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}

	public String getResourceNames() {
		return resourceNames;
	}

	public void setResourceNames(String resourceNames) {
		this.resourceNames = resourceNames;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@JsonSerialize(using = JsonDateSerializer.class)
	public Date getCreatedatetimeStart() {
		return createdatetimeStart;
	}

	public void setCreatedatetimeStart(Date createdatetimeStart) {
		this.createdatetimeStart = createdatetimeStart;
	}

	@JsonSerialize(using = JsonDateSerializer.class)
	public Date getModifydatetimeStart() {
		return modifydatetimeStart;
	}

	public void setModifydatetimeStart(Date modifydatetimeStart) {
		this.modifydatetimeStart = modifydatetimeStart;
	}

	@JsonSerialize(using = JsonDateSerializer.class)
	public Date getCreatedatetimeEnd() {
		return createdatetimeEnd;
	}

	public void setCreatedatetimeEnd(Date createdatetimeEnd) {
		this.createdatetimeEnd = createdatetimeEnd;
	}

	@JsonSerialize(using = JsonDateSerializer.class)
	public Date getModifydatetimeEnd() {
		return modifydatetimeEnd;
	}

	public void setModifydatetimeEnd(Date modifydatetimeEnd) {
		this.modifydatetimeEnd = modifydatetimeEnd;
	}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@JsonSerialize(using = JsonDateSerializer.class)
	public Date getCreatedatetime() {
		return createdatetime;
	}

	public void setCreatedatetime(Date createdatetime) {
		this.createdatetime = createdatetime;
	}

	@JsonSerialize(using = JsonDateSerializer.class)
	public Date getModifydatetime() {
		return modifydatetime;
	}

	public void setModifydatetime(Date modifydatetime) {
		this.modifydatetime = modifydatetime;
	}

	/**
	 * @return the memberLock
	 */
	public Integer getMemberLock() {
		return memberLock;
	}

	/**
	 * @param memberLock
	 *            the memberLock to set
	 */
	public void setMemberLock(Integer memberLock) {
		this.memberLock = memberLock;
	}

}
