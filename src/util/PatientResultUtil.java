package HealthAnalysisMng.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class PatientResultUtil {
	public static Map<String, Object> getPatientResult(Map<String, Integer> resultMap) {
		String healthResult=null;
		Map<String, Object> numberMap=new HashMap<String, Object>();
		int health=0,subHealth=0,patient=0,highRiskHealth=0;
		List<String> healthList=new ArrayList<String>();
		List<String> subHealthList=new ArrayList<String>();
		List<String> patientList=new  ArrayList<String>();
		List<String> highRiskHealthList=new ArrayList<String>();
		Set<String> key=resultMap.keySet();
		for(String s:key){
			Integer result=resultMap.get(s);
			if("BMI".equals(s)){
				switch (result) {
				case 3:
					subHealth++;
					subHealthList.add(s);
					break;
				case 4:
					patient++;
					patientList.add(s);
				default:
					health++;
					healthList.add(s);
					break;
				}
			}
			if("pressureResult".equals(s)){
				switch (result) {
				case 1:
					health++;
					healthList.add(s);
					break;
				case 2:
					health++;
					healthList.add(s);
					break;
				case 3 :
					patient++;
					patientList.add(s);
					break;
				default:
					highRiskHealth++;
					highRiskHealthList.add(s);
					break;
				}
			}
			if("waistHeightResult".equals(s)){
				switch (result) {
				case 1:
					health++;
					healthList.add(s);
					break;
				default:
					subHealth++;
					subHealthList.add(s);
					break;
				}
			}
			if("riskResult".equals(s)){
				switch (result) {
				case 5:
					patient++;
					patientList.add(s);
					break;
				case 4:
					subHealth++;
					subHealthList.add(s);
					break;
				case 3:
					subHealth++;
					subHealthList.add(s);
					break;

				default:
					health++;
					healthList.add(s);
					break;
				}
			}
			if("sugarResult".equals(s)){
				switch (result) {
				case 1:
					health++;
					healthList.add(s);
					break;
				case 4:
					highRiskHealth++;
					highRiskHealthList.add(s);
					break;
				
				default:
					patient++;
					patientList.add(s);
					break;
				}
			}
			if("waistline".equals(s)){
				switch (result) {
				case 1:
					health++;
					healthList.add(s);
					break;
				case 2:
					subHealth++;
					subHealthList.add(s);
					break;
				case 3:
					patient++;
					patientList.add(s);
					break;
				}
			}
			if("fatRateResult".equals(s)){
				switch (result) {
				case 1:
					health++;
					healthList.add(s);
					break;
				case 2:
					subHealth++;
					subHealthList.add(s);
                     break;
				default:
					patient++;
					patientList.add(s);
					break;
				}
			}
			if("ateryResult".equals(s)){
				switch (result) {
				case 1:
					health++;
					healthList.add(s);
					break;

				default:
					subHealth++;
					subHealthList.add(s);
					break;
				}
			}
			if("metabolicResult".equals(s)){
				switch (result) {
				case 1:
					health++;
					healthList.add(s);
					break;

				default:
					highRiskHealth++;
					highRiskHealthList.add(s);
					break;
				}
			}
			if("fatRateResultFlag".equals(s)){
				switch (result) {
				case 1:
					health++;
					healthList.add(s);
					break;

				default:
					highRiskHealth++;
					highRiskHealthList.add(s);
					break;
				}
			}
		}
		if(subHealth>=3){
			healthResult="subHealth";
		}else{
			healthResult="health";	
		}
		if(patient>=3){
			healthResult="patient";
		}else{
			healthResult="health";	
		}
		if(highRiskHealth>=3){
			healthResult="highRiskHealth";
		}else{
			healthResult="health";	
		}
		numberMap.put("result", healthResult);
		if("health".equals(healthResult)){
       		numberMap.put("healthList", healthList);
		}
		if("subHealth".equals(healthResult)){
			numberMap.put("subHealthList", subHealthList);
		}
		if("patient".equals(healthResult)){
			numberMap.put("patientList", patientList);
		}
		if("highRiskHealth".equals(healthResult)){
			numberMap.put("highRiskHealthList", highRiskHealthList);
		}
		return numberMap;
	}
}
