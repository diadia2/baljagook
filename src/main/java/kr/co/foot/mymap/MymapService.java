package kr.co.foot.mymap;

import java.util.List;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.favoritemap.FavoritemapVO;
import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.hashtag.HashtagVO;
import kr.co.foot.like.LikeVO;
import kr.co.foot.regcoordinates.RegcoordinatesVO;
import kr.co.foot.regmap.RegmapVO;

public interface MymapService {

	public void regMyMap(MymapVO mymapVO);
	public int getIndex(String regdate);
	public void insertLonLat(RegcoordinatesVO regcoordinatesVO);
	public void insertRegMap(RegmapVO regmapVO);
	public void insertHashtag(HashtagVO hashtagVO);
	public List<RegcoordinatesVO> getRegcoordinatesInfo(int mymapidx);
	public void insertCheckpoint(CheckpointVO checkpointVO);
	public List<MymapVO> selectMymapList(String searchtext);
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
	public List<String> getLikeCnt(int idx);
	public int getRegmapIdx(int mymapidx);
	public void insertLikeInfo(LikeVO likeVO);

}
