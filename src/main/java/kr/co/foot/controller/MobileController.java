package kr.co.foot.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.favoritemap.FavoritemapVO;
import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.member.MemberService;
import kr.co.foot.mymap.MymapService;
import kr.co.foot.mymap.MymapVO;


@Controller
public class MobileController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MymapService mymapService;
	
	@RequestMapping("m/main.do")
	public ModelAndView bottom(String userid, Model model) {
		
		List<MymapVO> myPlanList = new ArrayList<>();
		List<MymapVO> favMapList = new ArrayList<>();
		List<FavoriteplaceVO> favPlaceList = new ArrayList<>();
		
		
		userid = "test@test.com";
		if(userid != null) {
			//내계획
			myPlanList = memberService.selectMymapListByuseridForPlan(userid);
			
			//즐찾지도
			List<FavoritemapVO> favMapListRef = mymapService.selectRegmapidx(userid);
			for (int i = 0; i < favMapListRef.size(); i++) {
				MymapVO mymapVO = mymapService.selectMymapByRegmapIdx(favMapListRef.get(i).getRegmapidx());
				favMapList.add(mymapVO);
			}
			
			//즐찾장소
			favPlaceList = mymapService.selectcheckpoint(userid);
							
		}
		
		model.addAttribute("myPlanList", myPlanList);
		model.addAttribute("favMapList", favMapList);
		model.addAttribute("favPlaceList", favPlaceList);

		ModelAndView mav = new ModelAndView("mobile/main");
		return mav;
	}
	
}
