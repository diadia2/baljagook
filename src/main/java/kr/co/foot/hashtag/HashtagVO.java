package kr.co.foot.hashtag;

public class HashtagVO {

	private int idx;
	private String name;
	private int mymapidx;
	
	public HashtagVO(){
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMymapidx() {
		return mymapidx;
	}

	public void setMymapidx(int mymapidx) {
		this.mymapidx = mymapidx;
	}

	@Override
	public String toString() {
		return "HashtagVO [idx=" + idx + ", name=" + name + ", mymapidx=" + mymapidx + ", toString()="
				+ super.toString() + "]";
	}
	
}
