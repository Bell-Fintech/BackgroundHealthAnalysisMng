/**
 * @author Tian
 * 2014年12月1日
 * MakeStringUtil.java
 * TODO
 */
package HealthAnalysisMng.util;

import java.util.Random;
import java.util.UUID;

/**
 * @author tianye
 *	生成字符串
 */
public class MakeStringUtil {
	/**
	 * 生成随机密码
	 * @author tianye
	 * @param len
	 * @return
	 */
	public static String makePasswd(int len){
		String uuid = UUID.randomUUID().toString();
		String pwd = "";
		for(int i=0;i<len;i++){
			Random random = new Random();
			int tmp = random.nextInt(uuid.length());
			pwd +=uuid.charAt(tmp);
		}
		return pwd;
	}

}
