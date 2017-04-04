package kr.co.foot.board.controller;

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
public class BoardController {

	CommentVO commentVo = new CommentVO();

	@Autowired
	private CommentService service;

	/* ´ñ±Û ¸®½ºÆ® ³ª¿À´Â ºÎºÐ */
	@RequestMapping("/cmt.do")
	public ModelAndView cmt() {
		List<CommentVO> cmtList = service.list();
		ModelAndView mav = new ModelAndView("cmt");
		mav.addObject("cmtList", cmtList);
		return mav;
	}

	/* url¿¬°á */
	@RequestMapping("/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("test");
		System.out.println("list");
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

	/* ´ñ±Û ÀÔ·Â½Ã */
	@RequestMapping(value = "/insert.do")
	@ResponseBody
	public ModelAndView insertComment(@RequestParam String content, @RequestParam String userid,
			@RequestParam int regmapidx) {
		commentVo.setContent(content);
		commentVo.setRegmapidx(regmapidx);
		commentVo.setUserid(userid);
		System.out.println(commentVo);
		service.insert(commentVo);
		ModelAndView mav = new ModelAndView("forward:/cmt.do");
		return mav;
	}

	/* ´ñ±Û ¼öÁ¤½Ã */
	@RequestMapping(value = "/modify.do")
	public ModelAndView modifyComment(@RequestParam String content, @RequestParam int idx) {
		commentVo.setContent(content);
		commentVo.setIdx(idx);

		System.out.println(commentVo);
		service.modify(commentVo);
		ModelAndView mav = new ModelAndView("forward:/cmt.do");
		return mav;
	}

	/* ´ñ±Û »èÁ¦½Ã */
	@RequestMapping(value = "/delete.do")
	public ModelAndView deletComment(@RequestParam int idx) {
		System.out.println(idx);
		service.delete(idx);
		ModelAndView mav = new ModelAndView("forward:/cmt.do");
		return mav;
	}

	/* ´ñ±Û ´ä±Û½Ã */
	@RequestMapping(value = "/reply.do")
	public ModelAndView replyComment(@RequestParam String content, @RequestParam String userid,
			@RequestParam int regmapidx, @RequestParam int idx) {
		commentVo.setContent(content);
		commentVo.setUserid(userid);
		commentVo.setRegmapidx(regmapidx);
		commentVo.setIdx(idx);
		System.out.println(commentVo);
		service.reply(commentVo);
		ModelAndView mav = new ModelAndView("forward:/cmt.do");
		return mav;
	}

}
