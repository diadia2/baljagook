package kr.co.foot.mypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.foot.member.MemberVO;

@Repository
public class MyPageDAOImp implements MyPageDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public void deactivateAccount(String userid) {
		sst.update("kr.co.foot.mypage.MyPageDAO.deactivateAccount", userid);
	}
	
	public void insertDeactivatedate(DeactivateDTO deactivateDTO) {
		sst.update("kr.co.foot.mypage.MyPageDAO.insertDeactivatedate", deactivateDTO);
	}

	public void changePassword(MemberVO memberVO) {
		sst.update("kr.co.foot.mypage.MyPageDAO.changePassword", memberVO);
	}

	public void insertImageName(MemberVO memberVO) {	
		sst.update("kr.co.foot.mypage.MyPageDAO.insertImageName", memberVO); 
	}

	public String getImageName(String userid) {
		String imageName = sst.selectOne("kr.co.foot.mypage.MyPageDAO.getImageName", userid);
		return imageName;
	}
	
	public MemberVO findByUserid(String userid) {
		MemberVO member = sst.selectOne("kr.co.foot.mypage.MyPageDAO.findByUserid", userid);
		return member;
	}

	public MemberVO findByEmail(String email) {
		MemberVO member = sst.selectOne("kr.co.foot.mypage.MyPageDAO.findByEmail", email);
		return member;
	}	
	
	public String getEmailByUserid(String userid) {
		String email = sst.selectOne("kr.co.foot.mypage.MyPageDAO.getEmailByUserid", userid);
		return email;
	}

	public void deleteMyMap(int mymapidx) {
		sst.delete("kr.co.foot.mypage.MyPageDAO.deleteMyMap", mymapidx);
	}
	
	public void deleteRegMap(int mymapidx) {
		sst.delete("kr.co.foot.mypage.MyPageDAO.deleteRegMap", mymapidx);
	}
	
	public void deleteHashTag(int mymapidx) {
		sst.delete("kr.co.foot.mypage.MyPageDAO.deleteHashTag", mymapidx);
	}
	
	public void deleteRegCoordinates(int mymapidx) {
		sst.delete("kr.co.foot.mypage.MyPageDAO.deleteRegCoordinates", mymapidx);
	}
	
	public void deleteMyPlan(int mymapidx) {
		sst.delete("kr.co.foot.mypage.MyPageDAO.deleteMyPlan", mymapidx);
	}
	
	public void deleteMyPlanCoordinates(int mymapidx) {
		sst.delete("kr.co.foot.mypage.MyPageDAO.deleteMyPlanCoordinates", mymapidx);
	}
	
	public void deleteFavoriteMap(int idx) {
		sst.delete("kr.co.foot.mypage.MyPageDAO.deleteFavoriteMap", idx);
	}
	
	public void deleteFavoritePlace(int idx) {
		sst.delete("kr.co.foot.mypage.MyPageDAO.deleteFavoritePlace", idx);
	}
	
}
