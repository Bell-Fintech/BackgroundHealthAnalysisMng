/**
 * WorkCountServiceI.java
 * onesun.service.background
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年3月23日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
*/

package HealthAnalysisMng.service.background;

import java.util.List;

import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.service.BaseServiceI;

/**
 * ClassName:WorkCountServiceI
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年3月23日		下午10:34:56
 *
 * @see 	 
 *  
 */
public interface WorkCountServiceI extends BaseServiceI{
	public List<NameResult> getWorkCounts();

}

