package kr.co.foot.reportedmap;

import java.util.List;

import kr.co.foot.mymap.MymapVO;
import kr.co.foot.report.ReportVO;

public interface ReportedMapDAO {

	public List<ReportVO> getReportList(int regmapidx);
	public List<ReportedMapDTO> getReportedMapDTOList();
	public void blindRegmap(int regmapidx);
	public List<MymapVO> getBlindedMap();
	public void cancelBlindRegmap(int regmapidx);
}
