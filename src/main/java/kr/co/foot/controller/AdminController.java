package kr.co.foot.controller;

import java.io.FileNotFoundException;
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
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.foot.advertisement.AdvertisementVO;
import kr.co.foot.coordinates.CoordinatesService;
import kr.co.foot.faq.FaqDTO;
import kr.co.foot.faq.FaqService;
import kr.co.foot.faq.FaqVO;
import kr.co.foot.managemember.MemberManagementService;
import kr.co.foot.managemember.MemberManagementVO;
import kr.co.foot.member.MemberVO;
import kr.co.foot.mymap.MymapService;
import kr.co.foot.mymap.MymapVO;
import kr.co.foot.util.FileUtils;
import kr.co.foot.util.GetToken;




@Controller
public class AdminController {

   @Autowired
   private CoordinatesService coordinatesService;
   @Autowired
   private MymapService mymapService;
   @Autowired
   private FaqService faqService;
   @Autowired
   private MemberManagementService memberManagementService;

   private FileUtils fileutils;

   @RequestMapping("/admin/dashboard.do")
   public String dashboard(Model model) throws ParseException, FileNotFoundException, IOException{
	   
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
		String dateToday = sdf.format(new Date(Long.valueOf((Integer.parseInt(regdate))+"000")));
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
		
		GetToken getToken = new GetToken();
		
		model.addAttribute("dateToday", dateToday);
		model.addAttribute("dailyMemberCount", dailyMemberCount);
		model.addAttribute("dateFrom", dateFrom);
		model.addAttribute("dateTo", dateTo);
		
		int totalAdv = mymapService.selectTotalAdv();
		
		model.addAttribute("totalAdv", totalAdv);
		
	   return "admin_view/dashboard";
   }
   
   @RequestMapping("/admin/memberlist.do")
   public String memberlist(Model model){
	   List<MemberManagementVO> regularMemberInfoList = new ArrayList<MemberManagementVO>();
	   List<MemberManagementVO> blindedMemberInfoList = new ArrayList<MemberManagementVO>();
	   List<MemberManagementVO> deactivatedMemberInfoList = new ArrayList<MemberManagementVO>();
	   
	   List<MemberVO> regularMemberList = memberManagementService.getRegularMemberList();
	   List<MemberVO> blindedMemberList = memberManagementService.getBlindedMemberList();
	   List<MemberVO> deactivatedMemberList = memberManagementService.getDeactivatedMemberList();
	   
	   if(regularMemberList.size() != 0) {	   
		   for(int i=0; i<regularMemberList.size(); i++) {
			   String email = regularMemberList.get(i).getEmail();
			   String userid = regularMemberList.get(i).getUserid();
			   String regdate = regularMemberList.get(i).getRegdate();
			   int myMapCnt = memberManagementService.getMyMapCntByUserid(userid);
			   int myPlanCnt = memberManagementService.getMyPlanCntByUserid(userid);
			   int reportedMyMapCnt = memberManagementService.getReportCntByUserid(userid);
			   int status = regularMemberList.get(i).getStatus();
			   
			   MemberManagementVO memberInfo = new MemberManagementVO();
			   memberInfo.setEmail(email);
			   memberInfo.setUserid(userid);
			   memberInfo.setRegdate(regdate);
			   memberInfo.setMyMapCnt(myMapCnt);
			   memberInfo.setMyPlanCnt(myPlanCnt);
			   memberInfo.setReportedMyMapCnt(reportedMyMapCnt);
			   memberInfo.setStatus(status);
			   
			   regularMemberInfoList.add(i, memberInfo);
		   }
		   model.addAttribute("regularMemberInfoList", regularMemberInfoList);
	   }

	   if(blindedMemberList.size() != 0) {
		   for(int i=0; i<blindedMemberList.size(); i++) {
			   String email = blindedMemberList.get(i).getEmail();
			   String userid = blindedMemberList.get(i).getUserid();
			   String regdate = blindedMemberList.get(i).getRegdate();
			   int myMapCnt = memberManagementService.getMyMapCntByUserid(userid);
			   int myPlanCnt = memberManagementService.getMyPlanCntByUserid(userid);
			   int reportedMyMapCnt = memberManagementService.getReportCntByUserid(userid);
			   int status = blindedMemberList.get(i).getStatus();
			   
			   MemberManagementVO memberInfo = new MemberManagementVO();
			   memberInfo.setEmail(email);
			   memberInfo.setUserid(userid);
			   memberInfo.setRegdate(regdate);
			   memberInfo.setMyMapCnt(myMapCnt);
			   memberInfo.setMyPlanCnt(myPlanCnt);
			   memberInfo.setReportedMyMapCnt(reportedMyMapCnt);
			   memberInfo.setStatus(status);
			   
			   blindedMemberInfoList.add(i, memberInfo);
		   }
		   model.addAttribute("blindedMemberInfoList", blindedMemberInfoList);
	   }
	   
	   if(deactivatedMemberList.size() != 0) {
		   for(int i=0; i<deactivatedMemberList.size(); i++) {
			   String email = deactivatedMemberList.get(i).getEmail();
			   String userid = deactivatedMemberList.get(i).getUserid();
			   String regdate = deactivatedMemberList.get(i).getRegdate();
			   String deactivatedate = deactivatedMemberList.get(i).getDeactivatedate();
			   int myMapCnt = memberManagementService.getMyMapCntByUserid(userid);
			   int myPlanCnt = memberManagementService.getMyPlanCntByUserid(userid);
			   int reportedMyMapCnt = memberManagementService.getReportCntByUserid(userid);
			   int status = blindedMemberList.get(i).getStatus();
			   
			   MemberManagementVO memberInfo = new MemberManagementVO();
			   memberInfo.setEmail(email);
			   memberInfo.setUserid(userid);
			   memberInfo.setRegdate(regdate);
			   memberInfo.setDeactivatedate(deactivatedate);
			   memberInfo.setMyMapCnt(myMapCnt);
			   memberInfo.setMyPlanCnt(myPlanCnt);
			   memberInfo.setReportedMyMapCnt(reportedMyMapCnt);
			   memberInfo.setStatus(status);
			   
			   deactivatedMemberInfoList.add(i, memberInfo);
		   }
		   model.addAttribute("deactivatedMemberInfoList", deactivatedMemberInfoList);
	   }
	   
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
   
   @RequestMapping("/admin/bulletin.do")
   public String bulletin(){
	   
	   return "admin_view/bulletin";
   }   
   
   @RequestMapping("/admin/faq.do")
   public ModelAndView faq(){
	   
	   ModelAndView mav = new ModelAndView("admin_view/faq");
	   
	   List<FaqVO> faqList = faqService.getFAQList();
	   mav.addObject("faqList", faqList);
	   
	   return mav;
   }
   
   @RequestMapping(value="/addFAQ.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
   @ResponseBody
   public void addFAQ(@RequestBody FaqDTO faqDTO, Model model) throws ParseException {
	   
	   Calendar cal = Calendar.getInstance();
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   String today = sdf.format(cal.getTime());
	   String regdate = String.valueOf(sdf.parse(today).getTime()/1000);
	   String content = faqDTO.getContent().replace("\n", "<br />\n");
	   
	   FaqVO faqVO = new FaqVO();
	   faqVO.setTitle(faqDTO.getTitle());
	   faqVO.setContent(content);
	   faqVO.setRegdate(regdate);

	   faqService.insertFAQ(faqVO);
	   
   }
   
   @RequestMapping(value="/editFAQ.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
   @ResponseBody
   public void editFAQ(@RequestBody FaqDTO faqDTO, Model model) throws ParseException {
	   
	   Calendar cal = Calendar.getInstance();
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   String today = sdf.format(cal.getTime());
	   String regdate = String.valueOf(sdf.parse(today).getTime()/1000);
	   String content = faqDTO.getContent().replace("\n", "<br />\n");
	   
	   FaqVO faqVO = new FaqVO();
	   faqVO.setIdx(faqDTO.getIdx());
	   faqVO.setTitle(faqDTO.getTitle());
	   faqVO.setContent(content);
	   faqVO.setRegdate(regdate);

	   faqService.editFAQ(faqVO);
	   
   }   
   
   @RequestMapping(value="/removeFAQ.do", method=RequestMethod.POST)
   @ResponseBody
   public void removeFAQ(@RequestParam("idx") int idx) {
	   faqService.removeFAQ(idx);
   }
   
   @RequestMapping(value="/getFAQByIdx.do", method=RequestMethod.POST)
   @ResponseBody
   public HashMap<String,String> getFAQByIdx(@RequestParam("idx") int idx) {
	   FaqVO faqVO = faqService.getFAQByIdx(idx);
	   String content = faqVO.getContent().replace("<br />\n", "\n");
	   
	   HashMap<String,String> faqMap = new HashMap<String,String>();
	   faqMap.put("idx", Integer.toString(faqVO.getIdx()));
	   faqMap.put("title", faqVO.getTitle());
	   faqMap.put("content", content);
	  
	   return faqMap;
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