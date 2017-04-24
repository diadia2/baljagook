package kr.co.foot.managemember;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.foot.member.MemberVO;
import kr.co.foot.report.ReportVO;

@Repository
public class MemberManagementDAOImpl implements MemberManagementDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<MemberVO> getRegularMemberList() {
		List<MemberVO> regularMemberList = sst.selectList("kr.co.foot.managemember.MemberManagementDAO.getRegularMemberList");
		return regularMemberList;
	}
	
	public List<MemberVO> getBlindedMemberList() {
		List<MemberVO> blindedMemberList = sst.selectList("kr.co.foot.managemember.MemberManagementDAO.getBlindedMemberList");
		return blindedMemberList;
	}

	public List<MemberVO> getDeactivatedMemberList() {
		List<MemberVO> deactivatedMemberList = sst.selectList("kr.co.foot.managemember.MemberManagementDAO.getDeactivatedMemberList");
		return deactivatedMemberList;
	}
	
	public int getMyMapCntByUserid(String userid) {
		int myMapCnt = sst.selectOne("kr.co.foot.managemember.MemberManagementDAO.getMyMapCntByUserid", userid);
		return myMapCnt;
	}
	
	public int getMyPlanCntByUserid(String userid) {
		int myPlanCnt = sst.selectOne("kr.co.foot.managemember.MemberManagementDAO.getMyPlanCntByUserid", userid);
		return myPlanCnt;
	}
	
	public int getReportCntByUserid(String userid) {
		int reportCnt = sst.selectOne("kr.co.foot.managemember.MemberManagementDAO.getReportCntByUserid", userid);
		return reportCnt;
	}
	
//	public List<ReportVO> getReportByUserid(String userid) {
//		List<ReportVO> reportList = sst.selectList("kr.co.foot.managemember.MemberManagementDAO.getReportByUserid", userid);
//		return reportList;
//	}
	
	public void updateMemberStatus(MemberVO memberVO) {
		sst.update("kr.co.foot.managemember.MemberManagementDAO.updateMemberStatus", memberVO);
	}
	
	public void deleteMember(String userid) {
		sst.delete("kr.co.foot.managemember.MemberManagementDAO.deleteMember", userid);
	}
	
}
