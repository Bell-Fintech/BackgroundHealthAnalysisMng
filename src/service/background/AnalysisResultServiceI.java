/**
 * AnalysisResultServiceI.java
 * onesun.service.background
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年3月16日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
*/

package HealthAnalysisMng.service.background;

import HealthAnalysisMng.hbm.base.AnalysisResult;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;

/**
 * ClassName:AnalysisResultServiceI
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年3月16日		上午11:19:55
 *
 * @see 	 
 *  
 */
public interface AnalysisResultServiceI {
	 /** 
	    * @Title: datagrid 
	    * @Description: 公共信息发布
	    * @param @param dg  
	    * @param @param displayMessage
	    * @param @return    设定文件 
	    * @return DataGridJson    返回类型 
	    */
	    public DataGridJson datagrid(DataGrid dg, AnalysisResult analysisResult);
}

