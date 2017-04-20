package kr.co.foot.message;

public class MessageVO {
	private int idx;
	private String fromId;
	private String toId;
	private String contents;
	private String regdate;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getfromId() {
		return fromId;
	}

	public void setfromId(String fromId) {
		this.fromId = fromId;
	}

	public String gettoId() {
		return toId;
	}

	public void settoId(String toId) {
		this.toId = toId;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Message [idx=" + idx + ", fromId=" + fromId + ", toId=" + toId + ", contents="
				+ contents + ", regdate=" + regdate + "]";
	}

}