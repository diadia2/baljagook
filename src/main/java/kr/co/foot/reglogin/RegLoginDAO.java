package kr.co.foot.reglogin;

import kr.co.foot.member.MemberVO;

public interface RegLoginDAO {

	public String findByEmailPass(LoginDTO loginData);
	public void registerNewMember(MemberVO member);
	public void insertMemberAuthority(String email);
	public String findByEmail(String email);
	public String findByUserid(String userid);
	public String findByCode(String code);
	public void verifyEmail(String email);
	public void insertAutoLoginData(AutoLoginDTO autoLoginDTO);
	public String getEmailByToken(String token);
	public String getUseridByEmail(String email);
	public void deleteAutoLoginData(String token);
}
