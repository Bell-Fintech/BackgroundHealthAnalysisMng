/**
 * QuestionFormulaServiceI.java
 * onesun.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年2月14日 		DingMingliang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.service;

import HealthAnalysisMng.hbm.base.QuestionFormula;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;

/**
 * ClassName:QuestionFormulaServiceI Function: TODO ADD FUNCTION Reason: TODO
 * ADD REASON
 *
 * @author DingMingliang
 * @version
 * @since Ver 1.1
 * @Date 2015年2月14日 上午11:14:36
 *
 * @see
 * 
 */
public interface QuestionFormulaServiceI {

	/**
	 * datagrid:后台展示数据公式
	 *
	 * @param  @param dg
	 * @param  @param questionFormula
	 * @param  @return    设定文件
	 * @return DataGridJson    DOM对象
	 * @throws 
	 * @since  CodingExample　Ver 1.1
	*/
	public DataGridJson datagrid(DataGrid dg, QuestionFormula questionFormula);

	/**
	 * edit:编辑公式值
	 *
	 * @param  @param questionFormula
	 * @param  @return    设定文件
	 * @return QuestionFormula    DOM对象
	 * @throws 
	 * @since  CodingExample　Ver 1.1
	*/
	public QuestionFormula edit(QuestionFormula questionFormula);

	/**
	 * add:添加一个新的公式
	 *
	 * @param  @param questionFormula
	 * @param  @return    设定文件
	 * @return QuestionFormula    DOM对象
	 * @throws 
	 * @since  CodingExample　Ver 1.1
	*/
	public QuestionFormula add(QuestionFormula questionFormula);
	
}
