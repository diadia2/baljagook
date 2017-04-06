package kr.co.foot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.foot.member.MemberService;
import kr.co.foot.mymap.MymapVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/mypage.do")
	public String myPage(Model model){
		
		String userid = "test@test.com";
		
		List<MymapVO> mymapList = memberService.selectMymapListByuserid(userid); 
		for(MymapVO vo : mymapList){
			System.out.println(vo);
		}
		
		model.addAttribute("mymapList", mymapList);
		
		return "member/mypage";
	}
	
	@RequestMapping("/member/resetMypage.do")
	@ResponseBody
	public List<MymapVO> resetMypage(@RequestParam("header") String header){
		
		String userid = "test@test.com";
		System.out.println(header);
		
		if(header.equals("내계획")){
			List<MymapVO> mymapList = memberService.selectMymapListByuseridForPlan(userid);
			return mymapList;
		}
		
		List<MymapVO> mymapList = memberService.selectMymapListByuserid(userid);
		return mymapList;
		
	}
}
