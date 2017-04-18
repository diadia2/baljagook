package kr.co.foot.reglogin;

import kr.co.foot.member.MemberVO;

public interface RegLoginService {

	public String findByEmailPass(LoginDTO loginData);
	public void registerNewMember(MemberVO member);
	public String findByEmail(String email);
	public String findByCode(String code);
	public void verifyEmail(String email);
	public String findByUserid(String userid);
	public void insertAutoLoginData(AutoLoginDTO autoLoginDTO);
	public String getEmailByToken(String token);
	public String getUseridByEmail(String email);
	public void deleteAutoLoginData(String token);
}
