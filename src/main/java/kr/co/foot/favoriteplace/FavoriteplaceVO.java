package kr.co.foot.favoriteplace;

public class FavoriteplaceVO {
	
	private int idx;
	private String userid;
	private int checkpointidx;
	private String placename;
	
	public FavoriteplaceVO(){
		
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

	public int getCheckpointidx() {
		return checkpointidx;
	}

	public void setCheckpointidx(int checkpointidx) {
		this.checkpointidx = checkpointidx;
	}

	public String getPlacename() {
		return placename;
	}

	public void setPlacename(String placename) {
		this.placename = placename;
	}

	@Override
	public String toString() {
		return "FavoriteplaceVO [idx=" + idx + ", userid=" + userid + ", checkpointidx=" + checkpointidx
				+ ", placename=" + placename + ", toString()=" + super.toString() + "]";
	}
	
}
