package kr.co.foot.coordinates;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CoordinatesServiceImp implements CoordinatesService {
	
	@Autowired
	private CoordinatesDAO coordinatesDAO;
	
	@Transactional
	public void setCoordinates(CoordinatesVO coordinatesVO) {
		coordinatesDAO.setCoordinates(coordinatesVO);
	}

	@Override
	public List<CoordinatesVO> getLonLat(String startTime, String endTime, String id) {
		
		List<CoordinatesVO> list = coordinatesDAO.getLonLat(startTime, endTime, id);
		
		return list;
	}
}
