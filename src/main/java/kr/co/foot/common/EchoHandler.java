package kr.co.foot.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	private List<WebSocketSession> connectedUsers;

	public EchoHandler() {
		connectedUsers = new ArrayList<>();
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info(session.getId() + "종료");
		connectedUsers.remove(session);
		System.out.println(session.getId() + "종료" + connectedUsers);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info(session.getId() + "접속");
		System.out.println(session.getId() + "접속" + connectedUsers);
		connectedUsers.add(session);
		logger.info(session.getRemoteAddress().getHostName());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info(session.getId() + " : " + message.getPayload());
		System.out.println(session.getId() + " : " + message.getPayload());
		for (WebSocketSession s : connectedUsers) {
			/* s.sendMessage(new TextMessage(message.getPayload())); */
			if (!session.getId().equals(s)) {
				/*s.sendMessage(new TextMessage(session.getRemoteAddress().getHostName() + ":" + message.getPayload()));*/
				s.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload()));
				/*Thread.sleep(1000);*/
			}

		}
	}

}
