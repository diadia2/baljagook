package kr.co.foot.board.vo;

public class MymapVO {
	private int idx;
	private String title;
	private String content;
	private String userid;
	private String regdate;
	private int type;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "MymapVO [idx=" + idx + ", title=" + title + ", content=" + content + ", userid=" + userid + ", regdate="
				+ regdate + ", type=" + type + "]";
	}

}
