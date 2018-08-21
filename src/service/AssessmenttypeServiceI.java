/**
 * AssessmenttypeServiceI.java
 * onesun.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月6日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
*/

package HealthAnalysisMng.service;

import HealthAnalysisMng.hbm.base.AssessResultDictionary;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;

/**
 * ClassName:AssessmenttypeServiceI
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   dingmingliang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年4月6日		下午9:31:52
 *
 * @see 	 
 *  
 */
public interface AssessmenttypeServiceI {
	
	public DataGridJson datagrid(DataGrid dg, AssessResultDictionary pushMessage);

	public AssessResultDictionary add(AssessResultDictionary pushMessage);

	public AssessResultDictionary edit(AssessResultDictionary pushMessage);

	public boolean del(String ids);

	public AssessResultDictionary getNew();

}

