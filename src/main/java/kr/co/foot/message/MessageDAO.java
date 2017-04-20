package kr.co.foot.message;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertMessage(MessageVO messageVO) {
		sqlSessionTemplate.insert("kr.co.foot.message.insertMessage" ,messageVO);
	}
	
	public List<MessageVO> selectFromMessage(MessageVO messageVO) {
		List<MessageVO> list = sqlSessionTemplate.selectList("kr.co.foot.message.selectFromMessage" ,messageVO);
		return list;
	}
	
	public List<MessageVO> selectToMessage(MessageVO messageVO) {
		List<MessageVO> list = sqlSessionTemplate.selectList("kr.co.foot.message.selectToMessage" ,messageVO);
		return list;
	}
	
	public void readMessage(int idx) {
		sqlSessionTemplate.update("kr.co.foot.message.readMessage" ,idx);
	}
	
	public void deleteMessage(int idx) {
		sqlSessionTemplate.delete("kr.co.foot.message.deleteMessage" ,idx);
	}
	
	public int noReadMessage(MessageVO messageVO) {
		return sqlSessionTemplate.selectOne("kr.co.foot.message.noReadMessage" ,messageVO);
	}
	
}
