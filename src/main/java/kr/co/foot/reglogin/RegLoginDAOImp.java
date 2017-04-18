package kr.co.foot.reglogin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.foot.member.MemberVO;

@Repository
public class RegLoginDAOImp implements RegLoginDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public String findByEmailPass(LoginDTO loginData) {
		String loginUserid = sst.selectOne("kr.co.foot.reglogin.RegLoginDAO.authenticateLogin", loginData);
		return loginUserid;		
	}
	
	public void registerNewMember(MemberVO member) {
		sst.insert("kr.co.foot.reglogin.RegLoginDAO.registerNewMember", member);
	}
	
	public void insertMemberAuthority(String email) {
		sst.insert("kr.co.foot.reglogin.RegLoginDAO.insertMemberAuthority", email);
	}
	
	public String findByEmail(String email) {
		String emailDB = sst.selectOne("kr.co.foot.reglogin.RegLoginDAO.findByEmail", email);
		return emailDB;
	}
	
	public String findByUserid(String userid) {
		String useridDB = sst.selectOne("kr.co.foot.reglogin.RegLoginDAO.findByUserid", userid);
		return useridDB;
	}
	
	public String findByCode(String code) {
		String email = sst.selectOne("kr.co.foot.reglogin.RegLoginDAO.findByCode", code);
		return email;
	}
	
	public void verifyEmail(String email) {
		sst.update("kr.co.foot.reglogin.RegLoginDAO.verifyEmail", email);
	}
	
	public void insertAutoLoginData(AutoLoginDTO autoLoginDTO) {
		sst.insert("kr.co.foot.reglogin.RegLoginDAO.insertAutoLoginEmail", autoLoginDTO);
	}
	
	public String getEmailByToken(String token) {
		String email = sst.selectOne("kr.co.foot.reglogin.RegLoginDAO.getEmailByToken", token);
		return email;
	}
	
	public String getUseridByEmail(String email) {
		String userid = sst.selectOne("kr.co.foot.reglogin.RegLoginDAO.getUseridByEmail", email);
		return userid;
	}
	
	public void deleteAutoLoginData(String token) {
		sst.delete("kr.co.foot.reglogin.RegLoginDAO.deleteAutoLoginData", token);
	}
}
