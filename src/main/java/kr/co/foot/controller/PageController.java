package kr.co.foot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	@RequestMapping("/top.do")
	public ModelAndView top() {
		ModelAndView mav = new ModelAndView("/include/top");
		return mav;
	}

	@RequestMapping("/bottom.do")
	public ModelAndView bottom() {
		ModelAndView mav = new ModelAndView("/include/bottom");
		return mav;
	}

	@RequestMapping("/main.do")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("/main");
		return mav;
	}

	/*
	 * @RequestMapping("/regMymap.do") public ModelAndView regMymap() {
	 * ModelAndView mav = new ModelAndView("/map/regMymap"); return mav; }
	 */
	@RequestMapping("/qna.do")
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView("/board/qna");
		return mav;
	}

	@RequestMapping("/noticeList.do")
	public ModelAndView noticeList() {
		ModelAndView mav = new ModelAndView("/board/noticeList");
		return mav;
	}

	@RequestMapping("/noticeView.do")
	public ModelAndView noticeView() {
		ModelAndView mav = new ModelAndView("/board/noticeView");
		return mav;
	}

	/*
	 * @RequestMapping("/searchList.do") public ModelAndView searchList() {
	 * ModelAndView mav = new ModelAndView("/board/searchList"); return mav; }
	 */

	/*
	 * @RequestMapping("/mapDetail.do") public ModelAndView mapDetail() {
	 * ModelAndView mav = new ModelAndView("/map/mapDetail"); return mav; }
	 */
	
/*	@RequestMapping("/chat.do")
	public ModelAndView chat() {
		ModelAndView mav = new ModelAndView("/websocket/websocketEx");
		return mav;
	}*/
	
	@RequestMapping("/chat.do")
	public ModelAndView chat() {
		ModelAndView mav = new ModelAndView("/websocket/websocketEx2");
		return mav;
	}
	
	@RequestMapping("/s.do")
	public ModelAndView s() {
		ModelAndView mav = new ModelAndView("/search/search2");
		return mav;
	}
	
	@RequestMapping("/m.do")
	public ModelAndView m() {
		ModelAndView mav = new ModelAndView("/member/mypage2");
		return mav;
	}
	@RequestMapping("/main2.do")
	public ModelAndView main2() {
		ModelAndView mav = new ModelAndView("/main2");
		return mav;
	}
	@RequestMapping("/top2.do")
	public ModelAndView top2() {
		ModelAndView mav = new ModelAndView("/include/top2");
		return mav;
	}
	@RequestMapping("/bottom2.do")
	public ModelAndView bottom2() {
		ModelAndView mav = new ModelAndView("/include/bottom2");
		return mav;
	}
}