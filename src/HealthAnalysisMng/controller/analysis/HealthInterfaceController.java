package HealthAnalysisMng.controller.analysis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import HealthAnalysisMng.hbm.base.background.HealthInterface;
import HealthAnalysisMng.model.AjaxJson;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.service.background.HealthInterfaceServiceI;

@Controller
@RequestMapping("/healthInterfaceController")
public class HealthInterfaceController {

	private HealthInterfaceServiceI healthInterfaceService;

	public HealthInterfaceServiceI gethealthInterfaceService() {
		return healthInterfaceService;
	}
	@Autowired
	public void sethealthInterfaceService(HealthInterfaceServiceI healthInterfaceService) {
		this.healthInterfaceService = healthInterfaceService;
	}
	
	/**
	 * 添加指标
	 * @param healthInterface 指标实体
	 * @return 供jsp页面解析的json字符串
	 */
	@RequestMapping(params = "add")
	@ResponseBody
	public AjaxJson addHealthInterface(HealthInterface healthInterface){
		AjaxJson j=new AjaxJson();
		HealthInterface e=healthInterfaceService.addHealthInterface(healthInterface);
		j.setMsg("添加成功");
		j.setObj(e);
		j.setSuccess(true);
		return j;
	}
	
	@RequestMapping(params = "index")
	public String toHealthInterface(){
		return "admin/healthinterface/index";
	}
	
	/**
	 * 指标管理展示
	 * @param dg 向后台传递参数的model
	 * @param healthInterface 指标实体
	 * @return 供表格展示的json字符串
	 */
	@RequestMapping(params = "datagrid")
	@ResponseBody
	public DataGridJson getDataGrid(DataGrid dg,HealthInterface healthInterface){
		return healthInterfaceService.datagrid(dg, healthInterface);
	}
	
	/**
	 * 编辑或修改指标
	 * @param id 指标ID
	 * @param healthInterface 指标
	 * @return 供jsp页面解析的json字符串
	 */
	@RequestMapping(params = "edit")
	@ResponseBody
	public AjaxJson edit(@RequestParam("id") String id,HealthInterface healthInterface) {
		AjaxJson j = new AjaxJson();
		try {
			healthInterface.setId(id);
			HealthInterface e = healthInterfaceService.edit(healthInterface);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
			j.setObj(e);
		} catch (Exception e) {
			j.setMsg("修改错误！");
			e.printStackTrace();
		}
		return j;
	}
	
	/**
	 * 删除一个或多个指标
	 * @param ids 一个或多个指标ID 
	 * @return 供jsp页面解析的json字符串
	 */
	@RequestMapping(params = "delete")
	@ResponseBody
	public AjaxJson deleteHealthInterface(String ids){
		AjaxJson j=new AjaxJson();
		try {
			healthInterfaceService.delete(ids);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
			e.printStackTrace();
		}
		return j;
	}
}
