package kr.co.foot.photo;

public class PhotoVO {

	private int idx;
	private int checkpointidx;
	private String oriname;
	private String newname;
	
	public PhotoVO(){
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCheckpointidx() {
		return checkpointidx;
	}

	public void setCheckpointidx(int checkpointidx) {
		this.checkpointidx = checkpointidx;
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
		return "PhotoVO [idx=" + idx + ", checkpointidx=" + checkpointidx + ", oriname=" + oriname + ", newname="
				+ newname + ", toString()=" + super.toString() + "]";
	}
	
}
