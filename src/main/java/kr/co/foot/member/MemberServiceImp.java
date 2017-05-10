package kr.co.foot.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.mymap.MymapVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List<MymapVO> selectMymapListByuserid(String userid) {

		List<MymapVO> mymapList = memberDAO.selectMymapListByuserid(userid); 
		
		return mymapList;
	}

	@Override
	public List<MymapVO> selectMymapListByuseridForPlan(String userid) {

		List<MymapVO> mymapList = memberDAO.selectMymapListByuseridForPlan(userid); 
		
		return mymapList;
	}

	@Override
	public List<FavoriteplaceVO> selectFavoriteMapByuserid(String userid) {

		List<FavoriteplaceVO> favoritemapList = memberDAO.selectFavoriteMapByuserid(userid);
		
		return favoritemapList;
	}

	@Override
	public List<MemberVO> getMemberList(String userid) {

		List<MemberVO> memberList = memberDAO.getMemberList(userid);
		
		return memberList;
	}
	
}
