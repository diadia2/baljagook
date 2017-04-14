package kr.co.foot.mypage;

import kr.co.foot.member.MemberVO;

public interface MyPageService {
	
	public void deactivateAccount(String userid);
	public void changePassword(MemberVO memberVO);
	public void insertImageName(MemberVO memberVO);
	public String getImageName(String userid);
	public MemberVO findByUserid(String userid);
	public String getEmailByUserid(String userid);

}
