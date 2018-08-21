/**
 * WorkCountServiceImpl.java
 * onesun.service.impl.background
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年3月23日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
*/

package HealthAnalysisMng.service.impl.background;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.hbm.base.background.WorkCount;
import HealthAnalysisMng.service.background.WorkCountServiceI;
import HealthAnalysisMng.service.impl.BaseServiceImpl;

/**
 * ClassName:WorkCountServiceImpl
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年3月23日		下午10:36:44
 *
 * @see 	 
 *  
 */
@Transactional
@Service("workCountService")
public class WorkCountServiceImpl extends BaseServiceImpl implements WorkCountServiceI {

	@Override
	public List<NameResult> getWorkCounts() {
		String hql="From WorkCount";
		List<WorkCount> workcounts=super.getBaseDao().createQuery(hql).list();
		int count=0;
		List<NameResult> results=new ArrayList<NameResult>();
		for(int i=0;i<workcounts.size();i++){
			count+=workcounts.get(i).getCount();
		}
		for(int j=0;j<workcounts.size();j++){
			NameResult name=new NameResult();
			int everyCount=workcounts.get(j).getCount();
			double precent=((double)everyCount/count)*100;
			name.setResult(precent);
			name.setName(workcounts.get(j).getWork());
			results.add(name);
		}
		return results;
	}

}

