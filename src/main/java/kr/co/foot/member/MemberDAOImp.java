package kr.co.foot.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.mymap.MymapVO;

@Repository
public class MemberDAOImp implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MymapVO> selectMymapListByuserid(String userid) {

		List<MymapVO> mymapList = sqlSessionTemplate.selectList("kr.co.foot.member.MemberDAO.selectMymapListByuserid", userid); 
		
		return mymapList;
	}

	@Override
	public List<MymapVO> selectMymapListByuseridForPlan(String userid) {

		List<MymapVO> mymapList = sqlSessionTemplate.selectList("kr.co.foot.member.MemberDAO.selectMymapListByuseridForPlan", userid); 
		
		return mymapList;
	}

	@Override
	public List<FavoriteplaceVO> selectFavoriteMapByuserid(String userid) {

		List<FavoriteplaceVO> favoritemapList = sqlSessionTemplate.selectList("kr.co.foot.member.MemberDAO.selectFavoriteMapByuserid", userid);
		
		return favoritemapList;
	}
	
}
