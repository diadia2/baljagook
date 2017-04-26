package kr.co.foot.reportedmap;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.foot.mymap.MymapVO;
import kr.co.foot.report.ReportVO;

@Repository
public class ReportedMapDAOImpl implements ReportedMapDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<ReportVO> getReportList(int regmapidx) {
		List<ReportVO> reportList = sst.selectList("kr.co.foot.reportedmap.ReportedMapDAO.getReportListByRegmapidx", regmapidx);
		return reportList;
	}
	
	public List<ReportedMapDTO> getReportedMapDTOList() {
		List<ReportedMapDTO> reportedMapDTOList = sst.selectList("kr.co.foot.reportedmap.ReportedMapDAO.getReportedMapDTOList");
		return reportedMapDTOList;
	}
	
	public void blindRegmap(int regmapidx) {
		sst.update("kr.co.foot.reportedmap.ReportedMapDAO.blindRegmap", regmapidx);
	}
	
	public List<MymapVO> getBlindedMap() {
		List<MymapVO> blindedMap = sst.selectList("kr.co.foot.reportedmap.ReportedMapDAO.getBlindedMap");
		return blindedMap;
	}
	
	public void cancelBlindRegmap(int regmapidx) {
		sst.update("kr.co.foot.reportedmap.ReportedMapDAO.cancelBlindRegmap", regmapidx);
	}
}
