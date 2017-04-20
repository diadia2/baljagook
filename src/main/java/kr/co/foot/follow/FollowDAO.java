package kr.co.foot.follow;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertFollow(FollowVO followVO) {
		sqlSessionTemplate.insert("kr.co.foot.follow.insertFollow" ,followVO);
	}
	
	public int isFollowed(FollowVO followVO) {
		return sqlSessionTemplate.selectOne("kr.co.foot.follow.isFollowed" ,followVO);
	}
	
	public List<FollowVO> selectFollowed(FollowVO followVO) {
		List<FollowVO> list = sqlSessionTemplate.selectList("kr.co.foot.follow.selectFollowed" ,followVO);
		return list;
	}
	
	public void deleteFollowed(int idx) {
		sqlSessionTemplate.delete("kr.co.foot.follow.deleteFollowed" ,idx);
	}
}
