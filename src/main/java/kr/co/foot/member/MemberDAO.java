package kr.co.foot.member;

import java.util.List;

import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.mymap.MymapVO;

public interface MemberDAO {

	List<MymapVO> selectMymapListByuserid(String userid);
	List<MymapVO> selectMymapListByuseridForPlan(String userid);
	List<FavoriteplaceVO> selectFavoriteMapByuserid(String userid);

}
