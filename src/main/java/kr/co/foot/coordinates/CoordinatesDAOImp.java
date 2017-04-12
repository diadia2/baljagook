package kr.co.foot.coordinates;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.photo.PhotoVO;

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

	@Override
	public void insertCheckpoint(CheckpointVO checkpoint) {

		sqlSessionTemplate.insert("kr.co.foot.coordinates.CoordinatesDAO.insertCheckpoint",checkpoint);
		
	}

	@Override
	public int selectidx(String timestamp) {

		int coordinatesidx = sqlSessionTemplate.selectOne("kr.co.foot.coordinates.CoordinatesDAO.selectidx", timestamp);
		
		return coordinatesidx;
	}

	@Override
	public int selectCheckpointidx(int coordinatesidx) {

		int checkpointidx = sqlSessionTemplate.selectOne("kr.co.foot.coordinates.CoordinatesDAO.selectCheckpointidx", coordinatesidx);
		
		return checkpointidx;
	}

	@Override
	public void insertPhoto(PhotoVO photo) {

		sqlSessionTemplate.insert("kr.co.foot.coordinates.CoordinatesDAO.insertPhoto", photo);
		
	}

}
