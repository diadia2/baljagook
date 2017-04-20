package kr.co.foot.follow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {
	
	@Autowired
	private FollowDAO followDAO;
	
	public void insertFollow(FollowVO followVO) {
		followDAO.insertFollow(followVO);
	}
	public int isFollowed(FollowVO followVO) {
		return followDAO.isFollowed(followVO);
	}

	public List<FollowVO> selectFollowed(FollowVO followVO) {
		return followDAO.selectFollowed(followVO);
	}
	
	public void deleteFollowed(int idx) {
		followDAO.deleteFollowed(idx);
	}
}
