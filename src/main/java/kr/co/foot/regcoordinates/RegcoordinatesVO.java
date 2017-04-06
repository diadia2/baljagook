package kr.co.foot.regcoordinates;

public class RegcoordinatesVO {

	private int idx;
	private String lat;
	private String lon;
	private int mymapidx;
	
	public RegcoordinatesVO(){
		
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

	public int getMymapidx() {
		return mymapidx;
	}

	public void setMymapidx(int mymapidx) {
		this.mymapidx = mymapidx;
	}

	@Override
	public String toString() {
		return "RegcoordinatesVO [idx=" + idx + ", lat=" + lat + ", lon=" + lon + ", mymapidx=" + mymapidx
				+ ", toString()=" + super.toString() + "]";
	}
	
}
