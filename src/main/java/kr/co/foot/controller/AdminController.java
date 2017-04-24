package kr.co.foot.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.foot.advertisement.AdvertisementVO;
import kr.co.foot.coordinates.CoordinatesService;
import kr.co.foot.member.MemberVO;
import kr.co.foot.mymap.MymapService;
import kr.co.foot.mymap.MymapVO;
import kr.co.foot.util.FileUtils;



@Controller
public class AdminController {

   @Autowired
   private CoordinatesService coordinatesService;
   @Autowired
   private MymapService mymapService;
   @Autowired
   private FileUtils fileutils;

   @RequestMapping("/admin/dashboard.do")
   public String dashboard(Model model) throws ParseException{
	   
	   int totalmember = mymapService.getTotalMember();
	   int totalmap = mymapService.getTotalMap(1);
	   int totalregmap = mymapService.getTotalMap(2);
	   List<MymapVO> mymapList = mymapService.getMymapListHighRank();
	   List<MemberVO> memberList = new ArrayList<MemberVO>();
	   
	   for(int i=0; i<mymapList.size(); i++){
		   System.out.println(mymapList.get(i));
		   MemberVO memberVO = mymapService.getMemberInfo(mymapList.get(i).getUserid());
		   System.out.println(memberVO);
		   memberVO.setStatus(mymapList.get(i).getIdx());
		   memberList.add(memberVO);
	   }
	   
	   
	   model.addAttribute("totalmember", totalmember);
	   model.addAttribute("totalmap", totalmap);
	   model.addAttribute("totalregmap", totalregmap);
	   model.addAttribute("memberList", memberList);
	   
	   
	   Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(cal.getTime());
		String regdate = (String.valueOf(sdf.parse(today).getTime()/1000));
		String dateTo = sdf.format(new Date(Long.valueOf(((Integer.parseInt(regdate))-86400)+"000")));
		List<Integer> dailyMemberCount = new ArrayList<Integer>();
		List<String> dateList = new ArrayList<String>();
		
		for(int i=0; i<7; i++){
		      String yesterday = String.valueOf(((Integer.parseInt(regdate))-86400));
		      Map<String, String> map = new HashMap<String, String>();
		      map.put("regdate", regdate);
		      map.put("yesterday", yesterday);
		      dailyMemberCount.add(mymapService.selectMemberCount(map));
		      dateList.add(sdf.format(new Date(Long.valueOf((Integer.parseInt(regdate))+"000"))));
		      regdate = yesterday;
	    }
	   
		String dateFrom = sdf.format(new Date(Long.valueOf(regdate+"000")));
		
		model.addAttribute("dailyMemberCount", dailyMemberCount);
		model.addAttribute("dateFrom", dateFrom);
		model.addAttribute("dateTo", dateTo);
		
		int totalAdv = mymapService.selectTotalAdv();
		
		model.addAttribute("totalAdv", totalAdv);
		
	   return "admin_view/dashboard";
   }
   
   @RequestMapping("/admin/memberlist.do")
   public String memberlist(){
	   
	   return "admin_view/memberlist";
   }
   
   @RequestMapping("/admin/boardlist.do")
   public String boardlist(){
	   
	   return "admin_view/boardlist";
   }
   
   @RequestMapping("/admin/adv.do")
   public String adv(Model model){
	   
	   List<AdvertisementVO> AdvertisementList = mymapService.selectAdvertisementList();
	  
	   model.addAttribute("AdvertisementList",AdvertisementList);
	   
	   return "admin_view/adv";
   }
   
   @RequestMapping("/admin/notifications.do")
   public String notifications(){
	   
	   return "admin_view/notifications";
   }
   
   @RequestMapping("/admin/faq.do")
   public String faq(){
	   
	   return "admin_view/faq";
   }
   
   @RequestMapping("/admin/regAdv.do")
   public String regAdv(HttpServletRequest request, Model model) throws IllegalStateException, IOException{
	   
	   String name = request.getParameter("name");
	   String detail = request.getParameter("detail");
	   String lat = request.getParameter("lat");
	   String lon = request.getParameter("lon");
	   
	   Map<String, String> map = fileutils.regAdvPhoto(request);
	   
	   String oriname = map.get("oriFileName");
	   String newname = map.get("newFileName");
	   
	   System.out.println("name : "+name);
	   System.out.println("detail : "+detail);
	   System.out.println("lat : "+lat);
	   System.out.println("lon : "+lon);
	   System.out.println("oriname : "+oriname);
	   System.out.println("newname : "+newname);
	   
	   AdvertisementVO advertisementVO = new AdvertisementVO();
	   advertisementVO.setLat(lat);
	   advertisementVO.setLon(lon);
	   advertisementVO.setName(name);
	   advertisementVO.setDetail(detail);
	   advertisementVO.setOriname(oriname);
	   advertisementVO.setNewname(newname);
	   
	   mymapService.insertAdvertisement(advertisementVO);
	   
	   List<AdvertisementVO> AdvertisementList = mymapService.selectAdvertisementList();
		  
	   model.addAttribute("AdvertisementList",AdvertisementList);
	   
	   return "admin_view/adv";
   }
   
   
}