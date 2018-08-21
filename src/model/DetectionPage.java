package HealthAnalysisMng.model;
/**
 * 继承基本分页属性， 加入检测基本属性
 * @extends Base  DataGrid
 * @author  brave Han
 * @default TableName=HighWeight
 * */
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class DetectionPage extends DataGrid{
    private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private String userId;
	private String beginTime;
	private String endTime;
	private String tableName="HighWeight";
	
	public DetectionPage() {
		super();
	}
	public DetectionPage(SimpleDateFormat sdf, String userId, String beginTime, String endTime, String tableName) {
		super();
		this.sdf = sdf;
		this.userId = userId;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.tableName = tableName;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public SimpleDateFormat getSdf() {
		return sdf;
	}
	public void setSdf(SimpleDateFormat sdf) {
		this.sdf = sdf;
	}
	
	public Timestamp getBeginTime() {
		try {
			return new Timestamp(sdf.parse(beginTime).getTime());
		} catch (ParseException e) {
			return null;
		}
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public Timestamp getEndTime() {
		try {
			return new Timestamp(sdf.parse(endTime).getTime());
		} catch (ParseException e) {
			return null;
		}
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	
}
