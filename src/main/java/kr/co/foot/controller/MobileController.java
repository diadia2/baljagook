package kr.co.foot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MobileController {
	
	
	@RequestMapping("m/main.do")
	public ModelAndView bottom() {
		ModelAndView mav = new ModelAndView("mobile/main");
		return mav;
	}
	
}
