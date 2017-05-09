package kr.co.foot.mypage;

public class FavMapDTO {

	private String userid;
	private int mymapidx;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMymapidx() {
		return mymapidx;
	}
	public void setMymapidx(int mymapidx) {
		this.mymapidx = mymapidx;
	}
	@Override
	public String toString() {
		return "FavMapDTO [userid=" + userid + ", mymapidx=" + mymapidx + "]";
	}
	
	
}
