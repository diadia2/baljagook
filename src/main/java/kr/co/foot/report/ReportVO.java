package kr.co.foot.report;

public class ReportVO {

	private int idx;
	private String userid;
	private String reason;
	private String owner;
	private int regmapidx;
	private String regdate;
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public int getRegmapidx() {
		return regmapidx;
	}
	public void setRegmapidx(int regmapidx) {
		this.regmapidx = regmapidx;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReportVO [idx=" + idx + ", userid=" + userid + ", reason=" + reason + ", owner=" + owner
				+ ", regmapidx=" + regmapidx + ", regdate=" + regdate + "]";
	}
	
	
}
