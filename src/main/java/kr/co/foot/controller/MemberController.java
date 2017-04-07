package kr.co.foot.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.favoritemap.FavoritemapVO;
import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.member.MemberService;
import kr.co.foot.mymap.MymapService;
import kr.co.foot.mymap.MymapVO;
import kr.co.foot.regcoordinates.RegcoordinatesVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MymapService mymapService;
	
	@RequestMapping("/member/mypage.do")
	public String myPage(Model model){
		
		String userid = "test@test.com";
		
		List<MymapVO> mymapList = memberService.selectMymapListByuserid(userid); 
		model.addAttribute("mymapList", mymapList);
		
		return "member/mypage";
	}
	
	@RequestMapping("/member/resetMypage.do")
	@ResponseBody
	public List<MymapVO> resetMypage(@RequestParam("header") String header){
		
		String userid = "test@test.com";
		
		if(header.equals("내계획")){
			List<MymapVO> mymapList = memberService.selectMymapListByuseridForPlan(userid);
			return mymapList;
		}
		
		List<MymapVO> mymapList = memberService.selectMymapListByuserid(userid);
		return mymapList;
		
	}
	
	@RequestMapping("/member/resetMypageTwo.do")
	@ResponseBody
	public List<MymapVO> resetMypageTwo(@RequestParam("header") String header){
		
		String userid = "test@test.com";
		
		List<FavoritemapVO> favoritemapList = mymapService.selectRegmapidx(userid);
		List<MymapVO> mymapList = new ArrayList<MymapVO>();
	      
	    for(int i=0; i<favoritemapList.size(); i++){
	        MymapVO mymapVO = mymapService.selectMymapByRegmapIdx(favoritemapList.get(i).getRegmapidx());
	        mymapList.add(mymapVO);
	    }
	    
		return mymapList;
		
	}
	
	@RequestMapping("/member/resetMypageThree.do")
	@ResponseBody
	public List<FavoriteplaceVO> resetMypageThree(@RequestParam("header") String header){
		
		String userid = "test@test.com";
		
		List<FavoriteplaceVO> favoriteplaceList = memberService.selectFavoriteMapByuserid(userid);
		
		return favoriteplaceList;
		
	}
	
	@RequestMapping("/member/favoritePlace.do")
	public String favoritePlace(@RequestParam("checkpointidx") String checkpointidx,
								Model model){
		
		System.out.println(checkpointidx);
		CheckpointVO checkpointVO = mymapService.selectCheckPointByIdx(checkpointidx);
		RegcoordinatesVO regcoordinatesVO = mymapService.getRegcoordinatesInfoByIdx(checkpointVO.getRegcoordinatesidx());
		
		model.addAttribute("regcoordinatesVO", regcoordinatesVO);
		
		return "MapTest/favoritePlace";
	}
	
}