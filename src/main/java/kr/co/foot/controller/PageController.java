package kr.co.foot.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.foot.faq.FaqService;
import kr.co.foot.faq.FaqVO;
import kr.co.foot.hashtag.HashtagVO;
import kr.co.foot.mymap.MymapService;
import kr.co.foot.mymap.MymapVO;
import kr.co.foot.regcoordinates.RegcoordinatesVO;
import kr.co.foot.regmap.RegmapVO;

@Controller
public class PageController {

	@Autowired
	MymapService mymapService;

	@Autowired
	private FaqService faqService;

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

	@RequestMapping(value = { "/main.do", "" })
	public ModelAndView main() {

		List<RegmapVO> regmapList = mymapService.selectRegmapInfo();

		for (RegmapVO vo : regmapList) {
			System.out.println(vo);
		}

		List<MymapVO> mymapList = new ArrayList<MymapVO>();
		for (int i = 0; i < regmapList.size(); i++) {
			MymapVO mymapVO = mymapService.selectMymap(regmapList.get(i).getMymapidx());
			mymapList.add(mymapVO);
		}

		for (MymapVO vo : mymapList)
			System.out.println(vo);

		List<RegcoordinatesVO> regcoordinatesListOne = mymapService.getRegmapsList(mymapList.get(0).getIdx());
		List<RegcoordinatesVO> regcoordinatesListTwo = mymapService.getRegmapsList(mymapList.get(1).getIdx());
		List<RegcoordinatesVO> regcoordinatesListThree = mymapService.getRegmapsList(mymapList.get(2).getIdx());
		List<RegcoordinatesVO> regcoordinatesListFour = mymapService.getRegmapsList(mymapList.get(3).getIdx());

		String regOne = "";
		String regTwo = "";
		String regThree = "";
		String regFour = "";

		for (int i = 0; i < regcoordinatesListOne.size(); i++) {
			regOne += regcoordinatesListOne.get(i).getLat();
			regOne += ",";
			regOne += regcoordinatesListOne.get(i).getLon();
			if (i != regcoordinatesListOne.size() - 1) {
				regOne += "|";
			}
		}
		for (int i = 0; i < regcoordinatesListTwo.size(); i++) {
			regTwo += regcoordinatesListTwo.get(i).getLat();
			regTwo += ",";
			regTwo += regcoordinatesListTwo.get(i).getLon();
			if (i != regcoordinatesListTwo.size() - 1) {
				regTwo += "|";
			}
		}
		for (int i = 0; i < regcoordinatesListThree.size(); i++) {
			regThree += regcoordinatesListThree.get(i).getLat();
			regThree += ",";
			regThree += regcoordinatesListThree.get(i).getLon();
			if (i != regcoordinatesListThree.size() - 1) {
				regThree += "|";
			}
		}
		for (int i = 0; i < regcoordinatesListFour.size(); i++) {
			regFour += regcoordinatesListFour.get(i).getLat();
			regFour += ",";
			regFour += regcoordinatesListFour.get(i).getLon();
			if (i != regcoordinatesListFour.size() - 1) {
				regFour += "|";
			}
		}

		ModelAndView mav = new ModelAndView("/main");
		mav.addObject("regmapList", regmapList);
		mav.addObject("mymapList", mymapList);
		mav.addObject("regOne", regOne);
		mav.addObject("regTwo", regTwo);
		mav.addObject("regThree", regThree);
		mav.addObject("regFour", regFour);
		return mav;
	}

	/*
	 * @RequestMapping("/regMymap.do") public ModelAndView regMymap() {
	 * ModelAndView mav = new ModelAndView("/map/regMymap"); return mav; }
	 */
	@RequestMapping("/qna.do")
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView("/board/qna");
		List<FaqVO> faqList = faqService.getFAQList();
		mav.addObject("faqList", faqList);

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

	@RequestMapping("/chat.do")
	public ModelAndView chat() {
		ModelAndView mav = new ModelAndView("/websocket/websocketEx2");
		return mav;
	}

	@RequestMapping("/m.do")
	public ModelAndView m() {
		ModelAndView mav = new ModelAndView("/member/mypage2");
		return mav;
	}

	@RequestMapping("/main2.do")
	public ModelAndView main2() {

		List<RegmapVO> regmapList = mymapService.selectRegmapInfo();

		for (RegmapVO vo : regmapList) {
			System.out.println(vo);
		}

		List<MymapVO> mymapList = new ArrayList<MymapVO>();
		for (int i = 0; i < regmapList.size(); i++) {
			MymapVO mymapVO = mymapService.selectMymap(regmapList.get(i).getMymapidx());
			mymapList.add(mymapVO);
		}

		for (MymapVO vo : mymapList)
			System.out.println(vo);

		List<RegcoordinatesVO> regcoordinatesListOne = mymapService.getRegmapsList(mymapList.get(0).getIdx());
		List<RegcoordinatesVO> regcoordinatesListTwo = mymapService.getRegmapsList(mymapList.get(1).getIdx());
		List<RegcoordinatesVO> regcoordinatesListThree = mymapService.getRegmapsList(mymapList.get(2).getIdx());
		List<RegcoordinatesVO> regcoordinatesListFour = mymapService.getRegmapsList(mymapList.get(3).getIdx());

		String regOne = "";
		String regTwo = "";
		String regThree = "";
		String regFour = "";

		for (int i = 0; i < regcoordinatesListOne.size(); i++) {
			regOne += regcoordinatesListOne.get(i).getLat();
			regOne += ",";
			regOne += regcoordinatesListOne.get(i).getLon();
			if (i != regcoordinatesListOne.size() - 1) {
				regOne += "|";
			}
		}
		for (int i = 0; i < regcoordinatesListTwo.size(); i++) {
			regTwo += regcoordinatesListTwo.get(i).getLat();
			regTwo += ",";
			regTwo += regcoordinatesListTwo.get(i).getLon();
			if (i != regcoordinatesListTwo.size() - 1) {
				regTwo += "|";
			}
		}
		for (int i = 0; i < regcoordinatesListThree.size(); i++) {
			regThree += regcoordinatesListThree.get(i).getLat();
			regThree += ",";
			regThree += regcoordinatesListThree.get(i).getLon();
			if (i != regcoordinatesListThree.size() - 1) {
				regThree += "|";
			}
		}
		for (int i = 0; i < regcoordinatesListFour.size(); i++) {
			regFour += regcoordinatesListFour.get(i).getLat();
			regFour += ",";
			regFour += regcoordinatesListFour.get(i).getLon();
			if (i != regcoordinatesListFour.size() - 1) {
				regFour += "|";
			}
		}

		ModelAndView mav = new ModelAndView("/main");
		mav.addObject("regmapList", regmapList);
		mav.addObject("mymapList", mymapList);
		mav.addObject("regOne", regOne);
		mav.addObject("regTwo", regTwo);
		mav.addObject("regThree", regThree);
		mav.addObject("regFour", regFour);
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