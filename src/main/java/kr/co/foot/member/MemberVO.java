package kr.co.foot.member;

public class MemberVO {

	private String email;
	private String password;
	private String userid;
	private int status;
	private String regdate;
	private String photo;
	
	public MemberVO(){
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "memberVO [email=" + email + ", password=" + password + ", userid=" + userid + ", status=" + status
				+ ", regdate=" + regdate + ", photo=" + photo + ", toString()=" + super.toString() + "]";
	}
	
}
