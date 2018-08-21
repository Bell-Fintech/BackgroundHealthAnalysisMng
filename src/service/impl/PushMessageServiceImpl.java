/**
 * PushMessageServiceImpl.java
 * onesun.service.impl
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月2日 		wuhoushuang
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

import HealthAnalysisMng.hbm.base.PushMessage;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.service.PushMessageServiceI;

/**
 * ClassName:PushMessageServiceImpl Function: REASON
 *
 * @author dingmingliang
 * @version
 * @since Ver 1.1
 * @Date 2015年4月2日 下午2:19:16
 *
 * @see
 * 
 */
@Transactional
@Service("pushMessageService")
public class PushMessageServiceImpl extends BaseServiceImpl implements
		PushMessageServiceI {

	@Override
	public DataGridJson datagrid(DataGrid dg, PushMessage pushMessage) {

		DataGridJson j = new DataGridJson();
		String hql = " from PushMessage t where 1=1 ";
		List<Object> values = new ArrayList<Object>();
		if (pushMessage != null) {// 添加查询条件
			if (pushMessage.getTitle() != null) {
				hql += " and title like '%%" + pushMessage.getTitle() + "%%' ";
			}
		}
		String totalHql = " select count(*) " + hql;
		j.setTotal(super.getBaseDao().count(totalHql, values));// 设置总记录数
		if (dg.getSort() != null) {// 设置排序
			hql += " order by " + dg.getSort() + " " + dg.getOrder();
		} else {
			hql += " order by createTime desc ";
		}
		List<PushMessage> ol = super.getBaseDao().find(hql, dg.getPage(),
				dg.getRows(), values);// 查询分页
		j.setRows(ol);// 设置返回的行
		return j;

	}

	@Override
	public PushMessage add(PushMessage pushMessage) {
		pushMessage.setId(UUID.randomUUID().toString());
		pushMessage.setCreateTime(new Date());
		super.getBaseDao().save(pushMessage);
		return pushMessage;

	}

	@Override
	public PushMessage edit(PushMessage pushMessage) {
		PushMessage p = (PushMessage) super.getBaseDao().get(PushMessage.class,
				pushMessage.getId());
		pushMessage.setCreateTime(p.getCreateTime());
		BeanUtils.copyProperties(pushMessage, p);
		super.getBaseDao().update(p);
		return p;

	}

	@Override
	public boolean del(String ids) {
		
		boolean r = false;

		try {
			for (String id : ids.split(",")) {
				if (id != null && !id.equals("")) {
					PushMessage d = (PushMessage) super.getBaseDao()
							.load(PushMessage.class, id);
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
	public PushMessage getNew() {

		// TODO Auto-generated method stub
		return null;

	}

}
