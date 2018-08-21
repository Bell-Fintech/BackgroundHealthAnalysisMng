/**
 * @author Brave Han
 *  2014年10月20日
 *  
 */
package HealthAnalysisMng.hbm.base;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 * @author onesun.hbm.base
 *
 */
public class OuterHealthForm implements Serializable{
    
	private String dataId;
	private String userId;
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	private Date   exam_Date;
	private String sequence;
	private String humenName;
	private String memberCode;
	private String gender;
	private Integer age;
	private Double Height;
	private String workload;
	private Double idealBodyWeight;
	/***********************************************/
	private Double bodyWeight;
	private Double BMI;
	private Double bodyFat;
	/**
	 * 腰臀比
	 * */
	private Double waistHip;
	/*********************状态char类型0 1 2三个状态***************************/
	private Double actualCalorie;
	
	private char milkProducts;
	private char MFBE;//鱼肉蛋类
	private char vegetable;
	private char fruit;
	private char wholeCereals;
	private char oilFat;
	/****/
	private char calorie;
	private char protein;
	private char fat;
	private char carbohydrates;
	private char calcium;
	private char lron;
	private char fiber;
	private char vitaminA;
	private char vitaminB1;
	private char vitaminB2;
	private char vitaminC;
	private char monosaccheride;
	private char cholesterol;
	private char salt;
	private char alcohol;
	private char exerciseLevel;
	/***************************************************/
	private String dietaryRecommendation;
	private String historyAlso;
	private String familyMember;
	private String pleaseConsume;
	private String notConsume;
	private String alsoReduce;
	private String QS;
	private Double everydayCalorie;
	private Double everyMealCalorie;
	/**
	 * begin
	 * format:total=breakfast+lunch+dinner+snack
	 * */
	private String milk;
	private String whole;
	private String egg;
	private String meat;
	private String fish;
	private String beans;
	private String darkVegetable;
	private String lightVegetable;
	private String fatOil;
	private String fruil;
	/**end*/
	
	public String getSequence() {
		return sequence;
	}
	
	public Date getExam_Date() {
		return exam_Date;
	}

	public void setExam_Date(Date exam_Date) {
		this.exam_Date = exam_Date;
	}

	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	public String getHumenName() {
		return humenName;
	}
	public void setHumenName(String humenName) {
		this.humenName = humenName;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Double getHeight() {
		return Height;
	}
	public void setHeight(Double height) {
		Height = height;
	}
	public String getWorkload() {
		return workload;
	}
	public void setWorkload(String workload) {
		this.workload = workload;
	}
	public Double getIdealBodyWeight() {
		return idealBodyWeight;
	}
	public void setIdealBodyWeight(Double idealBodyWeight) {
		this.idealBodyWeight = idealBodyWeight;
	}
	public Double getBodyWeight() {
		return bodyWeight;
	}
	public void setBodyWeight(Double bodyWeight) {
		this.bodyWeight = bodyWeight;
	}
	public Double getBMI() {
		return BMI;
	}
	public void setBMI(Double bMI) {
		BMI = bMI;
	}
	public Double getBodyFat() {
		return bodyFat;
	}
	public void setBodyFat(Double bodyFat) {
		this.bodyFat = bodyFat;
	}
	public Double getWaistHip() {
		return waistHip;
	}
	public void setWaistHip(Double waistHip) {
		this.waistHip = waistHip;
	}
	public Double getActualCalorie() {
		return actualCalorie;
	}
	public void setActualCalorie(Double actualCalorie) {
		this.actualCalorie = actualCalorie;
	}
	public char getMilkProducts() {
		return milkProducts;
	}
	public void setMilkProducts(char milkProducts) {
		this.milkProducts = milkProducts;
	}
	public char getMFBE() {
		return MFBE;
	}
	public void setMFBE(char mFBE) {
		MFBE = mFBE;
	}
	public char getVegetable() {
		return vegetable;
	}
	public void setVegetable(char vegetable) {
		this.vegetable = vegetable;
	}
	public char getFruit() {
		return fruit;
	}
	public void setFruit(char fruit) {
		this.fruit = fruit;
	}
	public char getWholeCereals() {
		return wholeCereals;
	}
	public void setWholeCereals(char wholeCereals) {
		this.wholeCereals = wholeCereals;
	}
	public char getOilFat() {
		return oilFat;
	}
	public void setOilFat(char oilFat) {
		this.oilFat = oilFat;
	}
	public char getCalorie() {
		return calorie;
	}
	public void setCalorie(char calorie) {
		this.calorie = calorie;
	}
	public char getProtein() {
		return protein;
	}
	public void setProtein(char protein) {
		this.protein = protein;
	}
	public char getFat() {
		return fat;
	}
	public void setFat(char fat) {
		this.fat = fat;
	}
	public char getCarbohydrates() {
		return carbohydrates;
	}
	public void setCarbohydrates(char carbohydrates) {
		this.carbohydrates = carbohydrates;
	}
	public char getCalcium() {
		return calcium;
	}
	public void setCalcium(char calcium) {
		this.calcium = calcium;
	}
	public char getLron() {
		return lron;
	}
	public void setLron(char lron) {
		this.lron = lron;
	}
	public char getFiber() {
		return fiber;
	}
	public void setFiber(char fiber) {
		this.fiber = fiber;
	}
	public char getVitaminA() {
		return vitaminA;
	}
	public void setVitaminA(char vitaminA) {
		this.vitaminA = vitaminA;
	}
	public char getVitaminB1() {
		return vitaminB1;
	}
	public void setVitaminB1(char vitaminB1) {
		this.vitaminB1 = vitaminB1;
	}
	public char getVitaminB2() {
		return vitaminB2;
	}
	public void setVitaminB2(char vitaminB2) {
		this.vitaminB2 = vitaminB2;
	}
	public char getVitaminC() {
		return vitaminC;
	}
	public void setVitaminC(char vitaminC) {
		this.vitaminC = vitaminC;
	}
	public char getMonosaccheride() {
		return monosaccheride;
	}
	public void setMonosaccheride(char monosaccheride) {
		this.monosaccheride = monosaccheride;
	}
	public char getCholesterol() {
		return cholesterol;
	}
	public void setCholesterol(char cholesterol) {
		this.cholesterol = cholesterol;
	}
	public char getSalt() {
		return salt;
	}
	public void setSalt(char salt) {
		this.salt = salt;
	}
	public char getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(char alcohol) {
		this.alcohol = alcohol;
	}
	public char getExerciseLevel() {
		return exerciseLevel;
	}
	public void setExerciseLevel(char exerciseLevel) {
		this.exerciseLevel = exerciseLevel;
	}
	public String getDietaryRecommendation() {
		return dietaryRecommendation;
	}
	public void setDietaryRecommendation(String dietaryRecommendation) {
		this.dietaryRecommendation = dietaryRecommendation;
	}
	public String getHistoryAlso() {
		return historyAlso;
	}
	public void setHistoryAlso(String historyAlso) {
		this.historyAlso = historyAlso;
	}
	public String getFamilyMember() {
		return familyMember;
	}
	public void setFamilyMember(String familyMember) {
		this.familyMember = familyMember;
	}
	public String getPleaseConsume() {
		return pleaseConsume;
	}
	public void setPleaseConsume(String pleaseConsume) {
		this.pleaseConsume = pleaseConsume;
	}
	public String getNotConsume() {
		return notConsume;
	}
	public void setNotConsume(String notConsume) {
		this.notConsume = notConsume;
	}
	public String getAlsoReduce() {
		return alsoReduce;
	}
	public void setAlsoReduce(String alsoReduce) {
		this.alsoReduce = alsoReduce;
	}
	public String getQS() {
		return QS;
	}
	public void setQS(String qS) {
		QS = qS;
	}
	public Double getEverydayCalorie() {
		return everydayCalorie;
	}
	public void setEverydayCalorie(Double everydayCalorie) {
		this.everydayCalorie = everydayCalorie;
	}
	public Double getEveryMealCalorie() {
		return everyMealCalorie;
	}
	public void setEveryMealCalorie(Double everyMealCalorie) {
		this.everyMealCalorie = everyMealCalorie;
	}
	public String getMilk() {
		return milk;
	}
	public void setMilk(String milk) {
		this.milk = milk;
	}
	public String getWhole() {
		return whole;
	}
	public void setWhole(String whole) {
		this.whole = whole;
	}
	public String getEgg() {
		return egg;
	}
	public void setEgg(String egg) {
		this.egg = egg;
	}
	public String getMeat() {
		return meat;
	}
	public void setMeat(String meat) {
		this.meat = meat;
	}
	public String getFish() {
		return fish;
	}
	public void setFish(String fish) {
		this.fish = fish;
	}
	public String getBeans() {
		return beans;
	}
	public void setBeans(String beans) {
		this.beans = beans;
	}
	public String getDarkVegetable() {
		return darkVegetable;
	}
	public void setDarkVegetable(String darkVegetable) {
		this.darkVegetable = darkVegetable;
	}
	public String getLightVegetable() {
		return lightVegetable;
	}
	public void setLightVegetable(String lightVegetable) {
		this.lightVegetable = lightVegetable;
	}
	public String getFatOil() {
		return fatOil;
	}
	public void setFatOil(String fatOil) {
		this.fatOil = fatOil;
	}
	public String getFruil() {
		return fruil;
	}
	public void setFruil(String fruil) {
		this.fruil = fruil;
	}
}
