package HealthAnalysisMng.util;

import java.util.ResourceBundle;

/**
 * 项目参数工具类
 * 
 * @author Bob Chen
 * 
 */
public class ResourceUtil {

	private static final ResourceBundle bundle = java.util.ResourceBundle.getBundle("config/osConfig");

	/**
	 * 获得sessionInfo名字
	 * 
	 * @return
	 */
	public static final String getSessionInfoName() {
		return bundle.getString("sessionInfoName");
	}
	public static final String getSessionUser() {
		return bundle.getString("sessionUser");
	}
	public static final String getSessionMenu() {
		return bundle.getString("sessionMenu");
	}
	public static final String getUploadFilePath() {
		return bundle.getString("uploadFilePath");
	}
	

}
