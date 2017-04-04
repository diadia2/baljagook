package kr.co.foot.board.vo;

public class CommentVO {
	private int idx;
	private String content;
	private String regdate;
	private String userid;
	private int regmapidx;
	private int grp;
	private int seq;
	private int lvl;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getRegmapidx() {
		return regmapidx;
	}

	public void setRegmapidx(int regmapidx) {
		this.regmapidx = regmapidx;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	@Override
	public String toString() {
		return "CommentVO [idx=" + idx + ", content=" + content + ", regdate=" + regdate + ", userid=" + userid
				+ ", regmapidx=" + regmapidx + ", grp=" + grp + ", seq=" + seq + ", lvl=" + lvl + ", getIdx()="
				+ getIdx() + ", getContent()=" + getContent() + ", getRegdate()=" + getRegdate() + ", getUserid()="
				+ getUserid() + ", getRegmapidx()=" + getRegmapidx() + ", getGrp()=" + getGrp() + ", getSeq()="
				+ getSeq() + ", getLvl()=" + getLvl() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

}
