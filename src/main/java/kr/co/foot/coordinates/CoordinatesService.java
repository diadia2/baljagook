package kr.co.foot.coordinates;

import java.util.List;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.photo.PhotoVO;

public interface CoordinatesService {
	
	public void setCoordinates(CoordinatesVO coordinatesVO);
	public List<CoordinatesVO> getLonLat(String startTime, String endTime, String id);
	public void insertCheckpoint(CheckpointVO checkpoint);
	public int selectidx(String string);
	public int selectCheckpointidx(int coordinatesidx);
	public void insertPhoto(PhotoVO photo);
}
