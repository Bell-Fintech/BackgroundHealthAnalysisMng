package HealthAnalysisMng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import HealthAnalysisMng.model.AjaxJson;
import HealthAnalysisMng.service.RepairServiceI;


@Controller
@RequestMapping("/repairController")
public class RepairController extends BaseController {

	private RepairServiceI repairService;

	public RepairServiceI getRepairService() {
		return repairService;
	}

	@Autowired
	public void setRepairService(RepairServiceI repairService) {
		this.repairService = repairService;
	}

	@RequestMapping(params = "repair")
	@ResponseBody
	public AjaxJson repair(String id) {
		AjaxJson j = new AjaxJson();
		repairService.repair();
		j.setSuccess(true);
		return j;
	}
	@RequestMapping(params = "repair2")
	@ResponseBody
	public AjaxJson repair2(String id) {
		AjaxJson j = new AjaxJson();
		repairService.repair2();
		j.setSuccess(true);
		return j;
	}
}
