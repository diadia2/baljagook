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
	public void deleteMyMap(int mymapidx);
	public void deleteRegMap(int mymapidx);
	public void deleteHashTag(int mymapidx);
	public void deleteRegCoordinates(int mymapidx);
	public void regMapDeleteFavoriteMap(int mymapidx);
	public void regMapDeleteFavoritePlace(int mymapidx);
	public void deleteMyPlan(int mymapidx);
	public void deleteMyPlanCoordinates(int mymapidx);
	public void deleteLike(int mymapidx);
	public void deleteReport(int mymapidx);
	public void deleteFavoriteMap(FavMapDTO favMapDTO);
	public void deleteFavoritePlace(FavPlaceDTO favPlaceDTO);
}
