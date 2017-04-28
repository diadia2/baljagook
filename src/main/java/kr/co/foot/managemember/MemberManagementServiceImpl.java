package kr.co.foot.managemember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.foot.member.MemberVO;
import kr.co.foot.report.ReportVO;

@Service
public class MemberManagementServiceImpl implements MemberManagementService {

	@Autowired
	private MemberManagementDAO dao;
	
	public List<MemberVO> getRegularMemberList() {
		List<MemberVO> regularMemberList = dao.getRegularMemberList();
		return regularMemberList;
	}
	
	public List<MemberVO> getBlindedMemberList() {
		List<MemberVO> blindedMemberList = dao.getBlindedMemberList();
		return blindedMemberList;
	}	
	
	public List<MemberVO> getDeactivatedMemberList() {
		List<MemberVO> deactivatedMemberList = dao.getDeactivatedMemberList();
		return deactivatedMemberList;
	}
	public int getMyMapCntByUserid(String userid) {
		int myMapCnt = dao.getMyMapCntByUserid(userid);
		return myMapCnt;
	}
	
	public int getMyPlanCntByUserid(String userid) {
		int myPlanCnt = dao.getMyPlanCntByUserid(userid);
		return myPlanCnt;
	}
	
	public List<Integer> getReportCntByUserid(String userid) {
		List<Integer> reportCnt = dao.getReportCntByUserid(userid);
		return reportCnt;
	}
	
//	public List<ReportVO> getReportByUserid(String userid) {
//		List<ReportVO> reportList = dao.getReportByUserid(userid);
//		return reportList;
//	}
	
	public void updateMemberStatus(MemberVO memberVO) {
		dao.updateMemberStatus(memberVO);
	}
	
	public void deleteMember(String userid) {
		dao.deleteMember(userid);
	}	
}
