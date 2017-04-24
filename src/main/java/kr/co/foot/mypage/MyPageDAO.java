package kr.co.foot.mypage;

import kr.co.foot.member.MemberVO;

public interface MyPageDAO {

	public void deactivateAccount(String userid);
	public void insertDeactivatedate(DeactivateDTO deactivateDTO);
	public void changePassword(MemberVO memberVO);
	public void insertImageName(MemberVO memberVO);
	public String getImageName(String userid);
	public MemberVO findByUserid(String userid);
	public MemberVO findByEmail(String Email);
	public String getEmailByUserid(String userid);
}
