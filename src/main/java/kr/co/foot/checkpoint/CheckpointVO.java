package kr.co.foot.checkpoint;

public class CheckpointVO {
	
	private int idx;
	private int coordinatesidx;
	private int regcoordinatesidx;
	private String content;
	private String title;
	
	public CheckpointVO(){
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCoordinatesidx() {
		return coordinatesidx;
	}

	public void setCoordinatesidx(int coordinatesidx) {
		this.coordinatesidx = coordinatesidx;
	}

	public int getRegcoordinatesidx() {
		return regcoordinatesidx;
	}

	public void setRegcoordinatesidx(int regcoordinatesidx) {
		this.regcoordinatesidx = regcoordinatesidx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "CheckpointVO [idx=" + idx + ", coordinatesidx=" + coordinatesidx + ", regcoordinatesidx="
				+ regcoordinatesidx + ", content=" + content + ", title=" + title + ", toString()=" + super.toString()
				+ "]";
	}
	
}
