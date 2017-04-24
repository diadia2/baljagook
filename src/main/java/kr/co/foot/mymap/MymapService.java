package kr.co.foot.mymap;

import java.util.List;
import java.util.Map;

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

public interface MymapService {

	public void regMyMap(MymapVO mymapVO);
	public int getIndex(String regdate);
	public void insertLonLat(RegcoordinatesVO regcoordinatesVO);
	public void insertRegMap(RegmapVO regmapVO);
	public void insertHashtag(HashtagVO hashtagVO);
	public List<RegcoordinatesVO> getRegcoordinatesInfo(int mymapidx);
	public void insertCheckpoint(CheckpointVO checkpointVO);
	public List<MymapVO> selectMymapList(String searchtext, int pageSize);
	public List<HashtagVO> getHashtagList(int idx);
	public RegmapVO getRegmapList(int idx);
	public MymapVO selectMymap(int mymapidx);
	public List<RegcoordinatesVO> getRegmapsList(int mymapidx);
	public CheckpointVO selectCheckPoint(int idx);
	public void insertFavoritePlace(FavoriteplaceVO favoriteplaceVO);
	public List<FavoriteplaceVO> selectcheckpoint(String userid);
	public void insertFavoriteMap(FavoritemapVO favoritemapVO);
	public List<FavoritemapVO> selectRegmapidx(String userid);
	public CheckpointVO selectCheckPointByIdx(String checkpointidx);
	public RegcoordinatesVO getRegcoordinatesInfoByIdx(int regcoordinatesidx);
	public MymapVO selectMymapByRegmapIdx(int regmapidx);
	public List<String> getLikeCnt(int mymapidx);
	public int getRegmapIdx(int mymapidx);
	public void insertLikeInfo(LikeVO likeVO);
	public void deleteLikeInfo(LikeVO likeVO);
	public void increaseViewCnt(int mymapidx);
	public List<MymapVO> selectMymapByuserid(String userid);
	public CheckpointVO selectCheckpointByCoorIdx(int idx);
	public PhotoVO selectPhoto(int idx);
	public void reportMap(ReportVO reportVO);
	public int getTotalMember();
	public int getTotalMap(int type);
	public List<MymapVO> getMymapListHighRank();
	public MemberVO getMemberInfo(String userid);
	public void insertAdvertisement(AdvertisementVO advertisementVO);
	public List<AdvertisementVO> selectAdvertisementList();
	public Integer selectMemberCount(Map<String, String> map);
	public int selectTotalAdv();

}
