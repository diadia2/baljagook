package kr.co.foot.coordinates;

public class CoordinatesVO {
	
	private int idk;
	private String lat;
	private String lon;
	private String email;
	private String timestamp;
	private String accuracy;

	public String getAccuracy() {
		return accuracy;
	}

	public void setAccuracy(String accuracy) {
		this.accuracy = accuracy;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public int getIdk() {
		return idk;
	}

	public void setidk(int idk) {
		this.idk = idk;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	@Override
	public String toString() {
		return "CoordinatesVO [idk=" + idk + ", lat=" + lat + ", lon=" + lon + ", email=" + email + ", timestamp="
				+ timestamp + ", accuracy=" + accuracy + ", toString()=" + super.toString() + "]";
	}

}
