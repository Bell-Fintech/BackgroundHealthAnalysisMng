package HealthAnalysisMng.service.background;

import HealthAnalysisMng.service.BaseServiceI;

/** 
* @ClassName: ImportExcelServiceI 
* @Description: 导入Excel表接口
* @author WuHoushuang 
* @date 2015年2月3日 下午7:30:28 
*/
public interface ImportTipsExcelServiceI extends BaseServiceI{
	/** 
	* @Title: insert 
	* @Description: 将Excel表中的数据导入到数据库中
	* @param @param path 文件在服务器中的路径
	* @param @param dataTable 要插入的数据库表
	* @param @return 一个码表示导入的状态
	* @param @throws Exception    文件流异常
	* @return Integer    返回类型 
	* @throws 
	*/
	public Integer insert(String path,String dataTable) throws Exception;

}
