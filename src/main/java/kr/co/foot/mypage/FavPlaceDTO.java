package kr.co.foot.mypage;

public class FavPlaceDTO {

	private String userid;
	private int checkpointidx;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCheckpointidx() {
		return checkpointidx;
	}
	public void setCheckpointidx(int checkpointidx) {
		this.checkpointidx = checkpointidx;
	}
	@Override
	public String toString() {
		return "FavPlaceDTO [userid=" + userid + ", checkpointidx=" + checkpointidx + "]";
	}
	
	
}
