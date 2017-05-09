package kr.co.foot.mymap;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.foot.advertisement.AdvertisementVO;
import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.favoritemap.FavoritemapVO;
import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.hashtag.HashtagVO;
import kr.co.foot.like.LikeVO;
import kr.co.foot.member.MemberVO;
import kr.co.foot.photo.PhotoVO;
import kr.co.foot.regcoordinates.RegcoordinatesVO;
import kr.co.foot.regmap.RegmapVO;
import kr.co.foot.report.ReportVO;

@Repository
public class MymapDAOImp implements MymapDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void regMyMap(MymapVO mymapVO) {
		
		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.regMymap", mymapVO);
		
	}

	@Override
	public int getIndex(String regdate) {
		
		int index = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.getIndex", regdate);
		
		return index;
	}

	@Override
	public void insertLonLat(RegcoordinatesVO regcoordinatesVO) {
		
		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.insertLonLat", regcoordinatesVO);
		
	}

	@Override
	public void insertRegMap(RegmapVO regmapVO) {

		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.insertRegMap", regmapVO);
		
	}

	@Override
	public void insertHashtag(HashtagVO hashtagVO) {

		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.insertHashtag", hashtagVO);
		
	}

	@Override
	public List<RegcoordinatesVO> getRegcoordinatesInfo(int mymapidx) {

		List<RegcoordinatesVO> regList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectRegcoordinatesInfo", mymapidx);
		
		return regList;
	}

	@Override
	public void insertCheckpoint(CheckpointVO checkpointVO) {

		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.insertCheckpoint", checkpointVO);
		
	}

	@Override /*��蹂닿린 ���댁� ������*/
	public List<MymapVO> selectMymapList(String searchtext, int pageSize) {
		int start = pageSize-8;
		System.out.println(pageSize+"페이지사이즈"+start);
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("start", start);
		search.put("pageSize", 8);//8개씩 보여준다
		search.put("searchtext", searchtext);
		
		List<MymapVO> mymapList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectMymapList", search);
		return mymapList;
	}
	@Override /*��蹂닿린 ���댁� ������*/
	public List<MymapVO> selectMymapList2(String searchtext, int pageSize) {
		int start = pageSize-8;
		System.out.println(pageSize+"페이지사이즈"+start);
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("start", start);
		search.put("pageSize", 8);//8개씩 보여준다
		search.put("searchtext", searchtext);
		
		List<MymapVO> mymapList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectMymapList2", search);
		return mymapList;
	}

	@Override
	public List<HashtagVO> getHashtagList(int idx) {
		
		List<HashtagVO> eachHashtagList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.getHashtagList", idx);
		
		return eachHashtagList;
	}

	@Override
	public RegmapVO getRegmapList(int idx) {
		
		RegmapVO getRegmap = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.getRegmapList", idx);
		
		return getRegmap;
	}

	@Override
	public MymapVO selectMymap(int mymapidx) {
		
		MymapVO mymapvo = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.selectMymap", mymapidx);
		
		return mymapvo;
	}

	@Override
	public List<RegcoordinatesVO> getRegmapsList(int mymapidx) {

		List<RegcoordinatesVO> regcoordinatesList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.getRegmapsList", mymapidx);
		
		return regcoordinatesList;
	}

	@Override
	public CheckpointVO selectCheckPoint(int idx) {
		
		CheckpointVO cpVO = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.selectCheckPoint", idx);
		
		return cpVO;
	}

	@Override
	public void insertFavoritePlace(FavoriteplaceVO favoriteplaceVO) {
		
		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.insertFavoritePlace", favoriteplaceVO);		
	}

	@Override
	public List<FavoriteplaceVO> selectcheckpoint(String userid) {
		
		List<FavoriteplaceVO> compareCheckPointidx = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectcheckpoint", userid);
		
		return compareCheckPointidx;
	}

	@Override
	public void insertFavoriteMap(FavoritemapVO favoritemapVO) {

		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.insertFavoriteMap", favoritemapVO);
		
	}

	@Override
	public List<FavoritemapVO> selectRegmapidx(String userid) {
		
		List<FavoritemapVO> compareRegmapidx = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectRegmapidx", userid);
		
		return compareRegmapidx;
	}

	@Override
	public CheckpointVO selectCheckPointByIdx(String s) {
		
		int checkpointidx = Integer.parseInt(s);
		CheckpointVO checkpointVO = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.selectCheckPointByIdx", checkpointidx);
		
		return checkpointVO;
	}

	@Override
	public RegcoordinatesVO getRegcoordinatesInfoByIdx(int regcoordinatesidx) {

		RegcoordinatesVO regcoordinatesVO = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.getRegcoordinatesInfoByIdx", regcoordinatesidx);
		
		return regcoordinatesVO;
	}

	@Override
	public MymapVO selectMymapByRegmapIdx(int regmapidx) {

		MymapVO mymapVO = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.selectMymapByRegmapIdx", regmapidx);
		
		return mymapVO;
	}
	
	@Override
	public List<String> getLikeCnt(int mymapidx) {
		
		List<String> userList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.getLikeCnt", mymapidx);
		
		return userList;
	}
	
	@Override
	public int getRegmapIdx(int mymapidx) {
		
		int regmapidx = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.getRegmapIdx", mymapidx);
		
		return regmapidx;
	}
	
	
	@Override
	public void insertLikeInfo(LikeVO likeVO) {
		
		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.insertLikeInfo", likeVO);
		
	}
	
	@Override
	public void deleteLikeInfo(LikeVO likeVO) {
		
		sqlSessionTemplate.delete("kr.co.foot.mymap.MymapDAO.deleteLikeInfo", likeVO);
	}
	
	@Override
	public void increaseViewCnt(int mymapidx) {
		
		sqlSessionTemplate.update("kr.co.foot.mymap.MymapDAO.increaseViewCnt", mymapidx);
	}

	@Override
	public List<MymapVO> selectMymapByuserid(String userid) {

		List<MymapVO> mymapListPlanAndReg = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectMymapByuserid", userid);
		
		return mymapListPlanAndReg;
	}

	@Override
	public CheckpointVO selectCheckpointByCoorIdx(int coordinatesidx) {

		CheckpointVO checkpointVO = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.selectCheckpointByCoorIdx", coordinatesidx);
		
		return checkpointVO;
	}

	@Override
	public PhotoVO selectPhoto(int checkpoinidx) {

		PhotoVO photoVO = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.selectPhoto", checkpoinidx);
		
		return photoVO;
	}

	@Override
	public int getTotalMember() {

		int totalmember = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.getTotalMember");
		
		return totalmember;
	}

	@Override
	public int getTotalMap(int type) {

		int totalmap = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.getTotalMap", type);
		
		return totalmap;
	}

	@Override
	public List<MymapVO> getMymapListHighRank() {

		List<MymapVO> mymapList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.getMymapListHighRank");
		
		return mymapList;
	}

	@Override
	public MemberVO getMemberInfo(String userid) {
		
		MemberVO memberVO = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.getMemberInfo", userid);
		
		return memberVO;
	}

	@Override
	public void insertAdvertisement(AdvertisementVO advertisementVO) {

		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.insertAdvertisement", advertisementVO);
		
	}

	@Override
	public List<AdvertisementVO> selectAdvertisementList() {

		List<AdvertisementVO> AdvertisementList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectAdvertisementList");
		
		return AdvertisementList;
	}

	@Override
	public int selectMemberCount(Map<String, String> map) {

		int count = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.selectMemberCount",map);
		
		return count;
	}

	@Override
	public int selectTotalAdv() {

		int totalAdv = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.selectTotalAdv");
		
		return totalAdv;
	}
	
	@Override
	public void reportMap(ReportVO reportVO) {
		sqlSessionTemplate.insert("kr.co.foot.mymap.MymapDAO.reportMap", reportVO);
	}

	@Override
	public void updateDetail(AdvertisementVO advertisementVO) {

		sqlSessionTemplate.update("kr.co.foot.mymap.MymapDAO.updateDetail",advertisementVO);
		
	}

	@Override
	public void deleteAdv(int index) {

		sqlSessionTemplate.delete("kr.co.foot.mymap.MymapDAO.deleteAdv",index);
		
	}

	@Override
	public int todayCoordinatesCount(String regdate) {

		int todayCoordinatesCount = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.todayCoordinatesCount",regdate);
		
		return todayCoordinatesCount;
	}

	@Override
	public int weekAgoCoordinateCount(String weekAgo) {

		int weekAgoCoordinatesCount = sqlSessionTemplate.selectOne("kr.co.foot.mymap.MymapDAO.weekAgoCoordinateCount",weekAgo);
		
		return weekAgoCoordinatesCount;
	}

	@Override
	public void deleteSpots(String weekAgo) {

		sqlSessionTemplate.delete("kr.co.foot.mymap.MymapDAO.deleteSpots",weekAgo);
		
	}
	
	@Override
	public void updatePhoto(PhotoVO photoVO) {
		sqlSessionTemplate.update("kr.co.foot.mymap.MymapDAO.updatePhoto", photoVO);
	}

	@Override
	public List<RegmapVO> selectRegmapInfo() {

		List<RegmapVO> regmapList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectRegmapInfo");
		
		return regmapList;
	}

	@Override
	public List<MymapVO> selectMymapList3(String searchtext, int pageSize) {
		int start = pageSize-8;
		System.out.println(pageSize+"페이지사이즈"+start);
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("start", start);
		search.put("pageSize", 8);//8개씩 보여준다
		search.put("searchtext", searchtext);
		
		List<MymapVO> mymapList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectMymapList3", search);
		return mymapList;
	}
	
}
