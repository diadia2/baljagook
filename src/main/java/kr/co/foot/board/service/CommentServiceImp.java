package kr.co.foot.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.foot.board.dao.CommentDAO;
import kr.co.foot.board.vo.CommentVO;

@Service
public class CommentServiceImp implements CommentService{

	@Autowired
	private CommentDAO dao;
	
	@Override
	public List<CommentVO> list(int regmapidx) {
		return dao.list(regmapidx);
	}
	
	@Override
	public void insert(CommentVO commentVo) {
		dao.insert(commentVo);
	}

	@Override
	public void modify(CommentVO commentVo) {
		dao.modify(commentVo);
	}

	@Override
	public void delete(int idx) {
		dao.delete(idx);
	}

	@Override
	public void reply(CommentVO commentVo) {
		dao.reply(commentVo);
	}
	
	@Override
	public String getProfileImage(String userid) {
		String imageName = dao.getProfileImage(userid);
		return imageName;
	}
	
}
