package kr.co.foot.hello;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.stereotype.Controller
public class Controller {
	String message = "hello";

	@RequestMapping("/hello")
	public ModelAndView showMessage(
			@RequestParam(value = "name", required = false, defaultValue = "world") String name) {
		System.out.println("컨트롤러");

		ModelAndView mv = new ModelAndView("hello");
		mv.addObject("message", message);
		mv.addObject("name", name);
		return mv;
	}
}
