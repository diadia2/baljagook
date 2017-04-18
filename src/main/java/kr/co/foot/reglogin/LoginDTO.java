package kr.co.foot.reglogin;

public class LoginDTO {

	private String email;
	private String password;
	private String autoLogin;
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
	public String getAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(String autoLogin) {
		this.autoLogin = autoLogin;
	}
	@Override
	public String toString() {
		return "LoginDTO [email=" + email + ", password=" + password + ", autoLogin=" + autoLogin + "]";
	}
	
}
