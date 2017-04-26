package kr.co.foot.reportedmap;

public class BlindedMapDTO {

	private int mymapidx;
	private int regmapidx;
	private String title;
	private String content;
	private String userid;
	private String regdate;
	private int count;
	public int getMymapidx() {
		return mymapidx;
	}
	public void setMymapidx(int mymapidx) {
		this.mymapidx = mymapidx;
	}
	public int getRegmapidx() {
		return regmapidx;
	}
	public void setRegmapidx(int regmapidx) {
		this.regmapidx = regmapidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BlindedMapDTO [mymapidx=" + mymapidx + ", regmapidx=" + regmapidx + ", title=" + title + ", content="
				+ content + ", userid=" + userid + ", regdate=" + regdate + ", count=" + count + "]";
	}
	
	
	
}
