package HealthAnalysisMng.service.background;

import java.util.List;
import java.util.Map;

import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.service.BaseServiceI;

/** 
* @ClassName: DataAnalysisServiceI 
* @Description: 获取全部评估结果接口 
* @author WuHoushuang 
* @date 2015年2月3日 下午5:07:17 
*/
public interface DataAnalysisServiceI extends BaseServiceI{
	
	/** 
	* @Title: getPatientResult 
	* @Description: 获取全部评估结果 
	* @param @return    所有评估结果
	* @return Map<String,Object>    返回类型 
	*/
	public Map<String, Object> getPatientResult();
	/** 
	* @Title: getAllAssessment 
	* @Description: 获取全部评估结果百分数 
	* @param @return 
	* @param @throws Exception    克隆异常 
	* @return List<NameResult>    返回类型 
	* @throws 
	*/
	public List<NameResult> getAllAssessment() throws Exception;
	

}
