package kr.co.foot;

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
	
	@RequestMapping("/mypage.do")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView("/member/mypage");
		return mav;
	}
	
	@RequestMapping("/regMymap.do")
	public ModelAndView regMymap() {
		ModelAndView mav = new ModelAndView("/map/regMymap");
		return mav;
	}
	
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
	
	@RequestMapping("/searchList.do")
	public ModelAndView searchList() {
		ModelAndView mav = new ModelAndView("/board/searchList");
		return mav;
	}
	
	@RequestMapping("/mapDetail.do")
	public ModelAndView mapDetail() {
		ModelAndView mav = new ModelAndView("/map/mapDetail");
		return mav;
	}
}
