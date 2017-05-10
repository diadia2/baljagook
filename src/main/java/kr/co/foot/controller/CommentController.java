package kr.co.foot.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.foot.board.service.CommentService;
import kr.co.foot.board.vo.CommentVO;

@Controller
public class CommentController {

	CommentVO commentVo = new CommentVO();

	@Autowired
	private CommentService service;

	/* 댓글 리스트 나오는 부분 */
	@RequestMapping("/comment/mapCommentList.do")
	@ResponseBody
	public ModelAndView mapCommentList(@RequestParam int regmapidx) {
		List<CommentVO> cmtList = service.list(regmapidx);
		ModelAndView mav = new ModelAndView("/comment/mapCommentList");
		
		for(int i=0; i<cmtList.size(); i++) {
			String imageName = service.getProfileImage(cmtList.get(i).getUserid());
			cmtList.get(i).setImageName(imageName);
			
			String timestamp = cmtList.get(i).getRegdate();
			long timestampL = Long.parseLong(timestamp) * 1000;
			Date dateObj = new Date(timestampL);
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = df.format(dateObj);
			cmtList.get(i).setRegdate(time);
		}
		
		mav.addObject("mapCommentList", cmtList);
		
		return mav;
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/insert.do") public ModelAndView
	 * setCoordinatesPOST(@RequestBody CommentVO commentVo2) {
	 * 
	 * System.out.println(commentVo2); service.insert(commentVo2);
	 * 
	 * ModelAndView mav = new ModelAndView("forward:/cmt.do"); return mav; }
	 */

	/* 댓글 입력시 */
	@RequestMapping(value = "/map/commentInsert.do")
	@ResponseBody
	public ModelAndView insertMapComment(@RequestParam String content, @RequestParam String userid,
			@RequestParam int regmapidx) {
		commentVo.setContent(content);
		commentVo.setRegmapidx(regmapidx);
		commentVo.setUserid(userid);
		System.out.println(commentVo);
		service.insert(commentVo);
		ModelAndView mav = new ModelAndView("forward:/comment/mapCommentList.do");
		return mav;
	}

	/* 댓글 수정시 */
	@RequestMapping(value = "/map/commentModify.do")
	public ModelAndView modifyMapComment(@RequestParam String content, @RequestParam int idx) {
		commentVo.setContent(content);
		commentVo.setIdx(idx);
		System.out.println(commentVo);
		service.modify(commentVo);
		ModelAndView mav = new ModelAndView("forward:/comment/mapCommentList.do");
		return mav;
	}

	/* 댓글 삭제시 */
	@RequestMapping(value = "/map/commentDelete.do")
	@ResponseBody
	public ModelAndView deletMapComment(@RequestParam int idx, @RequestParam int regmapidx) {
		System.out.println(idx);
		service.delete(idx);
		ModelAndView mav = new ModelAndView("forward:/comment/mapCommentList.do");
		return mav;
	}

	/* 댓글 답글시 */
	@RequestMapping(value = "/map/commentReply.do")
	@ResponseBody
	public ModelAndView replyMapComment(@RequestParam String content, @RequestParam String userid,
			@RequestParam int regmapidx, @RequestParam int idx) {
		commentVo.setContent(content);
		commentVo.setUserid(userid);
		commentVo.setRegmapidx(regmapidx);
		commentVo.setIdx(idx);
		System.out.println(commentVo);
		service.reply(commentVo);
		ModelAndView mav = new ModelAndView("forward:/comment/mapCommentList.do");
		return mav;
	}
	
}