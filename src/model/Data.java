package HealthAnalysisMng.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class Data implements Cloneable{
	
	public String data;
	public List<String> value;
	public String abnormal;
	public Date time;
	public Integer result;
	public Timestamp currentTime;
	

	@Override
	public String toString() {
		return "Data [data=" + data + ", value=" + value + ", abnormal="
				+ abnormal + ", time=" + time + "]";
	}



	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
