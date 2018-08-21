package HealthAnalysisMng.hbm.base.background;

import java.io.Serializable;

public class DetectObject implements Serializable{
	private String dataId;
	private String detectName;
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public String getDetectName() {
		return detectName;
	}
	public void setDetectName(String detectName) {
		this.detectName = detectName;
	}
	

}
