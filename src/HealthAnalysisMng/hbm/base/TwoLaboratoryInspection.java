/**
 * @author Brave Han
 *  2014年10月27日
 *  
 */
package HealthAnalysisMng.hbm.base;

import java.sql.Timestamp;

/**
 * @author onesun.hbm.base
 *  Brave Han
 */
public class TwoLaboratoryInspection {

	private String dataId;
	private String userId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**会员码*/
	private String memberCode;
	/**检查时间*/
	private Timestamp checkTime;
	/*以下是血液检查*******/
	/**白细胞计数*/
	private Double WBC;
	/**红细胞计数*/
	private Double RBC;
	/**血红蛋白测定*/
	private Double HB;
	/**红细胞压积*/
	private Double HCT;
	/**平均红细胞体积*/
	private Double MCV;
	/**平均红细胞血红蛋白*/
	private Double MCH;
	/**平均红细胞血红蛋白浓度*/
	private Double MCHC;
	/**红细胞体积分布宽度*/
	private Double RDW;
	/**血小板计数*/
	private Double PLT;
	/*以下是白细胞五项分类*******后跟大写P为百分比********/
	/**中性粒细胞百分比*/
	private Double neutrophilP;
	/**淋巴细胞百分比*/
	private Double lymphocyteP;
	/**单核细胞百分比*/
	private Double  monocyteP;
	/**嗜酸性粒细胞百分比*/
	private Double  eosinophilP;
	/**嗜碱性粒细胞百分比*/
	private Double basophilP;
	/********************空腹血糖*****************************/
	private Double FBG;
	/*肝胆功能检查*****************************/
	/**总胆红素*/
	private Double BIL_T;
	/**直接胆红素*/
	private Double BIL_D;
	/**总蛋白*/
	private Double TP;
	/**白蛋白*/
	private Double ALB;
	/**球蛋白*/
	private Double GLO;
	/**碱性磷酸酶*/
	private Double ALP;
	/**天门冬氨酸氨基转移酶*/
	private Double AST;
	/**谷氨酸氨基转移酶*/
	private Double ALT;
	/**谷氨酸转移酶*/
	private Double GGT;
	/**乳酸脱氢酶*/
	private Double LDH;
	/*肾功能检查*************/
	/**尿素氮*/
	private Double BUN;
	/**肌酐*/
	private Double CRE;
	/**肾小球滤过率*/
	private Double eGFR;
	/***************尿酸检查*******************/
	private Double UA;
	/*血脂检查***********************/
	/**甘油三酯*/
	private Double TG;
	/**总胆固醇*/
	private Double CHOL;
	/**高密度脂蛋白-胆固醇*/
	private Double HDL_C;
	/**低密度脂蛋白-胆固醇*/
	private Double LDL_C;
	/**CHOL/HDL-C比值*/
	private Double CHOL_HDL_C_P;
	/*钙磷铁检查********/
	/**钙*/
	private Double Ca;
	/**磷*/
	private Double P;
	/**铁*/
	private Double Fe;
	/**总铁结合力*/
	private Double TIBC;
	/**铁饱和度*/
	private Double FeSaturation;
	/********************肝炎筛检**************************************/
	private Double HAV_igM;//甲型肝炎抗体
	/*癌症筛检**********************/
	/**甲胎蛋白*/
	private Double alphaFetoprotein;
	/**癌胚抗原*/
	private Double CEA;
	/*甲状腺功能检查************************/
	/**促甲状腺激素*/
	private Double TSH;
	/**游离甲状腺素*/
	private Double F_T4;
	/**游离三碘甲状腺原氨酸*/
	private Double F_T3;
	/*组织发炎筛检********************************/
	/**C反应蛋白*/
	private Double CRP;
	/**类风湿因子*/
	private Double RF;
	/*梅毒血清试验*********************/
	/**快速梅毒螺旋体反应素测定*/
	private Double RPR;
	/**梅毒螺旋体血凝试验*/
	private Double TPHA;
	/*************肌酸激酶**********************/
	private Double CPK;
	/*************血型ABO型***************************/
	private Double bloodTypes;
	/**************结合病筛选****************************/
	private Double check_TBAB;//结核抗体筛选
	//粪便与尿液检查
	/*************外观********************/
	private String appearance;
	/**尿蛋白定性*/
	private String PRO;
	/**尿糖定性*/
	private String Glucose;
	/**尿胆红素*/
	private String BIL;
	/**尿胆原*/
	private String URO;
	/**尿潜血*/
	private String BLD;
	/**尿酮体*/
	private String KET;
	/**尿亚硝酸盐*/
	private String NIT;
	/**尿白细胞*/
	private String LEU;
	/**尿比重*/
	private Double SG;
	/**尿酸碱度*/
	private Double urinePH;
	/**尿红细胞*/
	private Double pissRBC;
	/**尿白细胞*/
	private Double pissWBC;
	/**上皮细胞*/
	private Double HLEC;
	/**管型*/
	private Double CAST;
	/**细菌*/
	private Double bacteria;
	/**其他*/
	private String rests;
	/**免疫法粪便潜血反应*/
	private String FOBT;
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public Timestamp getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Timestamp checkTime) {
		this.checkTime = checkTime;
	}
	public Double getWBC() {
		return WBC;
	}
	public void setWBC(Double wBC) {
		WBC = wBC;
	}
	public Double getRBC() {
		return RBC;
	}
	public void setRBC(Double rBC) {
		RBC = rBC;
	}
	public Double getHB() {
		return HB;
	}
	public void setHB(Double hB) {
		HB = hB;
	}
	public Double getHCT() {
		return HCT;
	}
	public void setHCT(Double hCT) {
		HCT = hCT;
	}
	public Double getMCV() {
		return MCV;
	}
	public void setMCV(Double mCV) {
		MCV = mCV;
	}
	public Double getMCH() {
		return MCH;
	}
	public void setMCH(Double mCH) {
		MCH = mCH;
	}
	public Double getMCHC() {
		return MCHC;
	}
	public void setMCHC(Double mCHC) {
		MCHC = mCHC;
	}
	public Double getRDW() {
		return RDW;
	}
	public void setRDW(Double rDW) {
		RDW = rDW;
	}
	public Double getPLT() {
		return PLT;
	}
	public void setPLT(Double pLT) {
		PLT = pLT;
	}
	public Double getNeutrophilP() {
		return neutrophilP;
	}
	public void setNeutrophilP(Double neutrophilP) {
		this.neutrophilP = neutrophilP;
	}
	public Double getLymphocyteP() {
		return lymphocyteP;
	}
	public void setLymphocyteP(Double lymphocyteP) {
		this.lymphocyteP = lymphocyteP;
	}
	public Double getMonocyteP() {
		return monocyteP;
	}
	public void setMonocyteP(Double monocyteP) {
		this.monocyteP = monocyteP;
	}
	public Double getEosinophilP() {
		return eosinophilP;
	}
	public void setEosinophilP(Double eosinophilP) {
		this.eosinophilP = eosinophilP;
	}
	public Double getBasophilP() {
		return basophilP;
	}
	public void setBasophilP(Double basophilP) {
		this.basophilP = basophilP;
	}
	public Double getFBG() {
		return FBG;
	}
	public void setFBG(Double fBG) {
		FBG = fBG;
	}
	public Double getBIL_T() {
		return BIL_T;
	}
	public void setBIL_T(Double bIL_T) {
		BIL_T = bIL_T;
	}
	public Double getBIL_D() {
		return BIL_D;
	}
	public void setBIL_D(Double bIL_D) {
		BIL_D = bIL_D;
	}
	public Double getTP() {
		return TP;
	}
	public void setTP(Double tP) {
		TP = tP;
	}
	public Double getALB() {
		return ALB;
	}
	public void setALB(Double aLB) {
		ALB = aLB;
	}
	public Double getGLO() {
		return GLO;
	}
	public void setGLO(Double gLO) {
		GLO = gLO;
	}
	public Double getALP() {
		return ALP;
	}
	public void setALP(Double aLP) {
		ALP = aLP;
	}
	public Double getAST() {
		return AST;
	}
	public void setAST(Double aST) {
		AST = aST;
	}
	public Double getALT() {
		return ALT;
	}
	public void setALT(Double aLT) {
		ALT = aLT;
	}
	public Double getGGT() {
		return GGT;
	}
	public void setGGT(Double gGT) {
		GGT = gGT;
	}
	public Double getLDH() {
		return LDH;
	}
	public void setLDH(Double lDH) {
		LDH = lDH;
	}
	public Double getBUN() {
		return BUN;
	}
	public void setBUN(Double bUN) {
		BUN = bUN;
	}
	public Double getCRE() {
		return CRE;
	}
	public void setCRE(Double cRE) {
		CRE = cRE;
	}
	public Double geteGFR() {
		return eGFR;
	}
	public void seteGFR(Double eGFR) {
		this.eGFR = eGFR;
	}
	public Double getUA() {
		return UA;
	}
	public void setUA(Double uA) {
		UA = uA;
	}
	public Double getTG() {
		return TG;
	}
	public void setTG(Double tG) {
		TG = tG;
	}
	public Double getCHOL() {
		return CHOL;
	}
	public void setCHOL(Double cHOL) {
		CHOL = cHOL;
	}
	public Double getHDL_C() {
		return HDL_C;
	}
	public void setHDL_C(Double hDL_C) {
		HDL_C = hDL_C;
	}
	public Double getLDL_C() {
		return LDL_C;
	}
	public void setLDL_C(Double lDL_C) {
		LDL_C = lDL_C;
	}
	public Double getCHOL_HDL_C_P() {
		return CHOL_HDL_C_P;
	}
	public void setCHOL_HDL_C_P(Double cHOL_HDL_C_P) {
		CHOL_HDL_C_P = cHOL_HDL_C_P;
	}
	public Double getCa() {
		return Ca;
	}
	public void setCa(Double ca) {
		Ca = ca;
	}
	public Double getP() {
		return P;
	}
	public void setP(Double p) {
		P = p;
	}
	public Double getFe() {
		return Fe;
	}
	public void setFe(Double fe) {
		Fe = fe;
	}
	public Double getTIBC() {
		return TIBC;
	}
	public void setTIBC(Double tIBC) {
		TIBC = tIBC;
	}
	public Double getFeSaturation() {
		return FeSaturation;
	}
	public void setFeSaturation(Double feSaturation) {
		FeSaturation = feSaturation;
	}
	public Double getHAV_igM() {
		return HAV_igM;
	}
	public void setHAV_igM(Double hAV_igM) {
		HAV_igM = hAV_igM;
	}
	public Double getAlphaFetoprotein() {
		return alphaFetoprotein;
	}
	public void setAlphaFetoprotein(Double alphaFetoprotein) {
		this.alphaFetoprotein = alphaFetoprotein;
	}
	public Double getCEA() {
		return CEA;
	}
	public void setCEA(Double cEA) {
		CEA = cEA;
	}
	public Double getTSH() {
		return TSH;
	}
	public void setTSH(Double tSH) {
		TSH = tSH;
	}
	public Double getF_T4() {
		return F_T4;
	}
	public void setF_T4(Double f_T4) {
		F_T4 = f_T4;
	}
	public Double getF_T3() {
		return F_T3;
	}
	public void setF_T3(Double f_T3) {
		F_T3 = f_T3;
	}
	public Double getCRP() {
		return CRP;
	}
	public void setCRP(Double cRP) {
		CRP = cRP;
	}
	public Double getRF() {
		return RF;
	}
	public void setRF(Double rF) {
		RF = rF;
	}
	public Double getRPR() {
		return RPR;
	}
	public void setRPR(Double rPR) {
		RPR = rPR;
	}
	public Double getTPHA() {
		return TPHA;
	}
	public void setTPHA(Double tPHA) {
		TPHA = tPHA;
	}
	public Double getCPK() {
		return CPK;
	}
	public void setCPK(Double cPK) {
		CPK = cPK;
	}
	public Double getBloodTypes() {
		return bloodTypes;
	}
	public void setBloodTypes(Double bloodTypes) {
		this.bloodTypes = bloodTypes;
	}
	public Double getCheck_TBAB() {
		return check_TBAB;
	}
	public void setCheck_TBAB(Double check_TBAB) {
		this.check_TBAB = check_TBAB;
	}
	
	public String getAppearance() {
		return appearance;
	}
	public void setAppearance(String appearance) {
		this.appearance = appearance;
	}
	public String getPRO() {
		return PRO;
	}
	public void setPRO(String pRO) {
		PRO = pRO;
	}
	public String getGlucose() {
		return Glucose;
	}
	public void setGlucose(String glucose) {
		Glucose = glucose;
	}
	public String getBIL() {
		return BIL;
	}
	public void setBIL(String bIL) {
		BIL = bIL;
	}
	public String getURO() {
		return URO;
	}
	public void setURO(String uRO) {
		URO = uRO;
	}
	public String getBLD() {
		return BLD;
	}
	public void setBLD(String bLD) {
		BLD = bLD;
	}
	public String getKET() {
		return KET;
	}
	public void setKET(String kET) {
		KET = kET;
	}
	public String getNIT() {
		return NIT;
	}
	public void setNIT(String nIT) {
		NIT = nIT;
	}
	public String getLEU() {
		return LEU;
	}
	public void setLEU(String lEU) {
		LEU = lEU;
	}
	public Double getSG() {
		return SG;
	}
	public void setSG(Double sG) {
		SG = sG;
	}
	public Double getUrinePH() {
		return urinePH;
	}
	public void setUrinePH(Double urinePH) {
		this.urinePH = urinePH;
	}
	public Double getPissRBC() {
		return pissRBC;
	}
	public void setPissRBC(Double pissRBC) {
		this.pissRBC = pissRBC;
	}
	public Double getPissWBC() {
		return pissWBC;
	}
	public void setPissWBC(Double pissWBC) {
		this.pissWBC = pissWBC;
	}
	public Double getHLEC() {
		return HLEC;
	}
	public void setHLEC(Double hLEC) {
		HLEC = hLEC;
	}
	public Double getCAST() {
		return CAST;
	}
	public void setCAST(Double cAST) {
		CAST = cAST;
	}
	public Double getBacteria() {
		return bacteria;
	}
	public void setBacteria(Double bacteria) {
		this.bacteria = bacteria;
	}
	public String getRests() {
		return rests;
	}
	public void setRests(String rests) {
		this.rests = rests;
	}
	public String getFOBT() {
		return FOBT;
	}
	public void setFOBT(String fOBT) {
		FOBT = fOBT;
	}
	
	
	
	
}
