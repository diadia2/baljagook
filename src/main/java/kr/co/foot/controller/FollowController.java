package kr.co.foot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.foot.follow.FollowService;
import kr.co.foot.follow.FollowVO;

@Controller
public class FollowController {
	FollowVO followVO = new FollowVO();
	
	@Autowired
	private FollowService service;
	
	@RequestMapping("/toFollow.do")
	@ResponseBody
	public void toFollow(@RequestParam("followedId") String followedId, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String followId = (String) session.getAttribute("user");
		followVO.setFollowId(followId);
		followVO.setFollowedId(followedId);
		service.insertFollow(followVO);
	}
	
}
