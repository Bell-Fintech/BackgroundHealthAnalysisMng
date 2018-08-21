package HealthAnalysisMng.model;

import java.util.HashMap;

public class MainMenuData {
	private String id;
	private String text;
	private String state;
	private String iconCls;
	private int leaf;
	private int needRight;
	private int funType;
	private String funName;
	private int orderID;
	private String pid;
	private HashMap attributes;

	public HashMap getAttributes() {
		return attributes;
	}

	public void setAttributes(HashMap attributes) {
		this.attributes = attributes;
	}

	public int getLeaf() {
		return leaf;
	}

	public void setLeaf(int leaf) {
		this.leaf = leaf;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getNeedRight() {
		return needRight;
	}

	public void setNeedRight(int needRight) {
		this.needRight = needRight;
	}

	public int getFunType() {
		return funType;
	}

	public void setFunType(int funType) {
		this.funType = funType;
	}

	public String getFunName() {
		return funName;
	}

	public void setFunName(String funName) {
		this.funName = funName;
	}
	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
}
