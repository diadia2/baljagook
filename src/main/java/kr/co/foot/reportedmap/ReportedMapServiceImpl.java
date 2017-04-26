package kr.co.foot.reportedmap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.foot.mymap.MymapVO;
import kr.co.foot.report.ReportVO;

@Service
public class ReportedMapServiceImpl implements ReportedMapService {

	@Autowired
	private ReportedMapDAO dao;
	
	public List<ReportVO> getReportList(int regmapidx) {
		List<ReportVO> reportList = dao.getReportList(regmapidx);
		return reportList;
	}
	
	public List<ReportedMapDTO> getReportedMapDTOList() {
		List<ReportedMapDTO> reportedMapDTOList = dao.getReportedMapDTOList();
		return reportedMapDTOList;
	}
	
	public void blindRegmap(int regmapidx) {
		dao.blindRegmap(regmapidx);
	}
	
	public List<MymapVO> getBlindedMap() {
		List<MymapVO> blindedMap = dao.getBlindedMap();
		return blindedMap;
	}
	
	public void cancelBlindRegmap(int regmapidx) {
		dao.cancelBlindRegmap(regmapidx);
	}

}
