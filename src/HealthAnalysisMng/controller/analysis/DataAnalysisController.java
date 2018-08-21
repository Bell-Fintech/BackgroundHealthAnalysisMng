package HealthAnalysisMng.controller.analysis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import HealthAnalysisMng.controller.BaseController;
import HealthAnalysisMng.hbm.base.PrecentResult;
import HealthAnalysisMng.hbm.base.background.DataResult;
import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.model.AjaxJson;
import HealthAnalysisMng.service.background.DataAnalysisServiceI;

/**
 * @author wuhoushuang
 * 整体评估结果控制类
 *
 */
@Controller
@RequestMapping("/dataAnalysisController")
public class DataAnalysisController extends BaseController{
	private static final Log log=LogFactory.getLog(DataAnalysisController.class);
	
	private DataAnalysisServiceI dataAnalysisService;
	
	public DataAnalysisServiceI getDataAnalysisService() {
		return dataAnalysisService;
	}
    @Autowired
	public void setDataAnalysisService(DataAnalysisServiceI dataservice) {
		this.dataAnalysisService = dataservice;
	}

	@RequestMapping(params = "index")
	public String dataIndex(){
		return "admin/analysis/dataAnalysis";
	}
	
	/**
	 * 获取数据库中数据展示
	 * @return 供jsp页面解析的json字符串
	 * @throws CloneNotSupportedException
	 */
	@RequestMapping(params = "data")
	@ResponseBody
	public AjaxJson getData() throws CloneNotSupportedException{
		AjaxJson j=new AjaxJson();
		DataResult data=new DataResult();
		Map<String, Object> map=dataAnalysisService.getPatientResult();
		List<NameResult> resultDouble=new ArrayList<NameResult>();
		List<NameResult> subList=new ArrayList<NameResult>();
		List<NameResult> healthList=new ArrayList<NameResult>();
		List<NameResult> patientList=new ArrayList<NameResult>();
		List<NameResult> RiskList=new ArrayList<NameResult>();
		if(map==null){
			return null;
		}
		Set<String> keys=map.keySet();
		for(String s:keys){
			if(s.contains("List")){
				List<PrecentResult> resultList=(List<PrecentResult>) map.get(s);
				NameResult nameResult=new NameResult();
				if("healthList".equals(s)){
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("动脉粥样硬化指数");
					nameResult.setResult(resultList.get(0).getAteryPrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("肥胖风险");
					nameResult.setResult(resultList.get(0).getAteryPrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("腰围身高比");
					nameResult.setResult(resultList.get(0).getWaistHeightPrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("腰围");
					nameResult.setResult(resultList.get(0).getWaistlinePrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("体脂肪率");
					nameResult.setResult(resultList.get(0).getFatRatePrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("血糖");
					nameResult.setResult(resultList.get(0).getSugarPrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("血压");
					nameResult.setResult(resultList.get(0).getPressurePrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("血脂");
					nameResult.setResult(resultList.get(0).getFatPrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("代谢综合症");
					nameResult.setResult(resultList.get(0).getMetabolicPrecent());
					healthList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("BMI");
					nameResult.setResult(resultList.get(0).getBMIPrecent());
					healthList.add(nameResult);
					
					
				}
				if("subHealthList".equals(s)){
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("动脉粥样硬化指数");
					nameResult.setResult(resultList.get(0).getAteryPrecent());
					subList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("肥胖风险");
					nameResult.setResult(resultList.get(0).getAteryPrecent());
					subList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("腰围身高比");
					nameResult.setResult(resultList.get(0).getWaistHeightPrecent());
					subList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("腰围");
					nameResult.setResult(resultList.get(0).getWaistlinePrecent());
					subList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("体脂肪率");
					nameResult.setResult(resultList.get(0).getFatRatePrecent());
					subList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("BMI");
					nameResult.setResult(resultList.get(0).getBMIPrecent());
					subList.add(nameResult);
				}
				if("patientHealthList".equals(s)){
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("血糖");
					nameResult.setResult(resultList.get(0).getSugarPrecent());
					patientList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("血压");
					nameResult.setResult(resultList.get(0).getPressurePrecent());
					patientList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("BMI");
					nameResult.setResult(resultList.get(0).getBMIPrecent());
					patientList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("肥胖风险");
					nameResult.setResult(resultList.get(0).getRiskPrecent());
					patientList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("腰围");
					nameResult.setResult(resultList.get(0).getWaistlinePrecent());
					patientList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("体脂肪率");
					nameResult.setResult(resultList.get(0).getFatRatePrecent());
					patientList.add(nameResult);
				}
				if("riskList".equals(s)){
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("血糖");
					nameResult.setResult(resultList.get(0).getSugarPrecent());
					RiskList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("血压");
					nameResult.setResult(resultList.get(0).getPressurePrecent());
					RiskList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("血脂");
					nameResult.setResult(resultList.get(0).getFatPrecent());
					RiskList.add(nameResult);
					nameResult=(NameResult) nameResult.clone();
					nameResult.setName("代谢综合症");
					nameResult.setResult(resultList.get(0).getMetabolicPrecent());
					RiskList.add(nameResult);
				}
			}else{
			Double number=(Double) map.get(s);
			NameResult nameResult=new NameResult();
			if("health".equals(s)){
				nameResult.setName("健康");
				nameResult.setResult(number);
				nameResult.setResultList(healthList);
				resultDouble.add(nameResult);
			}
			if("subHealth".equals(s)){
				nameResult.setName("亚健康");
				nameResult.setResult(number);
				nameResult.setResultList(subList);
				resultDouble.add(nameResult);
			}
			if("paitent".equals(s)){
				nameResult.setName("病人");
				nameResult.setResult(number);
				nameResult.setResultList(patientList);
				resultDouble.add(nameResult);
			}
			if("highRiskHealth".equals(s)){
				nameResult.setName("高危病人");
				nameResult.setResult(number);
				nameResult.setResultList(RiskList);
				resultDouble.add(nameResult);
			}
			}
			
			
		}
		
		data.setResult(resultDouble);
		j.setMsg("成功");
		j.setObj(data);
		boolean success = true;
		j.setSuccess(success);
		return j;
	}
	/**
	 * 获取数据库中全部评估结果
	 * @return 供jsp页面解析的json字符串
	 * @throws Exception
	 */
	@RequestMapping(params = "result")
	@ResponseBody
	public AjaxJson getResult() throws Exception{
		AjaxJson j=new AjaxJson();
		List<NameResult> results=dataAnalysisService.getAllAssessment();
		System.out.println(results);
		j.setMsg("成功");
		j.setObj(results);
		j.setSuccess(true);
		return j;
	}
}
