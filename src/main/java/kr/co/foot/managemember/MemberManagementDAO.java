package kr.co.foot.managemember;

import java.util.List;

import kr.co.foot.member.MemberVO;

public interface MemberManagementDAO {
	
	public List<MemberVO> getRegularMemberList();
	public List<MemberVO> getBlindedMemberList();
	public List<MemberVO> getDeactivatedMemberList();
	public int getMyMapCntByUserid(String userid);
	public int getMyPlanCntByUserid(String userid);
	public List<Integer> getReportCntByUserid(String userid);
	public void updateMemberStatus(MemberVO memberVO);
	public void deleteMember(String userid);

}
