package HealthAnalysisMng.model;


public class ResultObject {
    private String value;
    private String indbtime;
    private String imagePath;
    private String result;
    private String proposal;
    private String[] label;
    private String introduce;
    
    /** 
    * @Fields status : 是否有数据
    */ 
    private boolean status;
    private Object object;
    /**
     * 收缩压
     */
    private String sbp;
    /**
     * 舒张压
     */
    private String dbp;
    /**
     * 平均压
     */
    private String mbp;

    public String getResult() {
        return result;
    }
    public void setResult(String result) {
        this.result = result;
    }
    public String getSbp() {
        return sbp;
    }
    public void setSbp(String sbp) {
        this.sbp = sbp;
    }
    public String getDbp() {
        return dbp;
    }
    public void setDbp(String dbp) {
        this.dbp = dbp;
    }
    public String getMbp() {
        return mbp;
    }
    public void setMbp(String mbp) {
        this.mbp = mbp;
    }
    public String[] getLabel() {
        return label;
    }
    public void setLabel(String[] label) {
        this.label = label;
    }
    public String getImagePath() {
        return imagePath;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    public String getProposal() {
        return proposal;
    }
    public void setProposal(String proposal) {
        this.proposal = proposal;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public String getIntroduce() {
        return introduce;
    }
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
    public String getIndbtime() {
        return indbtime;
    }
    public void setIndbtime(String indbtime) {
        this.indbtime = indbtime;
    }
    public boolean isStatus() {
        return status;
    }
    public void setStatus(boolean status) {
        this.status = status;
    }
    public Object getObject() {
        return object;
    }
    public void setObject(Object object) {
        this.object = object;
    }

}
