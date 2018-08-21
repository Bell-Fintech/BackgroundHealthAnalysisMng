package HealthAnalysisMng.model;
/**@anthor Brave Han*/
/** 
* @ClassName: DetectionOptionModel 
* @Description: TODO(24小时监测配置模块) 
* @author Brave Han 
* @date 2015年3月13日 下午6:37:04 
* @changelog 更改日志：新增
*/
public class DetectionOptionJson {

	/** 
	* @Fields min : TODO(風值最小) 
	*/ 
	private String min;
	
	/** 
	* @Fields max : TODO(低界限) 
	*/ 
	private String max;
	
	/** 
	* @Fields nmln : TODO(中界限) 
	*/ 
	private String nmln;
	
	/** 
	* @Fields nmlx : TODO(最高界限) 
	*/ 
	private String nmlx;

	/**
	 * min
	 *
	 * @return  the min
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getMin() {
		return min;
	}

	/**
	 * min
	 *
	 * @param   min    the min to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMin(String min) {
		this.min = min;
	}

	/**
	 * max
	 *
	 * @return  the max
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getMax() {
		return max;
	}

	/**
	 * max
	 *
	 * @param   max    the max to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMax(String max) {
		this.max = max;
	}

	/**
	 * nmln
	 *
	 * @return  the nmln
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getNmln() {
		return nmln;
	}

	/**
	 * nmln
	 *
	 * @param   nmln    the nmln to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setNmln(String nmln) {
		this.nmln = nmln;
	}

	/**
	 * nmlx
	 *
	 * @return  the nmlx
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getNmlx() {
		return nmlx;
	}

	/**
	 * nmlx
	 *
	 * @param   nmlx    the nmlx to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setNmlx(String nmlx) {
		this.nmlx = nmlx;
	}

	
}
