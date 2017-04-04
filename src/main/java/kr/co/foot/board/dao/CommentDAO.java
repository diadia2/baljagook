package kr.co.foot.board.dao;

import java.util.List;

import kr.co.foot.board.vo.CommentVO;

public interface CommentDAO {
	public List<CommentVO> list();
	public void insert(CommentVO commentVo);
	public void modify(CommentVO commentVo);
	public void delete(int idx);
	public void reply(CommentVO commentVo);
}
