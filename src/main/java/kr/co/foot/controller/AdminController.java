package kr.co.foot.controller;

import java.io.IOException;
import java.text.DateFormat;
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
import kr.co.foot.report.ReportVO;
import kr.co.foot.reportedmap.BlindedMapDTO;
import kr.co.foot.reportedmap.ReportedMapDTO;
import kr.co.foot.reportedmap.ReportedMapService;
import kr.co.foot.util.FileUtils;




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
   @Autowired
   private FileUtils fileutils;
   @Autowired
   private ReportedMapService reportedMapService;

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
	public String memberlist(Model model) {
		List<MemberManagementVO> regularMemberInfoList = new ArrayList<MemberManagementVO>();
		List<MemberManagementVO> blindedMemberInfoList = new ArrayList<MemberManagementVO>();
		List<MemberManagementVO> deactivatedMemberInfoList = new ArrayList<MemberManagementVO>();

		List<MemberVO> regularMemberList = memberManagementService.getRegularMemberList();
		List<MemberVO> blindedMemberList = memberManagementService.getBlindedMemberList();
		List<MemberVO> deactivatedMemberList = memberManagementService.getDeactivatedMemberList();

		if(regularMemberList.size() > 0) {
			for (int i = 0; i < regularMemberList.size(); i++) {
				String email = regularMemberList.get(i).getEmail();
				String userid = regularMemberList.get(i).getUserid();
				String regdate = convertTimestampToDate(regularMemberList.get(i).getRegdate());
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
		}

		if(blindedMemberList.size() > 0) {
		for (int j = 0; j < blindedMemberList.size(); j++) {
			String email = blindedMemberList.get(j).getEmail();
			String userid = blindedMemberList.get(j).getUserid();
			String regdate = convertTimestampToDate(blindedMemberList.get(j).getRegdate());
			int myMapCnt = memberManagementService.getMyMapCntByUserid(userid);
			int myPlanCnt = memberManagementService.getMyPlanCntByUserid(userid);
			int reportedMyMapCnt = memberManagementService.getReportCntByUserid(userid);
			int status = blindedMemberList.get(j).getStatus();

			MemberManagementVO memberInfo = new MemberManagementVO();
			memberInfo.setEmail(email);
			memberInfo.setUserid(userid);
			memberInfo.setRegdate(regdate);
			memberInfo.setMyMapCnt(myMapCnt);
			memberInfo.setMyPlanCnt(myPlanCnt);
			memberInfo.setReportedMyMapCnt(reportedMyMapCnt);
			memberInfo.setStatus(status);

			blindedMemberInfoList.add(j, memberInfo);
		}
		}

		if(deactivatedMemberList.size() > 0) {
		for (int k = 0; k < deactivatedMemberList.size(); k++) {
			String email = deactivatedMemberList.get(k).getEmail();
			String userid = deactivatedMemberList.get(k).getUserid();
			String regdate = convertTimestampToDate(deactivatedMemberList.get(k).getRegdate());
			String deactivatedate = convertTimestampToDate(deactivatedMemberList.get(k).getDeactivatedate());
			int myMapCnt = memberManagementService.getMyMapCntByUserid(userid);
			int myPlanCnt = memberManagementService.getMyPlanCntByUserid(userid);
			int reportedMyMapCnt = memberManagementService.getReportCntByUserid(userid);
			int status = blindedMemberList.get(k).getStatus();

			MemberManagementVO memberInfo = new MemberManagementVO();
			memberInfo.setEmail(email);
			memberInfo.setUserid(userid);
			memberInfo.setRegdate(regdate);
			memberInfo.setDeactivatedate(deactivatedate);
			memberInfo.setMyMapCnt(myMapCnt);
			memberInfo.setMyPlanCnt(myPlanCnt);
			memberInfo.setReportedMyMapCnt(reportedMyMapCnt);
			memberInfo.setStatus(status);

			deactivatedMemberInfoList.add(k, memberInfo);
		}
		}

		model.addAttribute("regularMemberInfoList", regularMemberInfoList);
		model.addAttribute("blindedMemberInfoList", blindedMemberInfoList);
		model.addAttribute("deactivatedMemberInfoList", deactivatedMemberInfoList);

		return "admin_view/memberlist";
	}
   
   @RequestMapping("/admin/boardlist.do")
   public String boardlist(Model model){
	   List<Integer> regmapidxList = new ArrayList<Integer>();
	   List<Integer> blindedRegmapidx = new ArrayList<Integer>();
	   List<ReportedMapDTO> reportedMapDTOList = reportedMapService.getReportedMapDTOList();
	   List<MymapVO> blindedMapList = reportedMapService.getBlindedMap();
	   
	   for(int i=0; i< blindedMapList.size(); i++) {
		   blindedRegmapidx.add(mymapService.getRegmapIdx(blindedMapList.get(i).getIdx()));
	   }
	   
	   for(int i=0; i < reportedMapDTOList.size(); i++) {
		   regmapidxList.add(i, reportedMapDTOList.get(i).getRegmapidx());   
	   }
	   
	   for(int i=0; i < regmapidxList.size(); i++) {
		   MymapVO reportedMymap = mymapService.selectMymapByRegmapIdx(regmapidxList.get(i));
		   
		   reportedMapDTOList.get(i).setTitle(reportedMymap.getTitle());
		   reportedMapDTOList.get(i).setContent(reportedMymap.getContent());
		   reportedMapDTOList.get(i).setUserid(reportedMymap.getUserid());
		   reportedMapDTOList.get(i).setRegdate(convertTimestampToDate(reportedMymap.getRegdate()));
		   reportedMapDTOList.get(i).setMymapidx(reportedMymap.getIdx());
		   reportedMapDTOList.get(i).setRegmapidx(regmapidxList.get(i));
	   }
	   
	   List<BlindedMapDTO> blindedMapDTOList = new ArrayList<BlindedMapDTO>();
	   for(int i=0; i< blindedMapList.size(); i++) {
		   BlindedMapDTO blindedMapDTO = new BlindedMapDTO();
		   blindedMapDTO.setMymapidx(blindedMapList.get(i).getIdx());
		   blindedMapDTO.setRegmapidx(mymapService.getRegmapIdx(blindedMapList.get(i).getIdx()));
		   blindedMapDTO.setTitle(blindedMapList.get(i).getTitle());
		   blindedMapDTO.setContent(blindedMapList.get(i).getContent());
		   blindedMapDTO.setUserid(blindedMapList.get(i).getUserid());
		   blindedMapDTO.setRegdate(convertTimestampToDate(blindedMapList.get(i).getRegdate()));
		   for(int j=0; j<reportedMapDTOList.size(); j++) {		   
			   if(reportedMapDTOList.get(j).getRegmapidx() == blindedMapDTO.getRegmapidx()) {
				   blindedMapDTO.setCount(reportedMapDTOList.get(j).getCount());
			   }
		   }
		   
		   blindedMapDTOList.add(blindedMapDTO);
	   }
	   
	   for(int i=0; i < reportedMapDTOList.size(); i++) {
		   for(int j=0; j < blindedRegmapidx.size(); j++) {
			   if(reportedMapDTOList.get(i).getRegmapidx() == blindedRegmapidx.get(j)) {
				   reportedMapDTOList.remove(i);
			   }
		   }
	   }	   
	   
	   model.addAttribute("blindedMapDTOList", blindedMapDTOList);
	   model.addAttribute("reportedMapDTOList", reportedMapDTOList);	   
	   
	   return "admin_view/boardlist";
   }  
   
   @RequestMapping(value="/admin/getReportList.do", method=RequestMethod.POST)
   @ResponseBody
   public List<ReportVO> getReportList(@RequestParam("regmapidx") int regmapidx) {
	   List<ReportVO> reportList = reportedMapService.getReportList(regmapidx);
	   HashMap<Integer, ReportVO> reportMap = new HashMap<Integer, ReportVO>();
	   for(int i=0; i< reportList.size(); i++) {
		   reportList.get(i).setRegdate(convertTimestampToDate(reportList.get(i).getRegdate()));
		   reportMap.put(i, reportList.get(i));
	   }
	   
	   return reportList;
   }
   
   @RequestMapping(value="/admin/blindRegmap.do", method=RequestMethod.POST)
   @ResponseBody
   public void blindRegmap(@RequestParam("regmapidx") int regmapidx) {
	   reportedMapService.blindRegmap(regmapidx);
   }
   
   @RequestMapping(value="/admin/cancelBlind.do", method=RequestMethod.POST)
   @ResponseBody
   public void cancelBlind(@RequestParam("regmapidx") int regmapidx) {
	   reportedMapService.cancelBlindRegmap(regmapidx);
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
   
   @RequestMapping(value="/admin/deleteMember.do", method=RequestMethod.POST)
   @ResponseBody
   public void deleteMember(@RequestParam("userid") String userid) {
	   memberManagementService.deleteMember(userid);
   }
   
   @RequestMapping(value="/admin/changeMemberStatus.do", method=RequestMethod.POST)
   @ResponseBody
   public void changeMemberStatus(@RequestParam("userid") String userid,
		   						  @RequestParam("changedStatus") String changedStatus) {
	   int status = 0;
	   if(changedStatus.equalsIgnoreCase("regular")) {
		   status = 1;
	   } else if(changedStatus.equalsIgnoreCase("blinded")) {
		   status = 3;
	   }
	   
	   MemberVO statusChangedMember = new MemberVO();
	   statusChangedMember.setUserid(userid);
	   statusChangedMember.setStatus(status);
	   
	   memberManagementService.updateMemberStatus(statusChangedMember);
	    
   }
   
   public String convertTimestampToDate(String timestamp) {
	   long timestampL = Long.parseLong(timestamp)*1000;
	   Date dateObj = new Date(timestampL);
	   DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	   String time = df.format(dateObj);
	   return time;
   }
   
   
}