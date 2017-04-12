package kr.co.foot.coordinates;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.photo.PhotoVO;

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

	@Override
	public void insertCheckpoint(CheckpointVO checkpoint) {

		coordinatesDAO.insertCheckpoint(checkpoint);
		
	}

	@Override
	public int selectidx(String timestamp) {

		int coordinatesidx = coordinatesDAO.selectidx(timestamp);
		
		return coordinatesidx;
	}

	@Override
	public int selectCheckpointidx(int coordinatesidx) {

		int checkpointidx = coordinatesDAO.selectCheckpointidx(coordinatesidx);
		
		return checkpointidx;
	}

	@Override
	public void insertPhoto(PhotoVO photo) {

		coordinatesDAO.insertPhoto(photo);
		
	}
}
