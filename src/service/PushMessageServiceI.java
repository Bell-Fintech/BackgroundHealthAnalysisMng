/**
 * PushMessageServiceI.java
 * onesun.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月2日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.service;

import HealthAnalysisMng.hbm.base.PushMessage;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;

/**
 * ClassName:PushMessageServiceI Function: TODO ADD FUNCTION Reason: TODO ADD
 * REASON
 *
 * @author dingmingliang
 * @version
 * @since Ver 1.1
 * @Date 2015年4月2日 下午2:17:43
 *
 * @see
 * 
 */
public interface PushMessageServiceI {

	public DataGridJson datagrid(DataGrid dg, PushMessage pushMessage);

	public PushMessage add(PushMessage pushMessage);

	public PushMessage edit(PushMessage pushMessage);

	public boolean del(String ids);

	public PushMessage getNew();
	
}
