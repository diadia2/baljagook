package kr.co.foot.mymap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.favoritemap.FavoritemapVO;
import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.hashtag.HashtagVO;
import kr.co.foot.like.LikeVO;
import kr.co.foot.photo.PhotoVO;
import kr.co.foot.regcoordinates.RegcoordinatesVO;
import kr.co.foot.regmap.RegmapVO;

@Service
public class MymapServiceImp implements MymapService {
	
	@Autowired
	private MymapDAO mymapDAO;

	@Override
	public void regMyMap(MymapVO mymapVO) {
		
		mymapDAO.regMyMap(mymapVO);
		
	}

	@Override
	public int getIndex(String regdate) {
		
		int index = mymapDAO.getIndex(regdate);
		
		return index;
	}

	@Override
	public void insertLonLat(RegcoordinatesVO regcoordinatesVO) {
		
		mymapDAO.insertLonLat(regcoordinatesVO);
		
	}

	@Override
	public void insertRegMap(RegmapVO regmapVO) {
		
		mymapDAO.insertRegMap(regmapVO);
		
	}

	@Override
	public void insertHashtag(HashtagVO hashtagVO) {

		mymapDAO.insertHashtag(hashtagVO);
		
	}

	@Override
	public List<RegcoordinatesVO> getRegcoordinatesInfo(int mymapidx) {
		
		List<RegcoordinatesVO> regList = mymapDAO.getRegcoordinatesInfo(mymapidx);
		
		return regList;
	}

	@Override
	public void insertCheckpoint(CheckpointVO checkpointVO) {
		
		mymapDAO.insertCheckpoint(checkpointVO);
		
	}
	
	@Override
	public List<MymapVO> selectMymapList(String searchtext, int pageSize) {
		
		List<MymapVO> mymapList = mymapDAO.selectMymapList(searchtext, pageSize);
		
		return mymapList;
	}

	@Override
	public List<HashtagVO> getHashtagList(int idx) {
		
		List<HashtagVO> eachHashtagList = mymapDAO.getHashtagList(idx);
		
		return eachHashtagList;
	}

	@Override
	public RegmapVO getRegmapList(int idx) {
		
		RegmapVO getRegmap = mymapDAO.getRegmapList(idx);
		
		return getRegmap;
	}

	@Override
	public MymapVO selectMymap(int mymapidx) {
		
		MymapVO mymapvo = mymapDAO.selectMymap(mymapidx);
		
		return mymapvo;
	}

	@Override
	public List<RegcoordinatesVO> getRegmapsList(int mymapidx) {

		List<RegcoordinatesVO> regcoordinatesList = mymapDAO.getRegmapsList(mymapidx);
		
		return regcoordinatesList;
	}

	@Override
	public CheckpointVO selectCheckPoint(int idx) {
		
		CheckpointVO cpVO = mymapDAO.selectCheckPoint(idx);
		
		return cpVO;
	}

	@Override
	public void insertFavoritePlace(FavoriteplaceVO favoriteplaceVO) {
		
		mymapDAO.insertFavoritePlace(favoriteplaceVO);
		
	}

	@Override
	public List<FavoriteplaceVO> selectcheckpoint(String userid) {
		
		List<FavoriteplaceVO> compareCheckPointidx = mymapDAO.selectcheckpoint(userid);
		
		return compareCheckPointidx;
	}

	@Override
	public void insertFavoriteMap(FavoritemapVO favoritemapVO) {
		
		mymapDAO.insertFavoriteMap(favoritemapVO);
		
	}

	@Override
	public List<FavoritemapVO> selectRegmapidx(String userid) {
		
		List<FavoritemapVO> compareRegmapidx = mymapDAO.selectRegmapidx(userid);
		
		return compareRegmapidx;
	}

	@Override
	public CheckpointVO selectCheckPointByIdx(String checkpointidx) {

		CheckpointVO checkpointVO = mymapDAO.selectCheckPointByIdx(checkpointidx);
		
		return checkpointVO;
	}

	@Override
	public RegcoordinatesVO getRegcoordinatesInfoByIdx(int regcoordinatesidx) {

		RegcoordinatesVO regcoordinateVO = mymapDAO.getRegcoordinatesInfoByIdx(regcoordinatesidx);
		
		return regcoordinateVO;
	}

	@Override
	public MymapVO selectMymapByRegmapIdx(int regmapidx) {

		MymapVO mymapVO = mymapDAO.selectMymapByRegmapIdx(regmapidx);
			
		return mymapVO;
	}
	
	//�대�� 寃���臾쇱�� ���� like ��蹂� 異�異�
	@Override
	public List<String> getLikeCnt(int mymapidx) {
		
		List<String> userList = mymapDAO.getLikeCnt(mymapidx);
		
		return userList;
	}
	
	//�대�� 寃���臾쇱�� regmapidx ��蹂� 異�異�
	@Override
	public int getRegmapIdx(int mymapidx) {
		
		int regmapidx = mymapDAO.getRegmapIdx(mymapidx);
		
		return regmapidx;
	}
	
	//like�� ��蹂� ����
	@Override
	public void insertLikeInfo(LikeVO likeVO) {
		
		mymapDAO.insertLikeInfo(likeVO);
	}
	
	//like 痍⑥��
	@Override
	public void deleteLikeInfo(LikeVO likeVO) {
		
		mymapDAO.deleteLikeInfo(likeVO);
	}
	
	//議고�� �� 利�媛�
	public void increaseViewCnt(int mymapidx) {
		
		mymapDAO.increaseViewCnt(mymapidx);
	}

	@Override
	public List<MymapVO> selectMymapByuserid(String userid) {

		List<MymapVO> mymapListPlanAndReg = mymapDAO.selectMymapByuserid(userid);
		
		return mymapListPlanAndReg;
	}

	@Override
	public CheckpointVO selectCheckpointByCoorIdx(int coordinatesidx) {

		CheckpointVO checkpointVO = mymapDAO.selectCheckpointByCoorIdx(coordinatesidx);
		
		return checkpointVO;
	}

	@Override
	public PhotoVO selectPhoto(int checkpoinidx) {

		PhotoVO photoVO = mymapDAO.selectPhoto(checkpoinidx);
		
		return photoVO;
	}
	

}
