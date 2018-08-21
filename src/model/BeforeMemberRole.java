package HealthAnalysisMng.model;

import java.io.Serializable;

//角色
public class BeforeMemberRole implements Serializable {
	/**
	 * Id:主键
	 *
	 * @since Ver 1.1
	 */
	private String Id;
	/**
	 * role:角色
	 *
	 * @since Ver 1.1
	 */
	private String role;
	/**
	 * name:角色名称
	 *
	 * @since Ver 1.1
	 */
	private String name;
	/**
	 * power:标识符
	 *
	 * @since Ver 1.1
	 */
	private Integer power;
	/**
	 * status:状态
	 *
	 * @since Ver 1.1
	 */
	private Integer status;

	private String ReportOne;
	private String ReportTwo;
	private String ReportThree;
	private String ReportFour;
	private String ReportFive;
	private String ReportSix;
	private String ReportSeven;

	public BeforeMemberRole() {
		super();
	}

	public BeforeMemberRole(String id, String role, String name, Integer power,
			Integer status) {
		super();
		Id = id;
		this.role = role;
		this.name = name;
		this.power = power;
		this.status = status;
	}

	/**
	 * id
	 *
	 * @return the id
	 * @since CodingExample Ver 1.0
	 */

	public String getId() {
		return Id;
	}

	/**
	 * id
	 *
	 * @param id
	 *            the id to set
	 * @since CodingExample Ver 1.0
	 */

	public void setId(String id) {
		Id = id;
	}

	/**
	 * role
	 *
	 * @return the role
	 * @since CodingExample Ver 1.0
	 */

	public String getRole() {
		return role;
	}

	/**
	 * role
	 *
	 * @param role
	 *            the role to set
	 * @since CodingExample Ver 1.0
	 */

	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * name
	 *
	 * @return the name
	 * @since CodingExample Ver 1.0
	 */

	public String getName() {
		return name;
	}

	/**
	 * name
	 *
	 * @param name
	 *            the name to set
	 * @since CodingExample Ver 1.0
	 */

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * power
	 *
	 * @return the power
	 * @since CodingExample Ver 1.0
	 */

	public Integer getPower() {
		return power;
	}

	/**
	 * power
	 *
	 * @param power
	 *            the power to set
	 * @since CodingExample Ver 1.0
	 */

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
	 * reportOne
	 *
	 * @return the reportOne
	 * @since CodingExample Ver 1.0
	 */

	public String getReportOne() {
		return ReportOne;
	}

	/**
	 * reportOne
	 *
	 * @param reportOne
	 *            the reportOne to set
	 * @since CodingExample Ver 1.0
	 */

	public void setReportOne(String reportOne) {
		ReportOne = reportOne;
	}

	/**
	 * reportTwo
	 *
	 * @return the reportTwo
	 * @since CodingExample Ver 1.0
	 */

	public String getReportTwo() {
		return ReportTwo;
	}

	/**
	 * reportTwo
	 *
	 * @param reportTwo
	 *            the reportTwo to set
	 * @since CodingExample Ver 1.0
	 */

	public void setReportTwo(String reportTwo) {
		ReportTwo = reportTwo;
	}

	/**
	 * reportThree
	 *
	 * @return the reportThree
	 * @since CodingExample Ver 1.0
	 */

	public String getReportThree() {
		return ReportThree;
	}

	/**
	 * reportThree
	 *
	 * @param reportThree
	 *            the reportThree to set
	 * @since CodingExample Ver 1.0
	 */

	public void setReportThree(String reportThree) {
		ReportThree = reportThree;
	}

	/**
	 * reportFour
	 *
	 * @return the reportFour
	 * @since CodingExample Ver 1.0
	 */

	public String getReportFour() {
		return ReportFour;
	}

	/**
	 * reportFour
	 *
	 * @param reportFour
	 *            the reportFour to set
	 * @since CodingExample Ver 1.0
	 */

	public void setReportFour(String reportFour) {
		ReportFour = reportFour;
	}

	/**
	 * reportFive
	 *
	 * @return the reportFive
	 * @since CodingExample Ver 1.0
	 */

	public String getReportFive() {
		return ReportFive;
	}

	/**
	 * reportFive
	 *
	 * @param reportFive
	 *            the reportFive to set
	 * @since CodingExample Ver 1.0
	 */

	public void setReportFive(String reportFive) {
		ReportFive = reportFive;
	}

	/**
	 * reportSix
	 *
	 * @return the reportSix
	 * @since CodingExample Ver 1.0
	 */

	public String getReportSix() {
		return ReportSix;
	}

	/**
	 * reportSix
	 *
	 * @param reportSix
	 *            the reportSix to set
	 * @since CodingExample Ver 1.0
	 */

	public void setReportSix(String reportSix) {
		ReportSix = reportSix;
	}

	/**
	 * reportSeven
	 *
	 * @return the reportSeven
	 * @since CodingExample Ver 1.0
	 */

	public String getReportSeven() {
		return ReportSeven;
	}

	/**
	 * reportSeven
	 *
	 * @param reportSeven
	 *            the reportSeven to set
	 * @since CodingExample Ver 1.0
	 */

	public void setReportSeven(String reportSeven) {
		ReportSeven = reportSeven;
	}

}
