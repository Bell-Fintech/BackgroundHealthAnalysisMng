/**
 * @author Brave Han
 *  2014年10月30日
 *  
 */
package HealthAnalysisMng.hbm.base;

import java.io.Serializable;

/**
 * @author onesun.hbm.base
 *  Brave Han
 */
/**
 * ClassName:ThreeCommonInspection
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   bravehan
 * @version  
 * @since    Ver 1.1
 * @Date	 2015	2015年3月14日		上午12:47:24
 *
 * @see 	 
 * 
 */
public class ThreeCommonInspection implements Serializable {
	
	
	private String dataId;
	private String userId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	private String memberCode;
	private String seq_NO;
	//叁：骨密度检查
	/**
	 * 骨密度
	 * T值（>=-1）
	 * */
	private Double BMD;
	//肆：肺功能检查
	/**
	 * 肺活量
	 * */
	private Double pulmonary;
	/**一秒钟用力吐气量
	 * Forced expiratory volume in one second
	 * */
	private Double forced_expiratory_volume;
	/**Maximum Mid-Expiratory Flow
	 * 最大中段流速量
	 * */
	private Double max_expiratory_flow;
	/**血氧饱和度
	 * oxygen saturation（>=95%）
	 * */
	private Double oxygen_saturation;
	//伍：听力检查
	/**右耳（<=30dB）
	 * right_ear
	 * */
	private Double right_ear;
	/**左耳（<=30dB）
	 * left_ear
	 * */
	private Double left_ear;
	//陆：眼科检查
	//1
	/**视力 右眼：矫正前
	 * In the right eye before correction
	 * */
	private Double right_eye_before_correction;
	/**右眼：矫正后
	 * In the right eye after correction
	 * */
	private Double right_eye_after_correction;
	/**左眼：矫正前
	 * In the left eye before correction
	 * */
	private Double left_eye_before_correction;
	/**左眼：矫正后
	 * In the left eye after correction
	 * */
	private Double left_eye_after_correction;
	/**
	 * 散光
	 * */
	private String astigmatism;
	/**
	 * 辩色力
	 * recognize_the_color
	 * */
	private String recognize_color;
	/**
	 * 眼压（12-20）
	 * 右眼
	 * */
	private String right_eye_pressure;
	/**
	 * 左眼
	 * */
	private String left_eye_pressure;
	//2
	/**眼底摄影检查      Inspection people:example 医师王钊
	 * */
	private String eye_ground_inspection;
	//3
	/**
	 * 裂隙灯检查
	 * */
	private String  slit_lamp;
	//柒：心电图检查
	/**
	 * 心电图
	 * */
    private String electrocardiogram;
    //捌：腹部超声波检查
    /**
     * 腹部超声波检查
     * */
    private String ultrasonography;
    //玖：耳鼻喉科检查
    /**
     * 耳鼻喉检查
     * */
    private String check_Ent;
    //拾：妇科检查
    //1，宫颈涂片
    /**
     * 宫颈涂片
     * */
    private String cervical_smear;
    //2.内诊
    /**
     * 内诊
     * */
    private String internal_examination;
    //拾壹：外科检查
    /**
     * 1淋巴结与甲状腺 Lymph nodes and the thyroid gland
     * */
    private String lymph_and_thyroid;
    /**
     *2 乳房或阴囊触诊
     * */
    private String breast_scrotum;
    /**
     *3 肛诊(男性含前列腺)
     * */
    private String anal_diagnosis;
    /**4.骨骼，皮肤和指甲
     * The bones, skin and nails
     * */
    private String bones_skin_nails;
    //拾贰：口腔检查
    /**
     * 口腔检查
     * */
    private String oral_examination;
    //拾叁：影像学检查
    /**1。胸部X光检查 inspection people:example:    医师孟力军
     *      entity result
     * */
    private String chest_X_ray;
    /**
     * 2.腹部X光检查
     * */
    private String abdominal_X;
    /**
     * 3.上消化道造影
     * */
    private String UGI;
    
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
	 * bMD
	 *
	 * @return  the bMD
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getBMD() {
		return BMD;
	}
	/**
	 * bMD
	 *
	 * @param   bMD    the bMD to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBMD(Double bMD) {
		BMD = bMD;
	}
	/**
	 * pulmonary
	 *
	 * @return  the pulmonary
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getPulmonary() {
		return pulmonary;
	}
	/**
	 * pulmonary
	 *
	 * @param   pulmonary    the pulmonary to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setPulmonary(Double pulmonary) {
		this.pulmonary = pulmonary;
	}
	/**
	 * forced_expiratory_volume
	 *
	 * @return  the forced_expiratory_volume
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getForced_expiratory_volume() {
		return forced_expiratory_volume;
	}
	/**
	 * forced_expiratory_volume
	 *
	 * @param   forced_expiratory_volume    the forced_expiratory_volume to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setForced_expiratory_volume(Double forced_expiratory_volume) {
		this.forced_expiratory_volume = forced_expiratory_volume;
	}
	/**
	 * max_expiratory_flow
	 *
	 * @return  the max_expiratory_flow
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getMax_expiratory_flow() {
		return max_expiratory_flow;
	}
	/**
	 * max_expiratory_flow
	 *
	 * @param   max_expiratory_flow    the max_expiratory_flow to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setMax_expiratory_flow(Double max_expiratory_flow) {
		this.max_expiratory_flow = max_expiratory_flow;
	}
	/**
	 * oxygen_saturation
	 *
	 * @return  the oxygen_saturation
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getOxygen_saturation() {
		return oxygen_saturation;
	}
	/**
	 * oxygen_saturation
	 *
	 * @param   oxygen_saturation    the oxygen_saturation to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setOxygen_saturation(Double oxygen_saturation) {
		this.oxygen_saturation = oxygen_saturation;
	}
	/**
	 * right_ear
	 *
	 * @return  the right_ear
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getRight_ear() {
		return right_ear;
	}
	/**
	 * right_ear
	 *
	 * @param   right_ear    the right_ear to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setRight_ear(Double right_ear) {
		this.right_ear = right_ear;
	}
	/**
	 * left_ear
	 *
	 * @return  the left_ear
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getLeft_ear() {
		return left_ear;
	}
	/**
	 * left_ear
	 *
	 * @param   left_ear    the left_ear to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setLeft_ear(Double left_ear) {
		this.left_ear = left_ear;
	}
	/**
	 * right_eye_before_correction
	 *
	 * @return  the right_eye_before_correction
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getRight_eye_before_correction() {
		return right_eye_before_correction;
	}
	/**
	 * right_eye_before_correction
	 *
	 * @param   right_eye_before_correction    the right_eye_before_correction to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setRight_eye_before_correction(Double right_eye_before_correction) {
		this.right_eye_before_correction = right_eye_before_correction;
	}
	/**
	 * right_eye_after_correction
	 *
	 * @return  the right_eye_after_correction
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getRight_eye_after_correction() {
		return right_eye_after_correction;
	}
	/**
	 * right_eye_after_correction
	 *
	 * @param   right_eye_after_correction    the right_eye_after_correction to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setRight_eye_after_correction(Double right_eye_after_correction) {
		this.right_eye_after_correction = right_eye_after_correction;
	}
	/**
	 * left_eye_before_correction
	 *
	 * @return  the left_eye_before_correction
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getLeft_eye_before_correction() {
		return left_eye_before_correction;
	}
	/**
	 * left_eye_before_correction
	 *
	 * @param   left_eye_before_correction    the left_eye_before_correction to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setLeft_eye_before_correction(Double left_eye_before_correction) {
		this.left_eye_before_correction = left_eye_before_correction;
	}
	/**
	 * left_eye_after_correction
	 *
	 * @return  the left_eye_after_correction
	 * @since   CodingExample Ver 1.0
	 */
	
	public Double getLeft_eye_after_correction() {
		return left_eye_after_correction;
	}
	/**
	 * left_eye_after_correction
	 *
	 * @param   left_eye_after_correction    the left_eye_after_correction to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setLeft_eye_after_correction(Double left_eye_after_correction) {
		this.left_eye_after_correction = left_eye_after_correction;
	}
	/**
	 * astigmatism
	 *
	 * @return  the astigmatism
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getAstigmatism() {
		return astigmatism;
	}
	/**
	 * astigmatism
	 *
	 * @param   astigmatism    the astigmatism to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setAstigmatism(String astigmatism) {
		this.astigmatism = astigmatism;
	}
	/**
	 * recognize_color
	 *
	 * @return  the recognize_color
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getRecognize_color() {
		return recognize_color;
	}
	/**
	 * recognize_color
	 *
	 * @param   recognize_color    the recognize_color to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setRecognize_color(String recognize_color) {
		this.recognize_color = recognize_color;
	}
	/**
	 * right_eye_pressure
	 *
	 * @return  the right_eye_pressure
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getRight_eye_pressure() {
		return right_eye_pressure;
	}
	/**
	 * right_eye_pressure
	 *
	 * @param   right_eye_pressure    the right_eye_pressure to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setRight_eye_pressure(String right_eye_pressure) {
		this.right_eye_pressure = right_eye_pressure;
	}
	/**
	 * left_eye_pressure
	 *
	 * @return  the left_eye_pressure
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getLeft_eye_pressure() {
		return left_eye_pressure;
	}
	/**
	 * left_eye_pressure
	 *
	 * @param   left_eye_pressure    the left_eye_pressure to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setLeft_eye_pressure(String left_eye_pressure) {
		this.left_eye_pressure = left_eye_pressure;
	}
	/**
	 * eye_ground_inspection
	 *
	 * @return  the eye_ground_inspection
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getEye_ground_inspection() {
		return eye_ground_inspection;
	}
	/**
	 * eye_ground_inspection
	 *
	 * @param   eye_ground_inspection    the eye_ground_inspection to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setEye_ground_inspection(String eye_ground_inspection) {
		this.eye_ground_inspection = eye_ground_inspection;
	}
	/**
	 * slit_lamp
	 *
	 * @return  the slit_lamp
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getSlit_lamp() {
		return slit_lamp;
	}
	/**
	 * slit_lamp
	 *
	 * @param   slit_lamp    the slit_lamp to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setSlit_lamp(String slit_lamp) {
		this.slit_lamp = slit_lamp;
	}
	/**
	 * electrocardiogram
	 *
	 * @return  the electrocardiogram
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getElectrocardiogram() {
		return electrocardiogram;
	}
	/**
	 * electrocardiogram
	 *
	 * @param   electrocardiogram    the electrocardiogram to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setElectrocardiogram(String electrocardiogram) {
		this.electrocardiogram = electrocardiogram;
	}
	/**
	 * ultrasonography
	 *
	 * @return  the ultrasonography
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getUltrasonography() {
		return ultrasonography;
	}
	/**
	 * ultrasonography
	 *
	 * @param   ultrasonography    the ultrasonography to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setUltrasonography(String ultrasonography) {
		this.ultrasonography = ultrasonography;
	}
	/**
	 * check_Ent
	 *
	 * @return  the check_Ent
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCheck_Ent() {
		return check_Ent;
	}
	/**
	 * check_Ent
	 *
	 * @param   check_Ent    the check_Ent to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCheck_Ent(String check_Ent) {
		this.check_Ent = check_Ent;
	}
	/**
	 * cervical_smear
	 *
	 * @return  the cervical_smear
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getCervical_smear() {
		return cervical_smear;
	}
	/**
	 * cervical_smear
	 *
	 * @param   cervical_smear    the cervical_smear to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setCervical_smear(String cervical_smear) {
		this.cervical_smear = cervical_smear;
	}
	/**
	 * internal_examination
	 *
	 * @return  the internal_examination
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getInternal_examination() {
		return internal_examination;
	}
	/**
	 * internal_examination
	 *
	 * @param   internal_examination    the internal_examination to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setInternal_examination(String internal_examination) {
		this.internal_examination = internal_examination;
	}
	/**
	 * lymph_and_thyroid
	 *
	 * @return  the lymph_and_thyroid
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getLymph_and_thyroid() {
		return lymph_and_thyroid;
	}
	/**
	 * lymph_and_thyroid
	 *
	 * @param   lymph_and_thyroid    the lymph_and_thyroid to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setLymph_and_thyroid(String lymph_and_thyroid) {
		this.lymph_and_thyroid = lymph_and_thyroid;
	}
	/**
	 * breast_scrotum
	 *
	 * @return  the breast_scrotum
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getBreast_scrotum() {
		return breast_scrotum;
	}
	/**
	 * breast_scrotum
	 *
	 * @param   breast_scrotum    the breast_scrotum to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBreast_scrotum(String breast_scrotum) {
		this.breast_scrotum = breast_scrotum;
	}
	/**
	 * anal_diagnosis
	 *
	 * @return  the anal_diagnosis
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getAnal_diagnosis() {
		return anal_diagnosis;
	}
	/**
	 * anal_diagnosis
	 *
	 * @param   anal_diagnosis    the anal_diagnosis to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setAnal_diagnosis(String anal_diagnosis) {
		this.anal_diagnosis = anal_diagnosis;
	}
	/**
	 * bones_skin_nails
	 *
	 * @return  the bones_skin_nails
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getBones_skin_nails() {
		return bones_skin_nails;
	}
	/**
	 * bones_skin_nails
	 *
	 * @param   bones_skin_nails    the bones_skin_nails to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setBones_skin_nails(String bones_skin_nails) {
		this.bones_skin_nails = bones_skin_nails;
	}
	/**
	 * oral_examination
	 *
	 * @return  the oral_examination
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getOral_examination() {
		return oral_examination;
	}
	/**
	 * oral_examination
	 *
	 * @param   oral_examination    the oral_examination to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setOral_examination(String oral_examination) {
		this.oral_examination = oral_examination;
	}
	/**
	 * chest_X_ray
	 *
	 * @return  the chest_X_ray
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getChest_X_ray() {
		return chest_X_ray;
	}
	/**
	 * chest_X_ray
	 *
	 * @param   chest_X_ray    the chest_X_ray to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setChest_X_ray(String chest_X_ray) {
		this.chest_X_ray = chest_X_ray;
	}
	/**
	 * abdominal_X
	 *
	 * @return  the abdominal_X
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getAbdominal_X() {
		return abdominal_X;
	}
	/**
	 * abdominal_X
	 *
	 * @param   abdominal_X    the abdominal_X to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setAbdominal_X(String abdominal_X) {
		this.abdominal_X = abdominal_X;
	}
	/**
	 * uGI
	 *
	 * @return  the uGI
	 * @since   CodingExample Ver 1.0
	 */
	
	public String getUGI() {
		return UGI;
	}
	/**
	 * uGI
	 *
	 * @param   uGI    the uGI to set
	 * @since   CodingExample Ver 1.0
	 */
	
	public void setUGI(String uGI) {
		UGI = uGI;
	}
	@Override
	public String toString() {
		return "ThreeCommonInspection [dataId=" + dataId + ", memberCode=" + memberCode + ", seq_NO=" + seq_NO
				+ ", BMD=" + BMD + ", pulmonary=" + pulmonary + ", forced_expiratory_volume="
				+ forced_expiratory_volume + ", max_expiratory_flow=" + max_expiratory_flow + ", oxygen_saturation="
				+ oxygen_saturation + ", right_ear=" + right_ear + ", left_ear=" + left_ear
				+ ", right_eye_before_correction=" + right_eye_before_correction + ", right_eye_after_correction="
				+ right_eye_after_correction + ", left_eye_before_correction=" + left_eye_before_correction
				+ ", left_eye_after_correction=" + left_eye_after_correction + ", astigmatism=" + astigmatism
				+ ", recognize_color=" + recognize_color + ", right_eye_pressure=" + right_eye_pressure
				+ ", left_eye_pressure=" + left_eye_pressure + ", eye_ground_inspection=" + eye_ground_inspection
				+ ", slit_lamp=" + slit_lamp + ", electrocardiogram=" + electrocardiogram + ", ultrasonography="
				+ ultrasonography + ", check_Ent=" + check_Ent + ", cervical_smear=" + cervical_smear
				+ ", internal_examination=" + internal_examination + ", lymph_and_thyroid=" + lymph_and_thyroid
				+ ", breast_scrotum=" + breast_scrotum + ", anal_diagnosis=" + anal_diagnosis + ", bones_skin_nails="
				+ bones_skin_nails + ", oral_examination=" + oral_examination + ", chest_X_ray=" + chest_X_ray
				+ ", abdominal_X=" + abdominal_X + ", UGI=" + UGI + "]";
	}
	
}
