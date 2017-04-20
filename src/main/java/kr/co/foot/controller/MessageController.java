package kr.co.foot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageExceptionHandler;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.foot.message.MessageService;
import kr.co.foot.message.MessageVO;

@Controller
@RequestMapping("/message/*")
public class MessageController {

	@Autowired
	private MessageService service;

	@RequestMapping("/message.do")
	public ModelAndView message() {
		ModelAndView mav = new ModelAndView("/message/message");
		return mav;
	}
	
	@RequestMapping(value="/insertMessage.do", method = RequestMethod.POST)
	public String insertMessage(@RequestParam String contents, @RequestParam String fromId, @RequestParam String toId) {
		MessageVO messageVO = new MessageVO();
		messageVO.setContents(contents);
		messageVO.setfromId(fromId);
		messageVO.settoId(toId);
		System.out.println(messageVO);
		service.insertMessage(messageVO);
		return "forward:/map/detail.do?mymapidx=124";
	}
	
	@MessageMapping("/echo")
	@SendTo("/subscribe/echo")
	public String sendEcho(String hello) throws Exception {
		System.out.println("receive message : " + hello.toString());
		System.out.println("sss");
		String echoHello = new String();
		echoHello = hello;
		return echoHello;
	}

/*	@MessageMapping("/echo")
	@SendTo("/topic/echo")
	public ResponseEntity<String> stomp(String request) {
		System.out.println(new ResponseEntity<String>(request, HttpStatus.OK));
		return new ResponseEntity<String>(request, HttpStatus.OK);
	}*/

	/*@MessageMapping("/echo")
	@SendTo("/topic/echo")
	public MessageVO sendEcho(MessageVO hello) throws Exception {
		System.out.println("receive message : " + hello.toString());
		MessageVO echoHello = new MessageVO();
		echoHello.setContents(hello.getContents());
		return echoHello;
	}

	@MessageMapping("/messages")
	@SendToUser
	public String sendMessage(String message) {
		return message.toUpperCase();
	}

	@MessageExceptionHandler
	@SendToUser("/queue/errors")
	public String handlingException(IllegalStateException ex) {
		return ex.getMessage();
	}*/

	/*
	 * @RequestMapping("/message.do") public ModelAndView cmt() {
	 * 
	 * ModelAndView mav = new ModelAndView("cmt"); mav.addObject("cmtList",
	 * "d"); return mav; }
	 */

}
