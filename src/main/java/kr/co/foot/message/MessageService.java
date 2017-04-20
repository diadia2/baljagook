package kr.co.foot.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	
	@Autowired
	private MessageDAO messageDAO;
	
	public void insertMessage(MessageVO messageVO) {
		messageDAO.insertMessage(messageVO);
	}

	public List<MessageVO> selectFromMessage(MessageVO messageVO) {
		return messageDAO.selectFromMessage(messageVO);
	}
	
	public List<MessageVO> selectToMessage(MessageVO messageVO) {
		return messageDAO.selectToMessage(messageVO);
	}
	
	public void readMessage(int idx) {
		messageDAO.readMessage(idx);
	}
	
	public void deleteMessage(int idx) {
		messageDAO.deleteMessage(idx);
	}
	
	public int noReadMessage(MessageVO messageVO) {
		return messageDAO.noReadMessage(messageVO);
	}
}
