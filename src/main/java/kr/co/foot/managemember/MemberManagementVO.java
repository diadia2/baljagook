package kr.co.foot.managemember;

public class MemberManagementVO {

	private String email;
	private String userid;
	private String regdate;
	private String deactivatedate;
	private int myMapCnt;
	private int myPlanCnt;
	private int reportedMyMapCnt;
	private int status;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getDeactivatedate() {
		return deactivatedate;
	}
	public void setDeactivatedate(String deactivatedate) {
		this.deactivatedate = deactivatedate;
	}
	public int getMyMapCnt() {
		return myMapCnt;
	}
	public void setMyMapCnt(int myMapCnt) {
		this.myMapCnt = myMapCnt;
	}
	public int getMyPlanCnt() {
		return myPlanCnt;
	}
	public void setMyPlanCnt(int myPlanCnt) {
		this.myPlanCnt = myPlanCnt;
	}
	public int getReportedMyMapCnt() {
		return reportedMyMapCnt;
	}
	public void setReportedMyMapCnt(int reportedMyMapCnt) {
		this.reportedMyMapCnt = reportedMyMapCnt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MemberManagementVO [email=" + email + ", userid=" + userid + ", regdate=" + regdate
				+ ", deactivatedate=" + deactivatedate + ", myMapCnt=" + myMapCnt + ", myPlanCnt=" + myPlanCnt
				+ ", reportedMyMapCnt=" + reportedMyMapCnt + ", status=" + status + "]";
	}
	
}
