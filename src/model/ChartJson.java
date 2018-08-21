package HealthAnalysisMng.model;

import java.util.List;

/**
 * @author DingMingliang 封装运动数据的json
 */
public class ChartJson {
	/**
	 * 部门或者团队名称
	 */
	private String name;
	/**
	 * 数据值
	 */
	private Double y;
	/**
	 * 点击事件
	 */
	private List<ChartJson> list;

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
	 * @return the y
	 */
	public Double getY() {
		return y;
	}

	/**
	 * @param y
	 *            the y to set
	 */
	public void setY(Double y) {
		this.y = y;
	}

	/**
	 * @return the list
	 */
	public List<ChartJson> getList() {
		return list;
	}

	/**
	 * @param list
	 *            the list to set
	 */
	public void setList(List<ChartJson> list) {
		this.list = list;
	}

}
