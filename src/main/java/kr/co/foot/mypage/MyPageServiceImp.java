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
	
	public void insertDeactivatedate(DeactivateDTO deactivateDTO) {
		dao.insertDeactivatedate(deactivateDTO);
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

	public MemberVO findByEmail(String email) {
		MemberVO member = dao.findByEmail(email);
		return member;
	}
	
	public String getEmailByUserid(String userid) {
		String email = dao.getEmailByUserid(userid);
		return email;
	}
	
	public void deleteMyMap(int mymapidx) {
		dao.deleteMyMap(mymapidx);
		dao.deleteRegMap(mymapidx);
		dao.deleteHashTag(mymapidx);
		dao.deleteRegCoordinates(mymapidx);
		dao.deleteLike(mymapidx);
	}
	
	public void deleteMyPlan(int mymapidx) {
		dao.deleteMyPlan(mymapidx);
		dao.deleteMyPlanCoordinates(mymapidx);
	}
	
	public void deleteFavoriteMap(int idx) {
		dao.deleteFavoriteMap(idx);
	}
	
	public void deleteFavoritePlace(int idx) {
		dao.deleteFavoritePlace(idx);
	}
}
