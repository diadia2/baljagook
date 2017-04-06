package kr.co.foot.coordinates;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CoordinatesDAOImp implements CoordinatesDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setCoordinates(CoordinatesVO coordinatesVO) {
		sqlSessionTemplate.insert("kr.co.foot.coordinates.CoordinatesDAO.setCoordinates", coordinatesVO);
	}

	@Override
	public List<CoordinatesVO> getLonLat(String startTime, String endTime, String id) {
		
		TimeStampVO timestampVO = new TimeStampVO();
		timestampVO.setEndTime(endTime);
		timestampVO.setStartTime(startTime);
		timestampVO.setId(id);
		System.out.println(id);
		List<CoordinatesVO> list = sqlSessionTemplate.selectList("kr.co.foot.coordinates.CoordinatesDAO.getLonLat", timestampVO);
		
		return list;
	}

}
