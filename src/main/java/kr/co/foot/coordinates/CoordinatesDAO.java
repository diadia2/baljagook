package kr.co.foot.coordinates;

import java.util.List;

public interface CoordinatesDAO {
	
	public void setCoordinates(CoordinatesVO coordinatesVO);

	public List<CoordinatesVO> getLonLat(String startTime, String endTime, String id);

}
