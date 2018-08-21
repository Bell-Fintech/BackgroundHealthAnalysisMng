package HealthAnalysisMng.model;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import HealthAnalysisMng.util.JsonDateOnlySerializer;

/**
 * @author DingMingliang 封装运动数据的json
 */
public class SportsCondition {

	/**
	 * 结果
	 */
	private ChartJson chartJson;

	/**
	 * 部门或者团队id
	 */
	private String id;
	/**
	 * 性别
	 */
	private Integer sex;
	/**
	 * 年龄区间
	 */
	private Integer ageSection;
	/**
	 * 部门或者团队名称
	 */
	private String name;
	/**
	 * 开始时间
	 */
	private Date startTime;
	/**
	 * 结束时间
	 */
	private Date endTime;

	/**
	 * rankingUserList:排名
	 *
	 * @since Ver 1.1
	 */
	private List<ChartJson> rankingUserList;

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the startTime
	 */
	@JsonSerialize(using = JsonDateOnlySerializer.class)
	public Date getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime
	 *            the startTime to set
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return the endTime
	 */
	@JsonSerialize(using = JsonDateOnlySerializer.class)
	public Date getEndTime() {
		return endTime;
	}

	/**
	 * @param endTime
	 *            the endTime to set
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the sex
	 */
	public Integer getSex() {
		return sex;
	}

	/**
	 * @param sex
	 *            the sex to set
	 */
	public void setSex(Integer sex) {
		this.sex = sex;
	}

	/**
	 * @return the ageSection
	 */
	public Integer getAgeSection() {
		return ageSection;
	}

	/**
	 * @param ageSection
	 *            the ageSection to set
	 */
	public void setAgeSection(Integer ageSection) {
		this.ageSection = ageSection;
	}

	/**
	 * @return the chartJson
	 */
	public ChartJson getChartJson() {
		return chartJson;
	}

	/**
	 * @param chartJson
	 *            the chartJson to set
	 */
	public void setChartJson(ChartJson chartJson) {
		this.chartJson = chartJson;
	}

	/**
	 * rankingUserList
	 *
	 * @return the rankingUserList
	 * @since CodingExample Ver 1.0
	 */

	public List<ChartJson> getRankingUserList() {
		return rankingUserList;
	}

	/**
	 * rankingUserList
	 *
	 * @param rankingUserList
	 *            the rankingUserList to set
	 * @since CodingExample Ver 1.0
	 */

	public void setRankingUserList(List<ChartJson> rankingUserList) {
		this.rankingUserList = rankingUserList;
	}

}
