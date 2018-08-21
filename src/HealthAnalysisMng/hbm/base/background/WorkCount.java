/**
 * WorkCount.java
 * onesun.hbm.base.background
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年3月23日 		wuhoushuang
 *
 * Copyright (c) 2015, TNT All Rights Reserved.
*/

package HealthAnalysisMng.hbm.base.background;
/**
 * ClassName:WorkCount
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年3月23日		下午10:27:18
 *
 * @see 	 
 *  
 */
public class WorkCount {
	/**
	 * id:主键
	 *
	 * @since Ver 1.1
	 */
	private Integer id;
	/**
	 * work:数据
	 *
	 * @since Ver 1.1
	 */
	private String work;
	/**
	 * count:s数量
	 *
	 * @since Ver 1.1
	 */
	private Integer count;
	
	/**
	 * id
	 *
	 * @return  the id
	 * @since   CodingExample Ver 1.0
	 */
	
	public Integer getId() {
		return id;
	}
	/**
	 * id
	 *
	 * @param   id    the id to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * work
	 *
	 * @return  the work
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getWork() {
		return work;
	}
	/**
	 * work
	 *
	 * @param   work    the work to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setWork(String work) {
		this.work = work;
	}
	/**
	 * count
	 *
	 * @return  the count
	 * @since   CodingExample Ver 1.0
	 */
	
	public Integer getCount() {
		return count;
	}
	/**
	 * count
	 *
	 * @param   count    the count to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCount(Integer count) {
		this.count = count;
	}
	

}

