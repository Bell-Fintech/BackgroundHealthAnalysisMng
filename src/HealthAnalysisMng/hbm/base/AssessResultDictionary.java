package HealthAnalysisMng.hbm.base;

/**
 * ClassName:AssessResultDictionary
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   wuhoushuang
 * @version  
 * @since    Ver 1.1
 * @Date	 2015	2015年3月13日		下午8:41:58
 *
 * @see 	 
 * 
 */
public class AssessResultDictionary {
   /**
 * dataId:TODO（primary key）
 *
 * @since Ver 1.1
 */
private String dataId;
   /**
 * assessment_item:TODO（评估项）
 *
 * @since Ver 1.1
 */
private String assessment_item;
   /**
 * resultNum:TODO（评估结果）
 *
 * @since Ver 1.1
 */
private int resultNum;
   /**
 * resultString:TODO（评估结果ｓｔｒｉｎｇ）
 *
 * @since Ver 1.1
 */
private String resultString;
/**
 * dataId
 *
 * @return  the dataId
 * @since   CodingExample Ver 1.0
 */

public String getDataId() {
	return dataId;
}
/**
 * dataId
 *
 * @param   dataId    the dataId to set
 * @since   CodingExample Ver 1.0
 */

public void setDataId(String dataId) {
	this.dataId = dataId;
}
/**
 * assessment_item
 *
 * @return  the assessment_item
 * @since   CodingExample Ver 1.0
 */

public String getAssessment_item() {
	return assessment_item;
}
/**
 * assessment_item
 *
 * @param   assessment_item    the assessment_item to set
 * @since   CodingExample Ver 1.0
 */

public void setAssessment_item(String assessment_item) {
	this.assessment_item = assessment_item;
}
/**
 * resultNum
 *
 * @return  the resultNum
 * @since   CodingExample Ver 1.0
 */

public int getResultNum() {
	return resultNum;
}
/**
 * resultNum
 *
 * @param   resultNum    the resultNum to set
 * @since   CodingExample Ver 1.0
 */

public void setResultNum(int resultNum) {
	this.resultNum = resultNum;
}
/**
 * resultString
 *
 * @return  the resultString
 * @since   CodingExample Ver 1.0
 */

public String getResultString() {
	return resultString;
}
/**
 * resultString
 *
 * @param   resultString    the resultString to set
 * @since   CodingExample Ver 1.0
 */

public void setResultString(String resultString) {
	this.resultString = resultString;
}

   
}
