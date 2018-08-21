package HealthAnalysisMng.controller.analysis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import HealthAnalysisMng.controller.BaseController;
import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.model.AjaxJson;
import HealthAnalysisMng.service.background.DetectionAnalysisServiceI;

/**
 * @author wuhoushuang
 * 监测数据分析控制类
 *
 */
@Controller
@RequestMapping("/detectionAnalysisController")
public class DetectionAnalysisController extends BaseController{
	
	private DetectionAnalysisServiceI detectionAnslysisService;
	
	
	public DetectionAnalysisServiceI getDetectionAnslysisService() {
		return detectionAnslysisService;
	}
	@Autowired
	public void setDetectionAnslysisService(
			DetectionAnalysisServiceI detectionAnslysisService) {
		this.detectionAnslysisService = detectionAnslysisService;
	}

	@RequestMapping(params = "index")
	public String index(){
		return "admin/analysis/detectionAnalysis";
	}
	
	/**
	 * 获取各个监测项数据结果
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params = "data")
	@ResponseBody
	public AjaxJson getWaistline(@RequestParam("result") String data) throws Exception{
		AjaxJson j=new AjaxJson();
		List<NameResult> resultList=detectionAnslysisService.getWaistlineScope(data);
		j.setObj(resultList);
		j.setSuccess(true);
		j.setMsg("成功");
		return j;
	}
	

}
