/**
 * PushMessageController.java
 * onesun.controller
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月2日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import HealthAnalysisMng.hbm.base.AssessResultDictionary;
import HealthAnalysisMng.hbm.base.PushMessage;
import HealthAnalysisMng.model.AjaxJson;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.service.AssessmenttypeServiceI;
import HealthAnalysisMng.service.PushMessageServiceI;


/**
 * ClassName:AssessmenttypeController
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   dingmingliang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015	2015年4月6日		下午9:30:30
 *
 * @see 	 
 *  
 */
@Controller
@RequestMapping("/admin/assessmenttypeController")
public class AssessmenttypeController extends BaseController {

	private AssessmenttypeServiceI assessmenttypeService;

	/**
	 * assessmenttypeService
	 *
	 * @return  the assessmenttypeService
	 * @since   CodingExample Ver 1.0
	 */
	
	public AssessmenttypeServiceI getAssessmenttypeService() {
		return assessmenttypeService;
	}

	/**
	 * assessmenttypeService
	 *
	 * @param   assessmenttypeService    the assessmenttypeService to set
	 * @since   CodingExample Ver 1.0
	 */
	@Autowired
	public void setAssessmenttypeService(
			AssessmenttypeServiceI assessmenttypeService) {
		this.assessmenttypeService = assessmenttypeService;
	}

	@RequestMapping(params = "index")
	public String index() {
		return "admin/assessmenttype/index";
	}

	@RequestMapping(params = "datagrid")
	@ResponseBody
	public DataGridJson datagrid(DataGrid dg, AssessResultDictionary assessResultDictionary) {
		return assessmenttypeService.datagrid(dg, assessResultDictionary);
	}

	@RequestMapping(params = "add")
	@ResponseBody
	public AjaxJson add(AssessResultDictionary assessResultDictionary) {
		AjaxJson j = new AjaxJson();
		try {
			j.setSuccess(true);
			assessmenttypeService.add(assessResultDictionary);
		} catch (Exception e) {
			j.setSuccess(false);
		}
		return j;
	}

	@RequestMapping(params = "edit")
	@ResponseBody
	public AjaxJson edit(AssessResultDictionary assessResultDictionary) {
		AjaxJson j = new AjaxJson();
		try {
			j.setSuccess(true);
			assessmenttypeService.edit(assessResultDictionary);
		} catch (Exception e) {
			j.setSuccess(false);
		}
		return j;
	}

	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(String ids) {
		AjaxJson j = new AjaxJson();
		try {
			j.setSuccess(assessmenttypeService.del(ids));
		} catch (Exception e) {
			j.setSuccess(false);
		}
		return j;
	}
}
