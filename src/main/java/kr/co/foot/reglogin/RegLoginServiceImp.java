package kr.co.foot.reglogin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.foot.member.MemberVO;

@Service
public class RegLoginServiceImp implements RegLoginService {

	@Autowired
	private RegLoginDAO dao;
	
	public String findByEmailPass(LoginDTO loginData) {
		String loginUserid = dao.findByEmailPass(loginData);
		return loginUserid;
	}
	
	public void registerNewMember(MemberVO member) {
		dao.registerNewMember(member);
		dao.insertMemberAuthority(member.getEmail());
	}
	
	public String findByEmail(String email) {
		String emailDB = dao.findByEmail(email);
		return emailDB;
	}
	
	public String findByUserid(String userid) {
		String useridDB = dao.findByUserid(userid);
		return useridDB;
	}
	
	public String findByCode(String code) {
		String email = dao.findByCode(code);
		return email;
	}
	
	public void verifyEmail(String email) {
		dao.verifyEmail(email);
	}
}
