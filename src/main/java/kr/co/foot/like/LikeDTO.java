package kr.co.foot.like;

public class LikeDTO {
	
	private String userid;
	private int mymapidxRef;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMymapidxRef() {
		return mymapidxRef;
	}
	public void setMymapidxRef(int mymapidxRef) {
		this.mymapidxRef = mymapidxRef;
	}
	@Override
	public String toString() {
		return "LikeDTO [userid=" + userid + ", mymapidxRef=" + mymapidxRef + "]";
	}
}
