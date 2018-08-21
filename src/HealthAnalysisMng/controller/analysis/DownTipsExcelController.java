package HealthAnalysisMng.controller.analysis;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import HealthAnalysisMng.service.background.ImportExcelServiceI;

/** 
* @ClassName: DownTipsExcelController 
* @Description: 下载健康贴士Excel表 
* @author WuHoushuang 
* @date 2015年3月11日 下午4:30:05 
* @changelog 更改日志：增加下载健康贴士Excel表
*/
@Controller
@RequestMapping("/downTipsController")
public class DownTipsExcelController {
	private ImportExcelServiceI importExcelService;
	
	public ImportExcelServiceI getImportExcelService() {
		return importExcelService;
	}
	public void setImportExcelService(ImportExcelServiceI importExcelService) {
		this.importExcelService = importExcelService;
	}
	 /**
	  * 实现文档模板下载
	 * @param request 请求参数
	 * @param response 响应参数
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(params = "download")  
	  public String download(HttpServletRequest request,  
	      HttpServletResponse response) throws Exception {  
	    String storeName="健康贴士.xls";
	    String contentType = "application/octet-stream";  
	    DownLoadExcelController.download(request, response, storeName, contentType);  
	    return null;  
	  }  
	/**
	 * 文档下载
	 * @param request 请求参数
	 * @param response 响应参数
	 * @param storeName 文件名称
	 * @param contentType 网页文件类型 
	 * @throws Exception
	 */
	public static void download(HttpServletRequest request,  
		      HttpServletResponse response, String storeName, String contentType
		       ) throws Exception {  
		    
		    request.setCharacterEncoding("UTF-8");  
		    BufferedInputStream bis = null;  
		    BufferedOutputStream bos = null;  
		  
		    //获取项目根目录
		    String ctxPath = request.getSession().getServletContext()  
		        .getRealPath("");  
		    
		    //获取下载文件露肩
		    String downLoadPath = ctxPath+"/uploadFile/"+ storeName;  
		  
		    //获取文件的长度
		    long fileLength = new File(downLoadPath).length();  

		    //设置文件输出类型
		    response.setContentType("application/octet-stream");  
		    response.setHeader("Content-disposition", "attachment; filename="  
		        + new String(storeName.getBytes("utf-8"), "ISO8859-1")); 
		    //设置输出长度
		    response.setHeader("Content-Length", String.valueOf(fileLength));  
		    //获取输入流
		    bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
		    //输出流
		    bos = new BufferedOutputStream(response.getOutputStream());  
		    byte[] buff = new byte[2048];  
		    int bytesRead;  
		    while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
		      bos.write(buff, 0, bytesRead);  
		    }  
		    //关闭流
		    bis.close();  
		    bos.close();  
		  }  
}
