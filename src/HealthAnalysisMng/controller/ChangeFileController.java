/**
 * ChangeFileController.java
 * onesun.controller
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月3日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import HealthAnalysisMng.hbm.base.Template;
import HealthAnalysisMng.model.AjaxJson;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.model.DepartmentModel;
import HealthAnalysisMng.model.TemplateAjaxJson;
import HealthAnalysisMng.service.TemplateServiceI;

/**
 * ClassName:ChangeFileController Function: TODO ADD FUNCTION Reason: TODO ADD
 * REASON
 *
 * @author dingmingliang
 * @version
 * @since Ver 1.1
 * @Date 2015年4月3日 上午10:01:00
 *
 * @see
 * 
 */
@Controller
@RequestMapping("/changeFileController")
public class ChangeFileController extends BaseController {

	private TemplateServiceI templateService;

	/**
	 * templateService
	 *
	 * @return the templateService
	 * @since CodingExample Ver 1.0
	 */

	public TemplateServiceI getTemplateService() {
		return templateService;
	}

	/**
	 * templateService
	 *
	 * @param templateService
	 *            the templateService to set
	 * @since CodingExample Ver 1.0
	 */
	@Autowired
	public void setTemplateService(TemplateServiceI templateService) {
		this.templateService = templateService;
	}

	@RequestMapping(params = "currentPath")
	public String getCurrentPath(@RequestParam("fileToUpload") MultipartFile f,
			@RequestParam("filePath") String path, HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException,
			IOException {
		// 取得根目录路径
		// String rootPath =
		// getClass().getResource("../../../../").getFile().toString();
		String rootPath = request.getSession().getServletContext()
				.getRealPath("/");
		// /usr/local/apache-tomcat-7.0.57/webapps/management/
		// healthportal
		rootPath = rootPath.substring(0, rootPath.length() - 1);
		rootPath = rootPath.substring(0, rootPath.lastIndexOf("/") + 1);
		// "healthportal/img/m_portal.jpg"
		rootPath = rootPath + path;
		File file = new File(rootPath);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete();
		}
		f.transferTo(new File(rootPath));
		// 当前目录路径

		PrintWriter pw = null;
		pw = response.getWriter();
		try {
			pw.write("上传成功");
		} catch (Exception e) {
			pw.write("上传失败，请重新上传");
		} finally {
			if (null != pw) {
				pw.flush();
				pw.close();
			}
		}
		return "admin/changeFile/index";
	}

	@RequestMapping(params = "index")
	public String index() {
		return "admin/changeFile/index";
	}

	@RequestMapping(params = "upload", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson upload(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {
		AjaxJson j = new AjaxJson();
		String rootPath = request.getSession().getServletContext()
				.getRealPath("/");
		rootPath = rootPath.substring(0, rootPath.length() - 1);
		rootPath = rootPath.substring(0, rootPath.lastIndexOf("/") + 1);
		file.transferTo(new File(rootPath + "change/" + file.getOriginalFilename()));
		j.setObj(file.getOriginalFilename());
		return j;
	}

	@RequestMapping(params = "datagrid")
	@ResponseBody
	public DataGridJson datagrid(DataGrid dg, TemplateAjaxJson templateAjaxJson) {
		return templateService.datagrid(dg, templateAjaxJson);
	}

	@RequestMapping(params = "add")
	@ResponseBody
	public AjaxJson add(TemplateAjaxJson templateAjaxJson) {
		AjaxJson j = new AjaxJson();
		try {
			templateService.add(templateAjaxJson);
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg("稍后重试!");
		}
		return j;
	}

	@RequestMapping(params = "edit")
	@ResponseBody
	public AjaxJson edit(TemplateAjaxJson templateAjaxJson) {
		AjaxJson j = new AjaxJson();
		try {
			templateService.edit(templateAjaxJson);
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg("稍后重试!");
		}
		return j;
	}

	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(String ids) {
		
		AjaxJson j = new AjaxJson();
		try {
			templateService.del(ids);
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg("稍后重试!");
		}
		return j;
	}

	@RequestMapping(params = "list")
	@ResponseBody
	public List<Template> list() {
		return templateService.list();
	}
}
