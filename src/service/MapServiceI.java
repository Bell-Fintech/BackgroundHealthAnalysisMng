package HealthAnalysisMng.service;

import java.sql.Timestamp;
import java.util.List;

import HealthAnalysisMng.hbm.base.TrackAction;

public interface MapServiceI extends BaseServiceI{
	
	public void saveTrack(TrackAction ta);
	public List<TrackAction> findByTime(String userId,Timestamp beginTime,Timestamp endTime);
	public boolean delete(Object obj,String dataId);

}
