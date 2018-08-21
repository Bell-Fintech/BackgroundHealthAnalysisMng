/**
 * TemplateServiceImpl.java
 * onesun.service.impl
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月3日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;

import HealthAnalysisMng.hbm.base.PushMessage;
import HealthAnalysisMng.hbm.base.Template;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.model.DetectionOptionJson;
import HealthAnalysisMng.model.DetectionOptionModel;
import HealthAnalysisMng.model.TemplateAjaxJson;
import HealthAnalysisMng.model.TemplateJson;
import HealthAnalysisMng.service.TemplateServiceI;

/**
 * ClassName:TemplateServiceImpl Function: TODO ADD FUNCTION Reason: TODO ADD
 * REASON
 *
 * @author dingmingliang
 * @version
 * @since Ver 1.1
 * @Date 2015年4月3日 下午4:25:39
 *
 * @see
 * 
 */
@Service("templateService")
@Transactional
public class TemplateServiceImpl extends BaseServiceImpl implements
		TemplateServiceI {

	@Override
	public DataGridJson datagrid(DataGrid dg, TemplateAjaxJson templateAjaxJson) {

		DataGridJson j = new DataGridJson();
		String hql = " from Template t where 1=1 ";
		List<Object> values = new ArrayList<Object>();
		String totalHql = " select count(*) " + hql;
		j.setTotal(super.getBaseDao().count(totalHql, values));// 设置总记录数
		hql += " order by templateName desc ";
		List<Template> ol = super.getBaseDao().find(hql, dg.getPage(),
				dg.getRows(), values);// 查询分页
		List<TemplateAjaxJson> tl = new ArrayList<TemplateAjaxJson>();
		for (Template o : ol) {
			TemplateAjaxJson t = new TemplateAjaxJson();
			TemplateJson m = (TemplateJson) JSON.parseObject(
					o.getTemplateJson(), TemplateJson.class);
			BeanUtils.copyProperties(o, t);
			t.setHomeBack(m.getHomeBack());
			t.setLogoBack(m.getLogoBack());
			t.setTipBack(m.getTipBack());
			t.setTemplateJson(null);
			tl.add(t);
		}
		j.setRows(tl);// 设置返回的行
		return j;

	}

	@Override
	public TemplateAjaxJson add(TemplateAjaxJson templateAjaxJson) {
		Template t = new Template();
		TemplateJson tj = new TemplateJson();
		BeanUtils.copyProperties(templateAjaxJson, t);
		BeanUtils.copyProperties(templateAjaxJson, tj);
		t.setId(UUID.randomUUID().toString());
		t.setTemplateJson(JSON.toJSONString(tj));
		super.getBaseDao().save(t);
		return templateAjaxJson;

	}

	@Override
	public TemplateAjaxJson edit(TemplateAjaxJson templateAjaxJson) {
		Template d = (Template) super.getBaseDao().load(Template.class,
				templateAjaxJson.getId());
		TemplateJson tj = new TemplateJson();
		BeanUtils.copyProperties(templateAjaxJson, tj);
		d.setTemplateJson(JSON.toJSONString(tj));
		d.setTemplateName(templateAjaxJson.getTemplateName());
		super.getBaseDao().update(d);
		return templateAjaxJson;

	}

	@Override
	public void del(String ids) {

		for (String id : ids.split(",")) {
			if (id != null && !id.equals("")) {
				Template d = (Template) super.getBaseDao().load(Template.class,
						id);
				super.getBaseDao().delete(d);

			}
		}

	}

	@Override
	public List<Template> list() {
		DataGridJson j = new DataGridJson();
		String hql = " from Template t where 1=1 order by templateName desc  ";
		List<Template> ol = super.getBaseDao().find(hql);// 查询分页
		List<Template> list = new ArrayList<Template>();
		for (Template o : ol) {
			Template t = new Template();
			BeanUtils.copyProperties(o, t);
			t.setTemplateJson(null);
			list.add(t);
		}
		return list;
	}

}
