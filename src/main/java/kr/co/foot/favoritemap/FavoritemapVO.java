package kr.co.foot.favoritemap;

public class FavoritemapVO {
	
	private int idx;
	private String userid;
	private int regmapidx;
	
	public FavoritemapVO(){
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getRegmapidx() {
		return regmapidx;
	}

	public void setRegmapidx(int regmapidx) {
		this.regmapidx = regmapidx;
	}

	@Override
	public String toString() {
		return "FavoritemapVO [idx=" + idx + ", userid=" + userid + ", regmapidx=" + regmapidx + ", toString()="
				+ super.toString() + "]";
	}
	
}
