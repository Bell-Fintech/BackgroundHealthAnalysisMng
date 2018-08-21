/**
 * DetectionOptionServiceI.java
 * onesun.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年3月14日 		DingMingliang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.service;

import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.model.DetectionOptionModel;

/**
 * ClassName:DetectionOptionServiceI Function: TODO ADD FUNCTION Reason: TODO
 * ADD REASON
 *
 * @author DingMingliang
 * @version
 * @since Ver 1.1
 * @Date 2015年3月14日 下午3:16:04
 *
 * @see
 * 
 */
public interface DetectionOptionServiceI {
	/**
	 * @Title: datagrid
	 * @Description: 24小时检测值
	 * @param @param dg
	 * @param @param displayMessage
	 * @param @return 设定文件
	 * @return DataGridJson 返回类型
	 */
	public DataGridJson datagrid(DataGrid dg,
			DetectionOptionModel detectionOption);

	/**
	 * @Title: add
	 * @Description:  24小时检测值
	 * @param @param displaymessage 要发布的公共信息
	 * @param @return 公共信息
	 * @return Displaymessage 返回类型
	 */
	public DetectionOptionModel add(DetectionOptionModel detectionOption);

	/**
	 * @Title: edit
	 * @Description:  24小时检测值
	 * @param @param displaymessage 要修改的公共信息
	 * @param @return 修改完的这条公共信息
	 * @return Displaymessage 返回类型
	 */
	public DetectionOptionModel edit(DetectionOptionModel detectionOption);

	/**
	 * @Title: delete
	 * @Description:  24小时检测值
	 * @param @param ids 公共信息ID
	 * @return void 返回类型
	 */
	public void delete(String ids);
}
