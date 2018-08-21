package HealthAnalysisMng.model;

/**@anthor Brave Han*/
/**
 * ClassName:DetectionOption Function: TODO ADD FUNCTION Reason: TODO ADD REASON
 *
 * @author bravehan
 * @version
 * @since Ver 1.1
 * @Date 2015 2015年3月13日 下午10:56:56
 *
 * @see
 * 
 */
public class DetectionOptionModel {

	/**
	 * dataId:TODO（primary key）
	 *
	 * @since Ver 1.1
	 */
	private String dataId;

	/**
	 * userId:TODO（用户ＩＤ）
	 *
	 * @since Ver 1.1
	 */
	private String userId;

	/**
	 * keyRt:TODO（ｋｅｙ值）
	 *
	 * @since Ver 1.1
	 */
	private String keyRt;

	/**
	 * flag:TODO（有效标识）
	 *
	 * @since Ver 1.1
	 */
	private String flag;
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
	 * dataId
	 *
	 * @return the dataId
	 * @since CodingExample Ver 1.0
	 */

	public String getDataId() {
		return dataId;
	}

	/**
	 * dataId
	 *
	 * @param dataId
	 *            the dataId to set
	 * @since CodingExample Ver 1.0
	 */

	public void setDataId(String dataId) {
		this.dataId = dataId;
	}

	/**
	 * userId
	 *
	 * @return the userId
	 * @since CodingExample Ver 1.0
	 */

	public String getUserId() {
		return userId;
	}

	/**
	 * userId
	 *
	 * @param userId
	 *            the userId to set
	 * @since CodingExample Ver 1.0
	 */

	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * keyRt
	 *
	 * @return the keyRt
	 * @since CodingExample Ver 1.0
	 */

	public String getKeyRt() {
		return keyRt;
	}

	/**
	 * keyRt
	 *
	 * @param keyRt
	 *            the keyRt to set
	 * @since CodingExample Ver 1.0
	 */

	public void setKeyRt(String keyRt) {
		this.keyRt = keyRt;
	}

	/**
	 * flag
	 *
	 * @return the flag
	 * @since CodingExample Ver 1.0
	 */

	public String getFlag() {
		return flag;
	}

	/**
	 * flag
	 *
	 * @param flag
	 *            the flag to set
	 * @since CodingExample Ver 1.0
	 */

	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**
	 * min
	 *
	 * @return the min
	 * @since CodingExample Ver 1.0
	 */

	public String getMin() {
		return min;
	}

	/**
	 * min
	 *
	 * @param min
	 *            the min to set
	 * @since CodingExample Ver 1.0
	 */

	public void setMin(String min) {
		this.min = min;
	}

	/**
	 * max
	 *
	 * @return the max
	 * @since CodingExample Ver 1.0
	 */

	public String getMax() {
		return max;
	}

	/**
	 * max
	 *
	 * @param max
	 *            the max to set
	 * @since CodingExample Ver 1.0
	 */

	public void setMax(String max) {
		this.max = max;
	}

	/**
	 * nmln
	 *
	 * @return the nmln
	 * @since CodingExample Ver 1.0
	 */

	public String getNmln() {
		return nmln;
	}

	/**
	 * nmln
	 *
	 * @param nmln
	 *            the nmln to set
	 * @since CodingExample Ver 1.0
	 */

	public void setNmln(String nmln) {
		this.nmln = nmln;
	}

	/**
	 * nmlx
	 *
	 * @return the nmlx
	 * @since CodingExample Ver 1.0
	 */

	public String getNmlx() {
		return nmlx;
	}

	/**
	 * nmlx
	 *
	 * @param nmlx
	 *            the nmlx to set
	 * @since CodingExample Ver 1.0
	 */

	public void setNmlx(String nmlx) {
		this.nmlx = nmlx;
	}

}