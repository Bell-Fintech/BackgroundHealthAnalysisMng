package HealthAnalysisMng.util.assessment;


import HealthAnalysisMng.hbm.base.LatestAssessmentResult;

public class HealthTrendUtil {
	public static String getHealthResult(LatestAssessmentResult result){
		String healthResult;
		int subHealth = 0,patient = 0,health = 0,highRiskHealth = 0;
		if(result.getBmiResultFlag()!=null&&!"".equals(result.getBmiResultFlag())){
			switch (Integer.parseInt(result.getBmiResultFlag())) {
			case 3:
				subHealth++;
				break;
			case 4:
				patient++;
			default:
				health++;
				break;
			}
		}
		if(result.getPressureResultFlag()!=null&&!"".equals(result.getPressureResultFlag())){
			switch (Integer.parseInt(result.getPressureResultFlag())) {
			case 1:
				health++;
				break;
			case 2:
				health++;
				break;
			case 3 :
				patient++;
				break;
			default:
				highRiskHealth++;
				break;
			}
		}
		if(result.getWaistHeightResultFlag()!=null&&!"".equals(result.getWaistHeightResultFlag())){
			switch (Integer.parseInt(result.getWaistHeightResultFlag())) {
			case 1:
				health++;
				break;
			default:
				subHealth++;
				break;
			}
		}
		if(result.getRiskResultFlag()!=null&&!"".equals(result.getRiskResultFlag())){
			switch (Integer.parseInt(result.getRiskResultFlag())) {
			case 5:
				patient++;
				break;
			case 4:
				subHealth++;
				break;
			case 3:
				subHealth++;
				break;

			default:
				health++;
				break;
			}
		}
		if(result.getSugarResultFlag()!=null&&!"".equals(result.getSugarResultFlag())){
			switch (Integer.parseInt(result.getSugarResultFlag())) {
			case 1:
				health++;
				break;
			case 4:
				highRiskHealth++;
				break;
			
			default:
				patient++;
				break;
			}
		}
		if(result.getWaistlineResultFlag()!=null&&!"".equals(result.getWaistlineResultFlag())){
			switch (Integer.parseInt(result.getWaistlineResultFlag())) {
			case 1:
				health++;
				break;
			case 2:
				subHealth++;
				break;
			case 3:
				patient++;
				break;
			}
		}
		if(result.getFatRateResultFlag()!=null&&!"".equals(result.getFatRateResultFlag())){
			switch (Integer.parseInt(result.getFatRateResultFlag())) {
			case 1:
				health++;
				break;
			case 2:
				subHealth++;
                 break;
			default:
				patient++;
				break;
			}
		}
		if(result.getAteryResultFlag()!=null&&!"".equals(result.getAteryResultFlag())){
			switch (Integer.parseInt(result.getAteryResultFlag())) {
			case 1:
				health++;
				break;

			default:
				subHealth++;
				break;
			}
		}
		if(result.getMetabolicResultFlag()!=null&&!"".equals(result.getMetabolicResultFlag())){
			switch (Integer.parseInt(result.getMetabolicResultFlag())) {
			case 1:
				health++;
				break;

			default:
				highRiskHealth++;
				break;
			}
		}
		if(result.getFatResultFlag()!=null&&!"".equals(result.getFatResultFlag())){
			switch (Integer.parseInt(result.getFatResultFlag())) {
			case 1:
				health++;
				break;

			default:
				highRiskHealth++;
				break;
			}
		}
	if(highRiskHealth>=3){
		healthResult="highRiskHealth";
	}else if(patient>=3){
		healthResult="patient";
	}else if(subHealth>=3){
		healthResult="subHealth";
	}else{
		healthResult="health";	
	}
	return healthResult;
	}

}
