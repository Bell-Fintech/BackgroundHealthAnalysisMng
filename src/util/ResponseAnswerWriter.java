package HealthAnalysisMng.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletResponse;


/** 根据客户端提交的参数选择将结果写入到返回response当中 */
public class ResponseAnswerWriter {
	
	public static void writeAnswer(String answer,
			ServletResponse response, String encoding) throws IOException 
	{
		if (encoding == null) {
			encoding = "utf-8";
		}
		
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		
//		if (type == null) {
//			answer.writeToMobile(bos, encoding);
//		} else {
//			answer.writeToBrowser(bos, encoding);
//		}
		
		bos.write(answer.getBytes(encoding));
		
		int contentLen = bos.size();
		
		if (response.getBufferSize() < contentLen) {
			response.setBufferSize(contentLen);
		}
		response.setContentLength(bos.size());
		bos.writeTo(response.getOutputStream());
		bos.close();
	}

}
