package kr.co.foot.mypage;

import kr.co.foot.member.MemberVO;

public interface MyPageService {
	
	public void deactivateAccount(String userid);
	public void insertDeactivatedate(DeactivateDTO deactivateDTO);
	public void changePassword(MemberVO memberVO);
	public void insertImageName(MemberVO memberVO);
	public String getImageName(String userid);
	public MemberVO findByUserid(String userid);
	public MemberVO findByEmail(String email);
	public String getEmailByUserid(String userid);
	public void deleteMyMap(int mymapidx);
	public void deleteMyPlan(int mymapidx);
	public void deleteFavoriteMap(FavMapDTO favMapDTO);
	public void deleteFavoritePlace(FavPlaceDTO favPlaceDTO);
}
