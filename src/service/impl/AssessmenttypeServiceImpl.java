/**
 * AssessmenttypeServiceImpl.java
 * onesun.service.impl
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月6日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
*/

package HealthAnalysisMng.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import HealthAnalysisMng.hbm.base.AssessResultDictionary;
import HealthAnalysisMng.hbm.base.PushMessage;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.service.AssessmenttypeServiceI;

/**
 * ClassName:AssessmenttypeServiceImpl
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   dingmingliang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年4月6日		下午9:32:29
 *
 * @see 	 
 *  
 */
@Transactional
@Service("assessmenttypeService")
public class AssessmenttypeServiceImpl extends BaseServiceImpl implements
		AssessmenttypeServiceI {

	@Override
	public DataGridJson datagrid(DataGrid dg, AssessResultDictionary assessResultDictionary) {
		DataGridJson j = new DataGridJson();
		String hql = " from AssessResultDictionary t where 1=1 ";
		List<Object> values = new ArrayList<Object>();
		String totalHql = " select count(*) " + hql;
		j.setTotal(super.getBaseDao().count(totalHql, values));// 设置总记录数
		List<PushMessage> ol = super.getBaseDao().find(hql, dg.getPage(),
				dg.getRows(), values);// 查询分页
		j.setRows(ol);// 设置返回的行
		return j;
	}

	@Override
	public AssessResultDictionary add(AssessResultDictionary assessResultDictionary) {
		assessResultDictionary.setDataId(UUID.randomUUID().toString());
		super.getBaseDao().save(assessResultDictionary);
		return assessResultDictionary;

	}

	@Override
	public AssessResultDictionary edit(AssessResultDictionary assessResultDictionary) {
		AssessResultDictionary p = (AssessResultDictionary) super.getBaseDao().get(AssessResultDictionary.class,
				assessResultDictionary.getDataId());
		BeanUtils.copyProperties(assessResultDictionary, p);
		super.getBaseDao().update(p);
		return p;
	}

	@Override
	public boolean del(String ids) {
		boolean r = false;

		try {
			for (String id : ids.split(",")) {
				if (id != null && !id.equals("")) {
					AssessResultDictionary d = (AssessResultDictionary) super.getBaseDao()
							.load(AssessResultDictionary.class, id);
					super.getBaseDao().delete(d);

				}
			}
			r = true;
		} catch (Exception e) {
			r = false;

		}
		return r;

	}

	@Override
	public AssessResultDictionary getNew() {

		// TODO Auto-generated method stub
		return null;

	}

}

