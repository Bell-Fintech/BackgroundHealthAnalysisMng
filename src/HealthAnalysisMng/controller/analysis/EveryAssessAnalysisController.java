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
import HealthAnalysisMng.service.background.EveryAnalysisServiceI;

/**
 * @author wuhoushuang
 * 各项评估结果统计分析控制类
 *
 */
@Controller
@RequestMapping("/everyAssessAnalysisController")
public class EveryAssessAnalysisController extends BaseController{
  
	private EveryAnalysisServiceI everyAnalysisService;

	public EveryAnalysisServiceI getEveryAnalysisService() {
		return everyAnalysisService;
	}
    @Autowired
	public void setEveryAnalysisService(EveryAnalysisServiceI AnalysisService) {
		this.everyAnalysisService = AnalysisService;
	}
    
    @RequestMapping(params = "index")
	public String everyWork(){
		return "admin/analysis/everyDataAnalysis";
	}
    
    /**
     * 获取各项评估结果
     * @param resultFlag 哪项评估结果
     * @return 供jsp页面解析的json字符串
     * @throws Exception
     */
    @RequestMapping(params = "data")
    @ResponseBody
    public AjaxJson getEveryAssessment(@RequestParam("resultFlag") String resultFlag) throws Exception{
    	AjaxJson j=new AjaxJson();
    	List<NameResult> resultDouble;
    	resultDouble=everyAnalysisService.getEveryAnalysisResult(resultFlag);
    	j.setObj(resultDouble);
    	j.setMsg("成功");
    	j.setSuccess(true);
    	return j;
    }
}
