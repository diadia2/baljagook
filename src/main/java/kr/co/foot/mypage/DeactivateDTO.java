package kr.co.foot.mypage;

public class DeactivateDTO {

	private String userid;
	private String deactivatedate;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getDeactivatedate() {
		return deactivatedate;
	}
	public void setDeactivatedate(String deactivatedate) {
		this.deactivatedate = deactivatedate;
	}
	@Override
	public String toString() {
		return "DeactivateDTO [userid=" + userid + ", deactivatedate=" + deactivatedate + "]";
	}
	
	
}
