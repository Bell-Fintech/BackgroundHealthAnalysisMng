package HealthAnalysisMng.util;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AssessAnalysisUtil {
	public static Map<String, Double> getAnalysisResult(List<String> totalResult){
		int onesum=0;
		int twosum=0,threesum=0,foursum=0,fivesum=0;
		
		for(int i=0;i<totalResult.size();i++){
		if("1".equals(totalResult.get(i))){
			onesum++;
		}
		if("2".equals(totalResult.get(i))){
			twosum++;
		}
		if("3".equals(totalResult.get(i))){
			threesum++;
		}	
		if("4".equals(totalResult.get(i))){
			foursum++;
		}
		if("5".equals(totalResult.get(i))){
			fivesum++;
		}
		}
		Map<String, Double> resultMap=new HashMap<String, Double>();
		BigDecimal b;
		Double onePrecent= ((double)onesum/totalResult.size())*100;
		b = new BigDecimal(onePrecent);
		onePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		Double twoPrecent= ((double)twosum/totalResult.size())*100;
		b = new BigDecimal(twoPrecent);
		twoPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		Double threePrecent=((double)threesum/totalResult.size())*100;
		b = new BigDecimal(threePrecent);
		threePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		Double fourPrecent=((double)foursum/totalResult.size())*100;
		b = new BigDecimal(fourPrecent);
		fourPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		Double fivePrecent=((double)fivesum/totalResult.size())*100;
		b = new BigDecimal(fivePrecent);
		fivePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		resultMap.put("onePrecent", onePrecent);
		resultMap.put("twoPrecent", twoPrecent);
		resultMap.put("threePrecent", threePrecent);
		resultMap.put("fourPrecent", fourPrecent);
		resultMap.put("fivePrecent", fivePrecent);
		return resultMap;
	}

}
