package kr.co.foot.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.foot.member.MemberVO;

@Service
public class MyPageServiceImp implements MyPageService {

	@Autowired
	private MyPageDAO dao;
	
	public void deactivateAccount(String userid) {
		dao.deactivateAccount(userid);
	}
	
	public void changePassword(MemberVO memberVO) {
		dao.changePassword(memberVO);
	}
	
	public void insertImageName(MemberVO memberVO) {
		dao.insertImageName(memberVO);
	}
	
	public String getImageName(String userid) {
		String imageName = dao.getImageName(userid);
		return imageName;
	}
	
	public MemberVO findByUserid(String userid) {
		MemberVO member = dao.findByUserid(userid);
		return member;
	}
	
	public String getEmailByUserid(String userid) {
		String email = dao.getEmailByUserid(userid);
		return email;
	}
}
