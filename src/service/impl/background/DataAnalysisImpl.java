package HealthAnalysisMng.service.impl.background;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.omg.CosNaming.IstringHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import HealthAnalysisMng.hbm.base.LatestAssessmentResult;
import HealthAnalysisMng.hbm.base.PrecentResult;
import HealthAnalysisMng.hbm.base.background.NameResult;
import HealthAnalysisMng.service.background.DataAnalysisServiceI;
import HealthAnalysisMng.service.impl.BaseServiceImpl;
import HealthAnalysisMng.util.PatientResultUtil;
import HealthAnalysisMng.util.assessment.HealthTrendUtil;
@Service("dataAnalysisService")
@Transactional
public class DataAnalysisImpl extends BaseServiceImpl implements DataAnalysisServiceI{

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getPatientResult() {
		String hql="SELECT DISTINCT userId FROM LatestAssessmentResult";
		Query q=super.getBaseDao().createQuery(hql);
		List<String> list=q.list();
		Map<String, Object> number=new HashMap<String, Object>();
		int healthNumber=0,subHealthNumber=0,paitentNumber=0,highRiskHealthNumber=0;
		int BMINumber=0,pressureNumber=0,sugarNumber=0,fatNumber=0,fatRateNumber=0,
			waistlineNumber=0,waistHeightNumber=0,riskNumber=0,ateryNumber=0,metabolicNumber=0;
		int subHealthBMI=0,patientBMI=0;
		int patientPressure=0,riskPressure=0;
		int subWaistHeight=0;
		int subWaistline=0,patientWaistline=0;
		int subAtery=0;
		int patientSugar=0,riskSugar=0;
		int subfatRate=0,patientFatRate=0;
		int riskMetabolic=0;
		int riskFat=0;
		int subRisk=0,patientRisk=0;
		for(int i=0;i<list.size();i++){
			List<String> userList=new ArrayList<String>();
			userList.add(list.get(i));
			String userHql="From LatestAssessmentResult where userId=?";
			List<LatestAssessmentResult> results=super.getBaseDao().find(userHql,1,1,userList);
			if(results==null||results.size()==0){
				return null;
			}else{
			LatestAssessmentResult result=results.get(0);
			Map<String, Integer> map=new HashMap<String, Integer>();
			if(result.getAteryResultFlag()!=null){
			map.put("ateryResult", Integer.parseInt(result.getAteryResultFlag()));
			}
			if(result.getBmiResultFlag()!=null){
			map.put("BMI", Integer.parseInt(result.getBmiResultFlag()));
			}
			if(result.getPressureResultFlag()!=null){
			map.put("pressureResult", Integer.parseInt( result.getPressureResultFlag()));
			}
			if(result.getFatRateResultFlag()!=null){
			map.put("fatRateResult", Integer.parseInt( result.getFatRateResultFlag()));
			}
			if(result.getRiskResultFlag()!=null){
				map.put("riskResult",  Integer.parseInt(result.getRiskResultFlag()));	
			}
			if(result.getFatResultFlag()!=null){
				map.put("fatRateResultFlag", Integer.parseInt( result.getFatResultFlag()));	
			}
			if(result.getSugarResultFlag()!=null){
				map.put("sugarResult",  Integer.parseInt(result.getSugarResultFlag()));
			}
			if(result.getWaistlineResultFlag()!=null){
				map.put("waistline", Integer.parseInt( result.getWaistlineResultFlag()));
			}
			if(result.getWaistHeightResultFlag()!=null){
				map.put("waistHeightResult", Integer.parseInt( result.getWaistHeightResultFlag()));
			}
			if(result.getMetabolicResultFlag()!=null){
			map.put("meabolicResult",  Integer.parseInt(result.getMetabolicResultFlag()));
			}
			Map<String, Object> paitentResults=PatientResultUtil.getPatientResult(map);
			String paitentResult =(String) paitentResults.get("result");
			System.out.println(paitentResult);
			List<Object> healthList=(List<Object>) paitentResults.get("healthList");
			List<Object> subHealthList=(List<Object>) paitentResults.get("subHealthList");
			List<Object> patientList=(List<Object>) paitentResults.get("patientList");
			List<Object> riskList=(List<Object>) paitentResults.get("highRiskHealthList");
			if("health".equals(paitentResult)){
				healthNumber++;
				if(healthList.contains("BMI")){
					 BMINumber++;
				}
				if(healthList.contains("fatRateResult")){
					fatRateNumber++;
				}
				if(healthList.contains("fatRateResultFlag")){
					fatNumber++;
				}
				if(healthList.contains("pressureResult")){
					pressureNumber++;
				}
				if(healthList.contains("sugarResult")){
					sugarNumber++;
				}
				if(healthList.contains("waistline")){
					waistlineNumber++;
				}
				if(healthList.contains("waistHeightResult")){
					waistHeightNumber++;
				}
				if(healthList.contains("ateryResult")){
					ateryNumber++;
				}
				if(healthList.contains("meabolicResult")){
					metabolicNumber++;
				}
				if(healthList.contains("riskResult")){
					riskNumber++;
				}
				
			}
			if("subHealth".equals(paitentResult)){
				subHealthNumber++;
				if(subHealthList.contains("BMI")){
					subHealthBMI++;
				}
				if(subHealthList.contains("fatRateResult")){
					subfatRate++;
				}
				if(subHealthList.contains("waistline")){
					subWaistline++;
				}
				if(subHealthList.contains("waistHeightResult")){
					subWaistHeight++;
				}
				if(subHealthList.contains("ateryResult")){
					subAtery++;
				}
				if(subHealthList.contains("riskResult")){
					subRisk++;
				}
			}
			if("paitent".equals(paitentResult)){
				paitentNumber++;
				if(patientList.contains("BMI")){
					 patientBMI++;
				}
				if(patientList.contains("fatRateResult")){
					patientFatRate++;
				}
				if(patientList.contains("pressureResult")){
					patientPressure++;
				}
				if(patientList.contains("sugarResult")){
					patientSugar++;
				}
				if(patientList.contains("waistline")){
					patientWaistline++;
				}
				if(patientList.contains("riskResult")){
					patientRisk++;
				}
			}
			if("highRiskHealth".equals(paitentResult)){
				highRiskHealthNumber++;
				if(riskList.contains("fatRateResultFlag")){
					riskFat++;
				}
				if(riskList.contains("pressureResult")){
					riskPressure++;
				}
				if(riskList.contains("sugarResult")){
					riskSugar++;
				}
				if(riskList.contains("meabolicResult")){
					riskMetabolic++;
				}
			}
			
		}
	}
		Double BMIPrecent = 0.0,fatPrecent = 0.0,waistlinePrecent = 0.0,waistHeightPrecent = 0.0,sugarPrecent = 0.0;
		Double fatRatePrecent = 0.0,pressurePrecent = 0.0,ateryPrecent = 0.0,metabolicPrecent = 0.0,riskPrecent = 0.0;
		Integer sum=healthNumber+subHealthNumber+paitentNumber+highRiskHealthNumber;
		Double healthResult = 0.0,subHealthResult = 0.0,paitentResult = 0.0,highRiskResult = 0.0;
		BigDecimal b;
		if(sum!=0){
			
		 healthResult= ((double)healthNumber/sum)*100;
		 b = new BigDecimal(healthResult);
		 healthResult= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 subHealthResult= ((double)subHealthNumber/sum)*100;
		 b = new BigDecimal(subHealthResult);
		 subHealthResult= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 paitentResult= ((double)paitentNumber/sum)*100;
		 b = new BigDecimal(paitentResult);
		 paitentResult= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 highRiskResult= ((double)highRiskHealthNumber/sum)*100;
		 b = new BigDecimal(highRiskResult);
		 highRiskResult= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		Integer precentSum=BMINumber+fatRateNumber+fatNumber+riskNumber+metabolicNumber+sugarNumber+pressureNumber
				+waistlineNumber+waistHeightNumber+ateryNumber;
		if(precentSum!=0){
		 BMIPrecent= ((double)BMINumber/precentSum)*100;
		 b = new BigDecimal(BMIPrecent);
		 BMIPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 fatRatePrecent= ((double)fatRateNumber/precentSum)*100;
		 b = new BigDecimal(fatRatePrecent);
		 fatRatePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 fatPrecent= ((double)fatNumber/precentSum)*100;
		 b = new BigDecimal(fatPrecent);
		 fatPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 waistlinePrecent= ((double)waistlineNumber/precentSum)*100;
		 b = new BigDecimal(waistlinePrecent);
		 waistlinePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 waistHeightPrecent= ((double)waistHeightNumber/precentSum)*100;
		 b = new BigDecimal(waistHeightPrecent);
		 waistHeightPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 sugarPrecent= ((double)sugarNumber/precentSum)*100;
		 b = new BigDecimal(sugarPrecent);
		 sugarPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 pressurePrecent= ((double)pressureNumber/precentSum)*100;
		 b = new BigDecimal(pressurePrecent);
		 pressurePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 ateryPrecent= ((double)ateryNumber/precentSum)*100;
		 b = new BigDecimal(ateryPrecent);
		 ateryPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 metabolicPrecent= ((double)metabolicNumber/precentSum)*100;
		 b = new BigDecimal(metabolicPrecent);
		 metabolicPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 riskPrecent= ((double)riskNumber/precentSum)*100;
		 b = new BigDecimal(riskPrecent);
		 riskPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		Double subBMIPrecent = 0.0,subAteryPrecent = 0.0,subFatRatePrecent = 0.0,subRiskPrecent = 0.0,subWaistlinePrecent = 0.0,subWaistHeightPrecent = 0.0;
		Integer subPrecent=subHealthBMI+subAtery+subfatRate+subRisk+subWaistHeight+subWaistline;
		if(subPrecent!=0){
	     subBMIPrecent= ((double)subHealthBMI/subPrecent)*100;
	     b = new BigDecimal(subBMIPrecent);
	     subBMIPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 subAteryPrecent= ((double)subAtery/subPrecent)*100;
		 b = new BigDecimal(subAteryPrecent);
		 subAteryPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 subFatRatePrecent= ((double)subfatRate/subPrecent)*100;
		 b = new BigDecimal(subFatRatePrecent);
		 subFatRatePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 subRiskPrecent= ((double)subRisk/subPrecent)*100;
		 b = new BigDecimal(subRiskPrecent);
		 subRiskPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 subWaistlinePrecent= ((double)subWaistline/subPrecent)*100;
		 b = new BigDecimal(subWaistlinePrecent);
		 subWaistlinePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 subWaistHeightPrecent= ((double)subWaistHeight/subPrecent)*100;
		 b = new BigDecimal(subWaistHeightPrecent);
		 subWaistHeightPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		Integer patientPrecent=patientBMI+patientFatRate+patientPressure+patientRisk+
				patientSugar+patientWaistline;
		Double patientBMIPrecent = 0.0,patientPressurePrecent = 0.0,patientRiskPrecent = 0.0;
		Double patientFatRatePrecent = 0.0,patientSugarPrecent = 0.0,patientWaistlinePrecent = 0.0;
		if(patientPrecent!=0){
		 patientBMIPrecent= ((double)patientBMI/patientPrecent)*100;
		 b = new BigDecimal(patientBMIPrecent);
		 patientBMIPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 patientFatRatePrecent= ((double)patientFatRate/patientPrecent)*100;
		 b = new BigDecimal(patientFatRatePrecent);
		 patientFatRatePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 patientPressurePrecent= ((double)patientPressure/patientPrecent)*100;
		 b = new BigDecimal(patientPressurePrecent);
		 patientPressurePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 patientRiskPrecent= ((double)patientRisk/patientPrecent)*100;
		 b = new BigDecimal(patientRiskPrecent);
		 patientRiskPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 patientSugarPrecent= ((double)patientSugar/patientPrecent)*100;
		 b = new BigDecimal(patientSugarPrecent);
		 patientSugarPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 patientWaistlinePrecent= ((double)patientWaistline/patientPrecent)*100;
		 b = new BigDecimal(patientWaistlinePrecent);
		 patientWaistlinePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		Integer riskHealthPrecent=riskFat+riskMetabolic+riskPressure+riskSugar;
		Double riskFatPrecent = 0.0,riskPressurePrecent = 0.0;
		Double riskMetabolicPrecent = 0.0,riskSugarPrecent = 0.0;
		if(riskHealthPrecent!=0){
		 riskFatPrecent= ((double)riskFat/riskHealthPrecent)*100;
		 b = new BigDecimal(riskFatPrecent);
		 riskFatPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 riskMetabolicPrecent= ((double)riskMetabolic/riskHealthPrecent)*100;
		 b = new BigDecimal(riskMetabolicPrecent);
		 riskMetabolicPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 riskPressurePrecent= ((double)riskPressure/riskHealthPrecent)*100;
		 b = new BigDecimal(riskPressurePrecent);
		 riskPressurePrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 riskSugarPrecent= ((double)riskSugar/riskHealthPrecent)*100;
		 b = new BigDecimal(riskSugarPrecent);
		 riskSugarPrecent= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		List<Object> patientHealthList=new ArrayList<Object>();
		List<Object> riskList=new ArrayList<Object>();
		PrecentResult riskResultPrecent=new PrecentResult();
		riskResultPrecent.setSugarPrecent(riskSugarPrecent);
		riskResultPrecent.setPressurePrecent(riskPressurePrecent);
		riskResultPrecent.setMetabolicPrecent(riskMetabolicPrecent);
		riskResultPrecent.setFatPrecent(riskFatPrecent);
		riskList.add(riskResultPrecent);
		PrecentResult patientResultPrecent=new PrecentResult();
		patientResultPrecent.setBMIPrecent(patientBMIPrecent);
		patientResultPrecent.setWaistlinePrecent(patientWaistlinePrecent);
		patientResultPrecent.setSugarPrecent(patientSugarPrecent);
		patientResultPrecent.setRiskPrecent(patientRiskPrecent);
		patientResultPrecent.setFatRatePrecent(patientFatRatePrecent);
		patientResultPrecent.setPressurePrecent(patientPressurePrecent);
		patientHealthList.add(patientResultPrecent);
		number.put("health", healthResult);
		number.put("subHealth", subHealthResult);
		number.put("paitent", paitentResult);
		number.put("highRiskHealth", highRiskResult);
		List<Object> healthList=new ArrayList<Object>();
		List<Object> subHealthList=new ArrayList<Object>();
		PrecentResult subHealthResultPrecent=new PrecentResult();
		subHealthResultPrecent.setWaistHeightPrecent(subWaistHeightPrecent);
		subHealthResultPrecent.setWaistlinePrecent(subWaistlinePrecent);
		subHealthResultPrecent.setRiskPrecent(subRiskPrecent);
		subHealthResultPrecent.setAteryPrecent(subAteryPrecent);
		subHealthResultPrecent.setFatRatePrecent(subFatRatePrecent);
		subHealthResultPrecent.setBMIPrecent(subBMIPrecent);
		subHealthList.add(subHealthResultPrecent);
		PrecentResult healthResultPrecent=new PrecentResult();
		healthResultPrecent.setBMIPrecent(BMIPrecent);
		healthResultPrecent.setRiskPrecent(riskPrecent);
		healthResultPrecent.setMetabolicPrecent(metabolicPrecent);
		healthResultPrecent.setAteryPrecent(ateryPrecent);
		healthResultPrecent.setPressurePrecent(pressurePrecent);
		healthResultPrecent.setSugarPrecent(sugarPrecent);
		healthResultPrecent.setWaistHeightPrecent(waistHeightPrecent);
		healthResultPrecent.setWaistlinePrecent(waistlinePrecent);
		healthResultPrecent.setFatPrecent(fatPrecent);
		healthResultPrecent.setFatRatePrecent(fatRatePrecent);
		healthList.add(healthResultPrecent);
		System.out.println(healthList);
		number.put("healthList", healthList);
		number.put("subHealthList", subHealthList);
		number.put("patientHealthList", patientHealthList);
		number.put("riskList", riskList);
		return number;
	}

	@Override
	public List<NameResult> getAllAssessment() throws Exception {
		String hql="SELECT DISTINCT userId FROM LatestAssessmentResult";
		Query q=super.getBaseDao().createQuery(hql);
		List<String> list=q.list();
		int highRiskNumber=0,patientNumber=0,subHealthNumber=0,healthNumber=0;
		for(int i=0;i<list.size();i++){
			List<String> userList=new ArrayList<String>();
			userList.add(list.get(i));
			String userHql="From LatestAssessmentResult where userId=?";
			List<LatestAssessmentResult> results=super.getBaseDao().find(userHql,userList);
			System.out.println("数据库中共有数据"+results.size()+"条");
			if(results==null||results.size()==0){
				return null;
			}else{
			 for(int j=0;j<results.size();j++){
				LatestAssessmentResult personResult=results.get(j);
				String s=HealthTrendUtil.getHealthResult(personResult);
				if("highRiskHealth".equals(s)){
					highRiskNumber++;
				}
				if("patient".equals(s)){
					patientNumber++;
				}
				if("subHealth".equals(s)){
					subHealthNumber++;
				}
				if("health".equals(s)){
					healthNumber++;
				} 
			}
			}
		}
		Integer sum=healthNumber+subHealthNumber+patientNumber+highRiskNumber;
		System.out.println("总数为"+sum+"个");
		Double healthResult = 0.0,subHealthResult = 0.0,paitentResult = 0.0,highRiskResult = 0.0;
		BigDecimal b;
		List<NameResult> resultDouble=new ArrayList<NameResult>();
		if(sum!=0){
		 NameResult nameResult=new NameResult();
		 healthResult= ((double)healthNumber/sum)*100;
		 b = new BigDecimal(healthResult);
		 healthResult= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 nameResult=(NameResult) nameResult.clone();
			nameResult.setName("健康");
			nameResult.setResult(healthResult);
			resultDouble.add(nameResult);
		 subHealthResult= ((double)subHealthNumber/sum)*100;
		 b = new BigDecimal(subHealthResult);
		 subHealthResult= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 nameResult=(NameResult) nameResult.clone();
			nameResult.setName("亚健康");
			nameResult.setResult(subHealthResult);
			resultDouble.add(nameResult);
		 paitentResult= ((double)patientNumber/sum)*100;
		 b = new BigDecimal(paitentResult);
		 paitentResult= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 nameResult=(NameResult) nameResult.clone();
			nameResult.setName("病人");
			nameResult.setResult(paitentResult);
			resultDouble.add(nameResult);
		 highRiskResult= ((double)highRiskNumber/sum)*100;
		 b = new BigDecimal(highRiskResult);
		 highRiskResult= b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		 nameResult=(NameResult) nameResult.clone();
			nameResult.setName("高危病人");
			nameResult.setResult(highRiskResult);
			resultDouble.add(nameResult);
		}
		return resultDouble;
	}
	

}
