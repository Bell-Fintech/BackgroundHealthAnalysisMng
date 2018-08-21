package HealthAnalysisMng.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import HealthAnalysisMng.model.TrackActionDataXY;
/**@author brave Han
 * @tracnk action  字符串解析工具
 * 
 * */
public class TrackActionUtil {
	private static final  SimpleDateFormat SDF=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**坐标之间分隔付*/
	private static final  String SPLIT_SORCE="_";
	/**维度分隔付*/
	private static final String SPLIT_SOME=",";
	public static List getListObj(String obj){
		List<TrackActionDataXY> source=new ArrayList<TrackActionDataXY>();
    	String[] stra=obj.split(SPLIT_SORCE);
    	for(int i=0;i<stra.length;i++){
    		String []num=stra[i].split(SPLIT_SOME);
    		TrackActionDataXY pxpy=new TrackActionDataXY();
    		pxpy.setPoint(stra[i]);
    		if(num.length==2){
    			pxpy.setPointX(num[0]);
        		pxpy.setPointY(num[1]);
    		}
    		source.add(pxpy);
    	}
    	return source;
	}
	/**timestamp类型时间字符显示*/
	public static String paseString(Timestamp time){
		return time.toString();
	}
	
	public static Timestamp paseTimestamp(String STRtime){
		try {
			return new Timestamp(SDF.parse(STRtime).getTime());
		} catch (ParseException e) {
			return null;
		}
	}

}
