package HealthAnalysisMng.controller;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import HealthAnalysisMng.service.background.ImportExcelServiceI;
import HealthAnalysisMng.service.background.ImportTipsExcelServiceI;
import HealthAnalysisMng.util.ConfigUtil;

@Controller
@RequestMapping("/importTipsController")
public class ImportTipsExcelController extends BaseController{
	private ImportTipsExcelServiceI importTipsExcelService;
	
	
	public ImportTipsExcelServiceI getImportTipsExcelService() {
		return importTipsExcelService;
	}
	@Autowired
	public void setImportTipsExcelService(
			ImportTipsExcelServiceI importTipsExcelService) {
		this.importTipsExcelService = importTipsExcelService;
	}

	@RequestMapping(params = "index")
	public String toImportTipsExcel(){
		return "admin/import/tips";
	}
	
   /**
    * 实现文件上传
 * @param f 文件
 * @param response 响应参数
 * @param request 请求参数
 * @return 页面输出内容
 * @throws Exception
 */
@RequestMapping(params = "tipsUpload")
   public String tipsUpload( @RequestParam("fileToUpload") MultipartFile f
		   ,HttpServletResponse response,HttpServletRequest request) 
		   throws Exception {
	   
		String webParentPath1 = new File(request.getSession().getServletContext().getRealPath("/")).getParent();// 当前WEB环境的上层目录
		String realPath1 = webParentPath1 + ConfigUtil.get("uploadPath");// 文件上传到服务器的真实路径
       //将文件copy上传到服务器
       f.transferTo(new File(realPath1 + System.getProperty("path.separator")+ f.getOriginalFilename()));
       String path=realPath1 +System.getProperty("path.separator") + f.getOriginalFilename();
       String dataTable="cfg_healthkb";
       Integer s=importTipsExcelService.insert(path, dataTable);
       
       response.setCharacterEncoding("utf-8");
       response.setContentType("text/javascript");
       if("1".equals(s.toString())){
    	   PrintWriter pw=null;
    	   pw=response.getWriter();
    	   try {
    	       pw.write("上传成功");
		} catch (Exception e) {
			pw.write("上传失败，请重新上传");
		}finally{
			if(null!=pw){
				pw.flush();
				pw.close();
			}
		}
       }
       if("1".equals(s.toString())){
    	   File file=new File(path);
    	   if(file.isFile()&&file.exists()){
    		   file.delete();
    	   }
       }
		  if("0".equals(s.toString())){
			  PrintWriter pw=null;
			  pw=response.getWriter();
			  try {
				  pw.write("上传失败，请按照模板格式上传");  
			} catch (Exception e) {
				pw.write("上传失败，请重新上传");
			}finally{
				if(null!=pw){
					pw.flush();
					pw.close();
				}
			}
 	      
		   }
		  if(s>1){
			  s=s+1;
			  PrintWriter pw=null;
			  pw=response.getWriter();
			  try {
				  pw.write("上传失败，第"+s+"行有错误,第"+s+"行以上的数据已经保存完毕请删除,否则会保存重复");  
			} catch (Exception e) {
				pw.write("上传失败，请重新上传");
			}finally{
				if(null!=pw){
					pw.flush();
					pw.close();
				}
			}
 	      
		   }
    return "admin/import/tips";
   }
}
