package kr.co.foot.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.coordinates.CoordinatesService;
import kr.co.foot.coordinates.CoordinatesVO;
import kr.co.foot.favoritemap.FavoritemapVO;
import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.member.MemberService;
import kr.co.foot.mymap.MymapService;
import kr.co.foot.mymap.MymapVO;
import kr.co.foot.photo.PhotoVO;
import kr.co.foot.reglogin.RegLoginService;
import kr.co.foot.util.FileUtils;



@Controller
public class MobileController {

	@Autowired
	private CoordinatesService coordinatesService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MymapService mymapService;
	
	@Autowired
	private RegLoginService regLoginService;
	
	@Autowired
	private FileUtils fileutils;

	@RequestMapping("m/login.do")
	public ModelAndView showLoginForm() {
		ModelAndView mav = new ModelAndView("mobile/login");
		return mav;
	}
	
	@RequestMapping("m/changePass.do")
	public ModelAndView showChangePassForm() {
		ModelAndView mav = new ModelAndView("mobile/changePass");
		return mav;
	}	

	@RequestMapping("m/signup.do")
	public ModelAndView showSignupForm() {
		ModelAndView mav = new ModelAndView("mobile/signup");
		return mav;
	}
	
	@RequestMapping("m/search.do")
	public ModelAndView showSearchPage() {
		ModelAndView mav = new ModelAndView("mobile/search");
		return mav;
	}	
	
	@RequestMapping("m/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		//세션 무효화
		session.invalidate();

		Cookie[] cookies = request.getCookies();
		//쿠키가 존재하면
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				Cookie c = cookies[i];
				//자동로그인 쿠키가 있으면
				if(c.getName().equals("token")) {
					if(c.getValue() != null) {
						String token = c.getValue();
						//데이터베이스에 저장된 자동로그인 쿠키(토큰)를 지우고
						regLoginService.deleteAutoLoginData(token);
						//자동로그인 쿠키 무효화
						c.setMaxAge(0);
						c.setValue(null);
						response.addCookie(c);
					}
				}
			}
		}
		
		ModelAndView mav = new ModelAndView("mobile/main");
		return mav;
	}	
	
	@RequestMapping("m/main.do")
	public ModelAndView bottom(Model model, HttpServletRequest request) {
		
		List<MymapVO> myPlanList = new ArrayList<>();
		List<MymapVO> favMapList = new ArrayList<>();
		List<FavoriteplaceVO> favPlaceList = new ArrayList<>();
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("user");
		
//		userid = "test@test.com";
		if(userid != null) {
			//�닿���
			myPlanList = memberService.selectMymapListByuseridForPlan(userid);
			
			//利�李얠���
			List<FavoritemapVO> favMapListRef = mymapService.selectRegmapidx(userid);
			for (int i = 0; i < favMapListRef.size(); i++) {
				MymapVO mymapVO = mymapService.selectMymapByRegmapIdx(favMapListRef.get(i).getRegmapidx());
				favMapList.add(mymapVO);
			}
			
			//利�李얠�μ��
			favPlaceList = mymapService.selectcheckpoint(userid);
							
		}
		model.addAttribute("id", userid);
		model.addAttribute("myPlanList", myPlanList);
		model.addAttribute("favMapList", favMapList);
		model.addAttribute("favPlaceList", favPlaceList);

		ModelAndView mav = new ModelAndView("mobile/main");
		return mav;
	}
	
	@RequestMapping("m/main2.do")
	public ModelAndView moMain2(Model model, HttpServletRequest request) {
		
		List<MymapVO> myMapList = new ArrayList<>();
		List<MymapVO> myPlanList = new ArrayList<>();
		List<MymapVO> favMapList = new ArrayList<>();
		List<FavoriteplaceVO> favPlaceList = new ArrayList<>();
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("user");
		
//		userid = "test@test.com";
		if(userid != null) {
			//�닿���
			myMapList = memberService.selectMymapListByuserid(userid);
			myPlanList = memberService.selectMymapListByuseridForPlan(userid);
			
			//利�李얠���
			List<FavoritemapVO> favMapListRef = mymapService.selectRegmapidx(userid);
			for (int i = 0; i < favMapListRef.size(); i++) {
				MymapVO mymapVO = mymapService.selectMymapByRegmapIdx(favMapListRef.get(i).getRegmapidx());
				favMapList.add(mymapVO);
			}
			
			//利�李얠�μ��
			favPlaceList = mymapService.selectcheckpoint(userid);
							
		}
		model.addAttribute("id", userid);
		model.addAttribute("myPlanList", myPlanList);
		model.addAttribute("favMapList", favMapList);
		model.addAttribute("myMapList", myMapList);
		model.addAttribute("favPlaceList", favPlaceList);

		ModelAndView mav = new ModelAndView("mobile/main2");
		return mav;
	}
	
	@RequestMapping("m/insert.do")
	public void insertData(HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
		String userid = request.getParameter("userid");
		System.out.println(userid);
		Map<String,String> map = fileutils.saveFile(request);
		
		CoordinatesVO testCoord = new CoordinatesVO();
		testCoord.setAccuracy(map.get("accuracy"));
		testCoord.setLat(map.get("lat"));
		testCoord.setLon(map.get("lon"));
		testCoord.setTimestamp(map.get("timestamp"));
		testCoord.setEmail(userid);
		coordinatesService.setCoordinates(testCoord);
	
		
		int coordinatesidx = coordinatesService.selectidx(map.get("timestamp"));
		CheckpointVO checkpoint = new CheckpointVO();
		checkpoint.setContent(map.get("content"));
		checkpoint.setTitle(map.get("title"));
		checkpoint.setCoordinatesidx(coordinatesidx);
		coordinatesService.insertCheckpoint(checkpoint);
		
		int checkpointidx = coordinatesService.selectCheckpointidx(coordinatesidx);
		PhotoVO photo = new PhotoVO();
		photo.setNewname(map.get("newFileName"));
		photo.setOriname(map.get("oriFileName"));
		photo.setCheckpointidx(checkpointidx);
		coordinatesService.insertPhoto(photo);
		
	}
	
	@RequestMapping("/m/setCheckpoint.do")
	@ResponseBody
	public String setCheckpoint(HttpServletRequest request, HttpSession session) throws Exception{
		
		String userid = (String)session.getAttribute("user");
		String title = request.getParameter("setTitle");
		String content = request.getParameter("setContent");
		String lat = request.getParameter("lat");
		String lon = request.getParameter("lon");
		String accuracy = request.getParameter("accuracy");
		
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String today = sdf.format(cal.getTime());
	    String timestamp = String.valueOf(sdf.parse(today).getTime()/1000);
	    
	    CoordinatesVO testCoord = new CoordinatesVO();
		testCoord.setAccuracy(accuracy);
		testCoord.setLat(lat);
		testCoord.setLon(lon);
		testCoord.setTimestamp(timestamp);
		testCoord.setEmail(userid);
		coordinatesService.setCoordinates(testCoord);
		
		int coordinatesidx = coordinatesService.selectidx(timestamp);
		CheckpointVO checkpoint = new CheckpointVO();
		checkpoint.setContent(content);
		checkpoint.setTitle(title);
		checkpoint.setCoordinatesidx(coordinatesidx);
		coordinatesService.insertCheckpoint(checkpoint);
		
		return "complete";
	}
}
