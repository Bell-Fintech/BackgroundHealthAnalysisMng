package HealthAnalysisMng.service.background;

import java.util.List;

import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.service.BaseServiceI;

/** 
* @ClassName: DetectionAnalysisServiceI 
* @Description: 获取各个监测项数据接口
* @author WuHoushuang 
* @date 2015年2月3日 下午5:08:06 
*/
public interface DetectionAnalysisServiceI extends BaseServiceI{
	
	/** 
	* @Title: getWaistlineScope 
	* @Description: 获取不同监测项数据 
	* @param @param data 区分不同监测项
	* @param @return
	* @param @throws Exception    克隆异常 
	* @return List<NameResult>    返回类型 
	* @throws 
	*/
	public List<NameResult> getWaistlineScope(String data) throws Exception;

}
