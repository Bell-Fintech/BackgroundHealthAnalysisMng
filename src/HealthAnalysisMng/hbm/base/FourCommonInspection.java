package HealthAnalysisMng.hbm.base;

/**
 * @author onesun.hbm.base
 *  Brave Han
 */
/**
 * ClassName:FourCommonInspection
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015	2015年3月13日		下午11:43:35
 *
 * @see 	 
 * 
 */
public class FourCommonInspection {
	
	/**
	 * dadaId:TODO（primary key）
	 *
	 * @since Ver 1.1
	 */
	private String dadaId;
	/**
	 * userId:TODO（用户ｉｄ）
	 *
	 * @since Ver 1.1
	 */
	private String userId;
	/**会员编号  unique
	 * */
	private String memberCode;
	/**序列 unique
	 * */
	private String seq_NO;
	/**健康建议信息
	 * */
	private String health_suggest_message;
	/**
	 * dadaId
	 *
	 * @return  the dadaId
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getDadaId() {
		return dadaId;
	}
	/**
	 * dadaId
	 *
	 * @param   dadaId    the dadaId to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setDadaId(String dadaId) {
		this.dadaId = dadaId;
	}
	/**
	 * userId
	 *
	 * @return  the userId
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getUserId() {
		return userId;
	}
	/**
	 * userId
	 *
	 * @param   userId    the userId to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * memberCode
	 *
	 * @return  the memberCode
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getMemberCode() {
		return memberCode;
	}
	/**
	 * memberCode
	 *
	 * @param   memberCode    the memberCode to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	/**
	 * seq_NO
	 *
	 * @return  the seq_NO
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getSeq_NO() {
		return seq_NO;
	}
	/**
	 * seq_NO
	 *
	 * @param   seq_NO    the seq_NO to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setSeq_NO(String seq_NO) {
		this.seq_NO = seq_NO;
	}
	/**
	 * health_suggest_message
	 *
	 * @return  the health_suggest_message
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getHealth_suggest_message() {
		return health_suggest_message;
	}
	/**
	 * health_suggest_message
	 *
	 * @param   health_suggest_message    the health_suggest_message to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setHealth_suggest_message(String health_suggest_message) {
		this.health_suggest_message = health_suggest_message;
	}

}
