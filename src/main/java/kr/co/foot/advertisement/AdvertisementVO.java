package kr.co.foot.advertisement;

public class AdvertisementVO {

	private int idx;
	private String lat;
	private String lon;
	private String name;
	private String detail;
	private String oriname;
	private String newname;
	
	public AdvertisementVO(){
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getOriname() {
		return oriname;
	}

	public void setOriname(String oriname) {
		this.oriname = oriname;
	}

	public String getNewname() {
		return newname;
	}

	public void setNewname(String newname) {
		this.newname = newname;
	}

	@Override
	public String toString() {
		return "AdvertisementVO [idx=" + idx + ", lat=" + lat + ", lon=" + lon + ", name=" + name + ", detail=" + detail
				+ ", oriname=" + oriname + ", newname=" + newname + ", toString()=" + super.toString() + "]";
	}
	
}
