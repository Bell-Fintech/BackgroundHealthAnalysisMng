/**
 * AnalysisResultServiceImpl.java
 * onesun.service.impl.background
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年3月16日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.service.impl.background;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import HealthAnalysisMng.hbm.base.AnalysisResult;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.service.background.AnalysisResultServiceI;
import HealthAnalysisMng.service.impl.BaseServiceImpl;

/**
 * ClassName:AnalysisResultServiceImpl Function: TODO ADD FUNCTION Reason: TODO
 * ADD REASON
 *
 * @author wuhoushuang
 * @version
 * @since Ver 1.1
 * @Date 2015年3月16日 上午11:23:22
 *
 * @see
 * 
 */
@Service("analysisResultService")
@Transactional
public class AnalysisResultServiceImpl extends BaseServiceImpl implements
		AnalysisResultServiceI {

	@Override
	public DataGridJson datagrid(DataGrid dg, AnalysisResult analysisResult) {
		DataGridJson j = new DataGridJson();
		List<Object> values = new ArrayList<Object>();
		String hql = " from AnalysisResult t where 1=1 ";
		String totalHql = " select count(*) " + hql;
		j.setTotal(super.getBaseDao().count(totalHql, values));// 设置总记录数
		if (dg.getSort() != null) {// 设置排序
			hql += " order by " + dg.getSort() + " " + dg.getOrder();
		} else {
			hql += " order by name desc ";
		}
		List<AnalysisResult> ol = super.getBaseDao().find(hql, dg.getPage(),
				dg.getRows(), values);// 查询分页
		j.setRows(ol);// 设置返回的行
		return j;

	}

}
