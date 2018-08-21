package HealthAnalysisMng.service.background;

import java.util.List;

import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.service.BaseServiceI;


/** 
* @ClassName: EveryAnalysisServiceI 
* @Description: 获取每一个评估结果接口
* @author WuHoushuang 
* @date 2015年2月3日 下午7:10:49 
*/
public interface EveryAnalysisServiceI extends BaseServiceI{
	
	/** 
	* @Title: getEveryAnalysisResult 
	* @Description: 获取每一个评估结果百分值 
	* @param @param everyAssessment
	* @param @return  百分值集合
	* @param @throws Exception   克隆异常
	* @return List<NameResult>    返回类型 
	* @throws 
	*/
	public List<NameResult> getEveryAnalysisResult(String everyAssessment) throws Exception;

}
