package HealthAnalysisMng.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author shengl
 * 用来解析所有的request请求参数 REQUEST参数详解 <br>
 * getAttribute(String name)：返回由name指定的属性值<br>
 * getAttributeNames()：返回request对象所有属性的名字集合，结果是一个枚举的实例<br>
 * getCharacterEncoding()：返回请求中的字符编码方式 <br>
 * getContentLength()：返回请求的Body的长度<br>
 * getCookies()：返回客户端的所有Cookie对象，结果是一个Cookie数组 <br>
 * getHeader(String name)：获得HTTP协议定义的文件头信息 <br>
 * getHeaderNames()：返回所以request Header的名字，结果是一个枚举的实例<br>
 * getHeaders(String name)：返回指定名字的request Header的所有值，结果是一个枚举的实例<br>
 * getInputStream()：返回请求的输入流，用于获得请求中的数据 <br>
 * getMethod()：获得客户端向服务器端传送数据的方法<br>
 * getParameter(String name)：获得客户端传送给服务器端的有name指定的参数值<br>
 * getParameterNames()：获得客户端传送给服务器端的所有参数的名字，结果是一个枚举的实例 <br>
 * getParameterValues(String name)：获得有name指定的参数的所有值 <br>
 * getProtocol()：获取客户端向服务器端传送数据所依据的协议名称<br>
 * getQueryString()：获得查询字符串 <br>
 * getRemoteAddr()：获取客户端的IP地址 <br>
 * getRemoteHost()：获取客户端的名字<br>
 * getRequestURI()：获取发出请求字符串的客户端地址 <br>
 * getServerName()：获取服务器的名字 <br>
 * getServerPort()：获取服务器的端口号 <br>
 * getServletPath()：获取客户端所请求的脚本文件的路径<br>
 * getSession([Boolean create])：返回和请求相关Session <br>
 * removeAttribute(String name)：删除请求中的一个属性 <br>
 * setAttribute(String name,Object)：设置名字为name的request的参数值<br>
 */
public class RequestInfoUtil {

	private static final Log log = LogFactory.getLog(RequestInfoUtil.class);

	/** 解析request */
	public static String requestInfo(HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append("RequestInfo:\n");
		sb.append("info{character=").append(request.getCharacterEncoding());
		sb.append(", length=").append(request.getContentType());
		sb.append("}");
		sb.append("client{ RemoteClientIP=").append(request.getRemoteAddr());
		sb.append(", RemoteHost=").append(request.getRemoteHost())
				.append(", RequestURI=");
		sb.append(request.getRequestURI()).append("}\n server{ ServerName=")
				.append(request.getServerName());
		sb.append(", ServletPort=").append(request.getServerPort())
				.append(", ServletPath");
		sb.append(request.getServletPath()).append("}\n");
		sb.append("]");
		return sb.toString();
	}

	public static void invoke(HttpServletRequest request) {
		Enumeration<String> requestNames = request.getAttributeNames();
		Map<String, String> requestParams = new HashMap<String, String>();

		while (requestNames.hasMoreElements()) {
			String name = requestNames.nextElement();

			String attrValue = (String) request.getAttribute(name);
		}

		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();

			String[] paramValues = request.getParameterValues(paramName);
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if (paramValue.length() != 0) {
					log.info("参数：" + paramName + "=" + paramValue);
					requestParams.put(paramName, paramValue);
				}
			}
		}
	}
	
	/** 将request的请求解析成为一个参数列表 */
	public static Map<String,String> extractParameters(ServletRequest request) {
		Map<String,String> params = new HashMap<String,String>();
		Enumeration<String> keys = (Enumeration<String>)request.getParameterNames();
		while (keys.hasMoreElements()) {
			String key = keys.nextElement();
			// 如果同一个参数有多个值，将只取第一个
			String value = request.getParameter(key);
			params.put(key, value);
		}
		return params;
	}

}
