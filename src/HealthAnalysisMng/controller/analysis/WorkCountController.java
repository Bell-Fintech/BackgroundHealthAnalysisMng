/**
 * WorkCountController.java
 * onesun.controller.analysis
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年3月23日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
*/

package HealthAnalysisMng.controller.analysis;

import java.util.List;

import org.quartz.impl.calendar.BaseCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import HealthAnalysisMng.controller.BaseController;
import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.model.AjaxJson;
import HealthAnalysisMng.service.background.WorkCountServiceI;

/**
 * ClassName:WorkCountController
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年3月23日		下午10:53:47
 *
 * @see 	 
 *  
 */
@Controller
@RequestMapping("/workCountController")
public class WorkCountController extends BaseController{
	
	private WorkCountServiceI workCountService;

	/**
	 * workCountService
	 *
	 * @return  the workCountService
	 * @since   CodingExample Ver 1.0
	 */
	
	public WorkCountServiceI getWorkCountService() {
		return workCountService;
	}

	/**
	 * workCountService
	 *
	 * @param   workCountService    the workCountService to set
	 * @since   CodingExample Ver 1.0
	 */
	@Autowired
	public void setWorkCountService(WorkCountServiceI workCountService) {
		this.workCountService = workCountService;
	}
	@RequestMapping(params ="workcount")
	public String toworkCount(){
		return "admin/analysis/workcount";
	}
	
	@RequestMapping(params ="getWorkCount")
	@ResponseBody
	public AjaxJson getWorkCount(){
		AjaxJson j=new AjaxJson();
		List<NameResult> counts=workCountService.getWorkCounts();
		j.setMsg("成功");
		j.setObj(counts);
		j.setSuccess(true);
		return j;
	}

}

