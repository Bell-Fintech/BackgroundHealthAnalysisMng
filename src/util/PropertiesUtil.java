package HealthAnalysisMng.util;

import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * 获得 properties文件 信息
 *
 */
public class PropertiesUtil {
	private static Logger logger = LoggerFactory.getLogger(PropertiesUtil.class);
	private static Properties server = new Properties();
	static{
		try {
			server.load(PropertiesUtil.class.getClassLoader().getResourceAsStream("config/management.properties"));
		} catch (Exception e) {
			logger.error("获取推送消息的资源文件异常",e);
		}
	}
	
	/**
	 * 获取指定key的值
	 * @param key
	 * @return
	 */
	public static String getServerValue(String key){
		return server.getProperty(key);
	}
	
	/**
	 * 获取我的频道
	 * @param key
	 * @return
	 */
	public static String getMyQueue(){
		return server.getProperty("myQueue");
	}
	
	/**
	 * 获取指定服务器路径的值
	 * @param key
	 * @return
	 */
	public static String getActiveMqUrl(){
		return server.getProperty("activeMqUrl");
	}
	
	/**
	 * 获取实时位置的频道
	 * @param key
	 * @return
	 */
	public static String getPositionQueue(){
		return server.getProperty("positionQueue");
	}
	
	/**
	 * 获取连接用户名
	 * @param key
	 * @return
	 */
	public static String getUserName(){
		return server.getProperty("userName");
	}
	
	/**
	 * 获取连接密码
	 * @param key
	 * @return
	 */
	public static String getPassword(){
		return server.getProperty("password");
	}
}
