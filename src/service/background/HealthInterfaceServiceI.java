package HealthAnalysisMng.service.background;

import HealthAnalysisMng.hbm.base.background.HealthInterface;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.service.BaseServiceI;

public interface HealthInterfaceServiceI extends BaseServiceI{

	/** 
	* @Title: addHealthInterface 
	* @Description: 添加一个版本 
	* @param @param HealthInterface 版本
	* @param @return    添加的这个版本 
	* @return HealthInterface    返回类型 
	*/
	public HealthInterface addHealthInterface(HealthInterface healthInterface);
	/** 
	* @Title: datagrid 
	* @Description: 展示所有版本 
	* @param @param dg 供后台传递参数的model
	* @param @param HealthInterface 版本
	* @param @return    供jsp页面展示的json字符串
	* @return DataGridJson    返回类型 
	*/
	public DataGridJson datagrid(DataGrid dg, HealthInterface healthInterface);
	/** 
	* @Title: edit 
	* @Description: 编辑版本 
	* @param @param HealthInterface 版本
	* @param @return    正在编辑的那个版本
	* @return HealthInterface    返回类型 
	*/
	public HealthInterface edit(HealthInterface healthInterface);
	/** 
	* @Title: delete 
	* @Description: 删除一个或多个版本 
	* @param @param ids   一个或多个版本ID
	* @return void    返回类型 
	*/
	public void delete(String ids);
}
