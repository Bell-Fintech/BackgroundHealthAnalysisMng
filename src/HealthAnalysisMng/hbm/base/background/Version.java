package HealthAnalysisMng.hbm.base.background;

import java.io.Serializable;

public class Version implements Serializable{
	
	private String id;
	private String appName;
	private String apkName;
	private String appTag;
	private String channel;
	private String version;
	private String downloadURL;
	private String description;
	private String available;
	
	public Version() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getApkName() {
		return apkName;
	}

	public void setApkName(String apkName) {
		this.apkName = apkName;
	}

	public String getAppTag() {
		return appTag;
	}

	public void setAppTag(String appTag) {
		this.appTag = appTag;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getDownloadURL() {
		return downloadURL;
	}

	public void setDownloadURL(String downloadURL) {
		this.downloadURL = downloadURL;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	@Override
	public String toString() {
		return "Version [id=" + id + ", appName=" + appName + ", apkName="
				+ apkName + ", appTag=" + appTag + ", channel=" + channel
				+ ", version=" + version + ", downloadURL=" + downloadURL
				+ ", description=" + description + ", available=" + available
				+ "]";
	}
	
}
