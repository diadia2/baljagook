package kr.co.foot.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.foot.board.vo.CommentVO;

@Repository
public class CommentDAOIMP implements CommentDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;//spring-mvc.xml Bean에서 설정

	@Override
	public List<CommentVO> list(int regmapidx) {
		List<CommentVO> list = sqlSessionTemplate.selectList("kr.co.foot.board.CommentDAO.selectComment", regmapidx);
		return list;
	}
	
	@Override
	public void insert(CommentVO commentVo) {
		sqlSessionTemplate.insert("kr.co.foot.board.CommentDAO.insertComment", commentVo);
		sqlSessionTemplate.insert("kr.co.foot.board.CommentDAO.insertGrp", 
				sqlSessionTemplate.selectOne("kr.co.foot.board.CommentDAO.selectIdx", commentVo.getUserid()));
	}

	@Override
	public void modify(CommentVO commentVo) {
		sqlSessionTemplate.update("kr.co.foot.board.CommentDAO.modifyComment", commentVo);
	}

	@Override
	public void delete(int idx) {
		sqlSessionTemplate.delete("kr.co.foot.board.CommentDAO.deleteComment", idx);
	}

	@Override
	public void reply(CommentVO commentVo) {
		CommentVO commentParent = sqlSessionTemplate.selectOne("kr.co.foot.board.CommentDAO.selectParentCmt", commentVo.getIdx());
		commentVo.setGrp(commentParent.getGrp());
		commentVo.setSeq(commentParent.getSeq());
		commentVo.setLvl(commentParent.getLvl());
		sqlSessionTemplate.update("kr.co.foot.board.CommentDAO.modifyParentCmt", commentParent);
		sqlSessionTemplate.insert("kr.co.foot.board.CommentDAO.replyComment", commentVo);
	}
	
	@Override
	public String getProfileImage(String userid) {
		String imageName = sqlSessionTemplate.selectOne("kr.co.foot.board.CommentDAO.getProfileImage", userid);
		return imageName;
	}
}
