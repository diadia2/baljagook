package kr.co.foot.regmap;

public class RegmapVO {
	
	private int idx;
	private String sdate;
	private String edate;
	private int viewcnt;
	private int blind;
	private int city;
	private int theme;
	private int mymapidx;
	
	public RegmapVO(){
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getBlind() {
		return blind;
	}

	public void setBlind(int blind) {
		this.blind = blind;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}

	public int getTheme() {
		return theme;
	}

	public void setTheme(int theme) {
		this.theme = theme;
	}

	public int getMymapidx() {
		return mymapidx;
	}

	public void setMymapidx(int mymapidx) {
		this.mymapidx = mymapidx;
	}

	@Override
	public String toString() {
		return "RegmapVO [idx=" + idx + ", sdate=" + sdate + ", edate=" + edate + ", viewcnt=" + viewcnt + ", blind=" + blind
				+ ", city=" + city + ", theme=" + theme + ", mymapidx=" + mymapidx + ", toString()=" + super.toString()
				+ "]";
	}

}
