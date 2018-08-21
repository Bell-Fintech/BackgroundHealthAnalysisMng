/**
 * QuestionFormula.java
 * onesun.hbm.base
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年2月14日 		DingMingliang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
 */

package HealthAnalysisMng.hbm.base;

/**
 * ClassName:QuestionFormula Function: TODO ADD FUNCTION Reason: TODO ADD REASON
 *
 * @author DingMingliang
 * @version
 * @since Ver 1.1
 * @Date 2015年2月14日 上午11:04:14
 *
 * @see
 * 
 */
public class QuestionFormula {

	/**
	 * id:主键
	 *
	 * @since Ver 1.1
	 */
	private String id;
	/**
	 * formulaKey:公式的值
	 *
	 * @since Ver 1.1
	 */
	private String formulaKey;
	/**
	 * formulaValue:公式的value
	 *
	 * @since Ver 1.1
	 */
	private Integer formulaValue;

	/**
	 * id
	 *
	 * @return the id
	 * @since CodingExample Ver 1.0
	 */

	public String getId() {
		return id;
	}

	/**
	 * id
	 *
	 * @param id
	 *            the id to set
	 * @since CodingExample Ver 1.0
	 */

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * formulaKey
	 *
	 * @return the formulaKey
	 * @since CodingExample Ver 1.0
	 */

	public String getFormulaKey() {
		return formulaKey;
	}

	/**
	 * formulaKey
	 *
	 * @param formulaKey
	 *            the formulaKey to set
	 * @since CodingExample Ver 1.0
	 */

	public void setFormulaKey(String formulaKey) {
		this.formulaKey = formulaKey;
	}

	/**
	 * formulaValue
	 *
	 * @return the formulaValue
	 * @since CodingExample Ver 1.0
	 */

	public Integer getFormulaValue() {
		return formulaValue;
	}

	/**
	 * formulaValue
	 *
	 * @param formulaValue
	 *            the formulaValue to set
	 * @since CodingExample Ver 1.0
	 */

	public void setFormulaValue(Integer formulaValue) {
		this.formulaValue = formulaValue;
	}

}
