package HealthAnalysisMng.util.assessment;

import java.math.BigDecimal;


public class AssessmentUtil {
     public static String getWaistline(double waistline,String sex){
    	 String result;
    	 if(sex!=null&&Integer.parseInt(sex)==0)
 		{
 			if (waistline < 85) {
 				result = "1";
 			} else if (waistline > waistline + 10) {
 				result = "2";
 			} else {
 				result = "3";
 			}
 		}else {
 			if (waistline < 80) {
 				result = "1";
 			} else if (waistline > waistline + 10) {
 				result = "2";
 			} else {
 				result = "3";
 			}
 		}
    	return result; 
     }
     @SuppressWarnings("static-access")
	public static String getBMI( double weight,double height){
    	String result=null;
    	double h=height/100;
 		double s = weight/ (h * h);
 		BigDecimal b = new BigDecimal(s);
 		double s1 = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
 		String value = null;
 		value = value.valueOf(s1);
 		if (s1 < 18.5) {
 			result = "1";
 		} else if (s1 < 23.9) {
 			result = "2";
 		} else if (s1 < 27.9) {
 			result = "3";
 		} else {
 			result = "4";
 		}
		return result;
     }
     public static String getArtery(double tc,double hdl){
    	 String result=null;
 		double hard=(tc-hdl)/hdl;
 		BigDecimal b = new BigDecimal(hard);
 		double s1 = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
 		if(s1<4.0){
 			result="1";
 		}else{
 			result="2";
 		}
    	 return result;
     }
     public static String getBloodFat(double hdl,double ldl,double tg,double tc){
    	 String result=null;
 		if (tc>=6.22||tg>=2.26||hdl>=4.14||ldl<1.04) {
 			result = "2";
 		} else {
 			result = "1";
 		}
 		return result;
     }
     public static String getBloodPressure(double sbp,double dbp){
    	 String result=null;
 		if (sbp >= 180 || dbp >= 110) {
 			result="5";
 		} else if (sbp >= 160 || dbp >= 100) {
 			result="4";
 		} else if (sbp >= 140|| dbp >= 90) {
 			result="3";
 		} else if (sbp >= 120 || dbp >= 80) {
 			result="2";
 		} else {
 			result="1";
 		}
    	 return result;
     }
     @SuppressWarnings("static-access")
	public static String getBloodSugar(double bga,double bgf){
    	 String result=null;
 		String bgfs="";
 		bgfs=bgfs.valueOf(bgf);
 		if(bgf>=7.0||bga>=11.1){
 			result="4";
 		}else if((bga>=7.8&&bga<11.1)){
 			result="3";
 		}else if((bgf>=6.1&&bgf<7.0)||bga<7.8){
 			result="2";
 		}else{
 			result="1";
 		}
    	 return result;
     }
     public static String getObesityRisk(double waist,double h,double weight,String sex){
    	 String result=null;
 		double height=h/100;
 		double bmi=weight/(height*height);
 		if(bmi<18.5){
 			result="1";
 		}else if(bmi>18.5&&bmi<24){
 			if((("0").equals(sex)&&waist<85)||(("1").equals(sex)&&waist<80)){
 			result="2";
 			}else if((("0").equals(sex)&&(waist>85&&waist<95))||(("1").equals(sex)&&waist>80&&waist<90)){
 				result="4";
 			}else{
 				result="3";
 			}
 		}else if(bmi>24&&bmi<27.9){
 		    if((("0").equals(sex)&&waist<80)||(("1").equals(sex)&&waist<80)){
 			   result="4";
 		   }else if((("0").equals(sex)&&(waist>85&&waist<95))||(("1").equals(sex)&&(waist>80&&waist<90))){
 			   result="3";
 		   }else {
 			   result="5";
 		   }
 			
 		}else{
 			if((("0").equals(sex)&&waist<85)||(("1").equals(sex)&&waist<80)){
 				result="3";
 			}else{
 				result="5";
 			}
 		}
    	 return result;
     }
     public static String getWaistHeight(double waistline,double height){
    	 String result=null;
 		double values=waistline/height;
 		BigDecimal b1 = new BigDecimal(values);
 		double value = b1.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
 		if(value<=0.5){
 			result="1";
 		}else{
 			result="2";
 		}
    	 return result;
     }
     @SuppressWarnings("unused")
	public static String getFatRate(String sex,double waistline,double weight){
    	 String result=null;
    	 String percent=null;
    	 if(sex!=null&&Integer.parseInt(sex)==0){
 			double a=waistline*0.74;
 			double b=weight*0.082+44.74;
 			double values=(a-b)/(weight);
 			BigDecimal b1 = new BigDecimal(values);
 			double value = b1.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
 			BigDecimal bigdec = new BigDecimal(values).multiply(new BigDecimal(100))
 					.setScale(2, BigDecimal.ROUND_HALF_UP);
 			 percent=bigdec+"%";
 			if(value>0.25&&value<0.35){
 				result="2";
 			}else if(value>=0.35){
 				result="3";
 			}else{
 				result="1";
 			}
 		}else{
 			double a=waistline*0.74;
 			double b=weight*0.082+34.89;
 			double values=(a-b)/(weight);
 			BigDecimal b1 = new BigDecimal(values);
 			double value = b1.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
 			BigDecimal bigdec = new BigDecimal(values).multiply(new BigDecimal(100))
 					.setScale(2, BigDecimal.ROUND_HALF_UP);
 			 percent=bigdec+"%";
 			if(value>0.3&&value<0.39){
 				result="2";
 			}else if(value>=0.4){
 				result="3";
 			}else{
 				result="1";
 			}
 			
 		}
    	 return result;
     }
     public static String getMetabolic(String sex,double sbp,double dbp,double waistline,
    		 double height,double bgfasting,double tg,double hdl){
    	 String result=null;
    	 int count=0;
 		double s = (height / 2 - 11.5);
		BigDecimal b = new BigDecimal(s);
		double s1 = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
    	 if (sex != null && Integer.parseInt(sex) == 0) {
 			if (s1 > 85) {
 				count++;
 			}
 		} else {
 			if (s1 > 80) {
 				count++;
 			}
 		}
 		if (sbp > 130 || dbp > 85) {
 			count++;
 		}
 		if (bgfasting > 6.1) {
 			count++;
 		}
 		if (tg > 1.7) {
 			count++;
 		}
 		if (hdl < 1.04) {
 			count++;
 		}if(count>=3){
 			result="1";
 		}else{
 			result="2";
 		}
    	 return result;
     }
}
