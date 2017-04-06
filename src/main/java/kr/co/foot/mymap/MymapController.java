package kr.co.foot.mymap;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.favoritemap.FavoritemapVO;
import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.hashtag.HashtagVO;
import kr.co.foot.regcoordinates.RegcoordinatesVO;
import kr.co.foot.regmap.RegmapVO;



@Controller
public class MymapController {

	@Autowired
	private MymapService mymapService;
	
	@RequestMapping("/map/regMymap.do")
	public String regMyMap(@RequestParam("title") String title,
						   @RequestParam("content") String content,
						   @RequestParam("start") String start,
						   @RequestParam("end") String end,
						   HttpServletRequest request) throws Exception{
		
		
		String userid = "test@test.com";
		int type = 1;  //등록=1, 계획=2
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sdf.format(cal.getTime());
		String regdate = String.valueOf(sdf.parse(today).getTime()/1000);
		
		MymapVO mymapVO = new MymapVO();
		mymapVO.setTitle(title);
		mymapVO.setContent(content);
		mymapVO.setUserid(userid);
		mymapVO.setType(type);
		mymapVO.setRegdate(regdate);
		
		// t_myMap에 데이터 삽입
		mymapService.regMyMap(mymapVO);
		
		// t_myMap index값 불러오기
		int mymapidx = mymapService.getIndex(regdate); 
		
		// t_regcoordinates에 좌표 데이터들 삽입		
		String getlat = request.getParameter("lat");
		String getlon = request.getParameter("lng");
		String[] latArr = getlat.split("/");
		String[] lonArr = getlon.split("/");
		
		for(int i=0; i<latArr.length; i++){
			RegcoordinatesVO regcoordinatesVO = new RegcoordinatesVO();
			String lat = latArr[i];
			String lon = lonArr[i];
			regcoordinatesVO.setLat(lat);
			regcoordinatesVO.setLon(lon);
			regcoordinatesVO.setMymapidx(mymapidx);
			mymapService.insertLonLat(regcoordinatesVO);
		}
		
		// t_regmap에 데이터 삽입
		RegmapVO regmapVO = new RegmapVO();
//		String city = request.getParameter("city");
//		String theme = request.getParameter("theme");
		
		int city = 1;
		int theme = 1;
		
		start += ":00";
		end += ":00";
		
		//출발일
		SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sdate = String.valueOf(time1.parse(start).getTime()/1000);
		//도착일
		SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String edate = String.valueOf(time2.parse(end).getTime()/1000);
		
		regmapVO.setSdate(sdate);
		regmapVO.setEdate(edate);
		regmapVO.setMymapidx(mymapidx);
		regmapVO.setCity(city);
		regmapVO.setTheme(theme);
		
		mymapService.insertRegMap(regmapVO);
		
		// t_hashtag에 데이터 삽입
		String hashtag = request.getParameter("hashtag").trim();
		String[] nameArr = hashtag.split("#");
		
		for(int i=1; i<nameArr.length; i++){
			HashtagVO hashtagVO = new HashtagVO();
			String name = nameArr[i].trim();
			hashtagVO.setName(name);
			hashtagVO.setMymapidx(mymapidx);
			mymapService.insertHashtag(hashtagVO);
		}
		
		// t_checkpoint 데이터들 삽입
		List<RegcoordinatesVO> regList = mymapService.getRegcoordinatesInfo(mymapidx);
		
		String markerlat = request.getParameter("markerlat");
		String markerlon = request.getParameter("markerlng");
		String[] markerlatArr = markerlat.split("/");
		String[] markerlonArr = markerlon.split("/");
		
		String getpaneltitle = request.getParameter("paneltitle");
		String getpanelcontent = request.getParameter("panelcontent");
		String[] ptitleArr = getpaneltitle.split("/");
		String[] pcontentArr = getpanelcontent.split("/");
		
		// 마커 갯수만큼 for문
		for(int i=0; i<markerlatArr.length; i++){
			String checkPointLat = markerlatArr[i];
			String checkPointLon = markerlonArr[i];
			String paneltitle = ptitleArr[i];
			String panelcontent = pcontentArr[i];
			
			// 해당 마커의 좌표가 regcoordinates의 좌표와 일치하면 regcoordinatesidx를 가져와서 t_checkpoint에 삽입
			for(int j=0; j<regList.size(); j++){
				if(regList.get(j).getLat().equals(checkPointLat) && regList.get(j).getLon().equals(checkPointLon)){
					CheckpointVO checkpointVO = new CheckpointVO();
					checkpointVO.setRegcoordinatesidx(regList.get(j).getIdx());
					checkpointVO.setTitle(paneltitle);
					checkpointVO.setContent(panelcontent);
					mymapService.insertCheckpoint(checkpointVO);
				}
			}
		}

		return "redirect:/";
	}
	
	
	@RequestMapping("/map/planMymap.do")
	public String planMymap(@RequestParam("title") String title,
							@RequestParam("content") String content,
							HttpServletRequest request) throws ParseException{
		
		String userid = "plan@makeplan.com";
		
		// t_mymap에 여행계획 데이터 삽입
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sdf.format(cal.getTime());
		String regdate = String.valueOf(sdf.parse(today).getTime()/1000);
		
		MymapVO mymapVO = new MymapVO();
		mymapVO.setUserid(userid);
		mymapVO.setTitle(title);
		mymapVO.setContent(content);
		mymapVO.setType(2);
		mymapVO.setRegdate(regdate);
		mymapService.regMyMap(mymapVO);
		
		// t_myMap index값 불러오기
		int mymapidx = mymapService.getIndex(regdate);
		
		// t_regcoordinates에 좌표 데이터들 삽입		
		String getlat = request.getParameter("lat");
		String getlon = request.getParameter("lng");
		String[] latArr = getlat.split("/");
		String[] lonArr = getlon.split("/");
		
		for(int i=0; i<latArr.length; i++){
			RegcoordinatesVO regcoordinatesVO = new RegcoordinatesVO();
			String lat = latArr[i];
			String lon = lonArr[i];
			regcoordinatesVO.setLat(lat);
			regcoordinatesVO.setLon(lon);
			regcoordinatesVO.setMymapidx(mymapidx);
			mymapService.insertLonLat(regcoordinatesVO);
		}
		
		// t_checkpoint 데이터들 삽입
		List<RegcoordinatesVO> regList = mymapService.getRegcoordinatesInfo(mymapidx);
		
		String markerlat = request.getParameter("markerlat");
		String markerlon = request.getParameter("markerlng");
		String[] markerlatArr = markerlat.split("/");
		String[] markerlonArr = markerlon.split("/");
		
		String getpaneltitle = request.getParameter("paneltitle");
		String getpanelcontent = request.getParameter("panelcontent");
		String[] ptitleArr = getpaneltitle.split("/");
		String[] pcontentArr = getpanelcontent.split("/");
		
		for(int i=0; i<markerlatArr.length; i++){
			String checkPointLat = markerlatArr[i];
			String checkPointLon = markerlonArr[i];
			String paneltitle = ptitleArr[i];
			String panelcontent = pcontentArr[i];
			for(int j=0; j<regList.size(); j++){
				if(regList.get(j).getLat().equals(checkPointLat) && regList.get(j).getLon().equals(checkPointLon)){
					CheckpointVO checkpointVO = new CheckpointVO();
					checkpointVO.setRegcoordinatesidx(regList.get(j).getIdx());
					checkpointVO.setTitle(paneltitle);
					checkpointVO.setContent(panelcontent);
					mymapService.insertCheckpoint(checkpointVO);
				}
			}
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/map/search.do")
	public String search(@RequestParam("searchtext") String searchtext, Model model){
		
		List<MymapVO> mymapList = mymapService.selectMymapList(searchtext);
		List<HashtagVO> hashtagList = new ArrayList<HashtagVO>();
		
		for(int i=0; i<mymapList.size(); i++){
			
			// 검색내용에 맞는 mymapidx 불러오기
			List<HashtagVO> eachHashtagList = mymapService.getHashtagList(mymapList.get(i).getIdx());
			// 각 mymapidx에 맞는 t_hashtag 불러오기
			for(int j=0; j<eachHashtagList.size(); j++){
				hashtagList.add(eachHashtagList.get(j));
			}
		}
	
		// mymapidx에 맞는 t_regmap 불러오기
		List<RegmapVO> regmapList = new ArrayList<RegmapVO>();
		for(int i=0; i<mymapList.size(); i++){
			RegmapVO getRegmap = mymapService.getRegmapList(mymapList.get(i).getIdx());
			regmapList.add(getRegmap);
		}
		
		model.addAttribute("mymapList", mymapList);
		model.addAttribute("hashtagList", hashtagList);
		
		return "search/search";
	}
	
	@RequestMapping("/map/detail.do")
	public String detail(HttpServletRequest request, Model model){
		
		int mymapidx = Integer.parseInt(request.getParameter("mymapidx"));
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		// mympaidx로 t_mymap 불러오기
		MymapVO mymapVO = mymapService.selectMymap(mymapidx);
		// mymapidx로 t_regmap 불러오기
		RegmapVO regmapVO = mymapService.getRegmapList(mymapidx);
		
		String start = regmapVO.getSdate();
		String end = regmapVO.getEdate();
		start += "000";
		end += "000";
		String sdate = sd.format(new Date(Long.valueOf(start)));
		String edate = sd.format(new Date(Long.valueOf(end)));
		
		// mymapidx로 t_hashtag 가져오기
		List<HashtagVO> hashtagList = mymapService.getHashtagList(mymapidx);
		
		// mymapidx로 t_regmap 리스트로 가져오기
		List<RegcoordinatesVO> regcoordinatesList = mymapService.getRegmapsList(mymapidx);
		
		//coordinatesidx로 t_checkpoint 불러오기
		List<CheckpointVO> checkpointVO = new ArrayList<CheckpointVO>();
		for(int i=0; i<regcoordinatesList.size(); i++){
			CheckpointVO cpVO = mymapService.selectCheckPoint(regcoordinatesList.get(i).getIdx());
			if(cpVO.getIdx()==0 || cpVO==null){
				
			} else{
				checkpointVO.add(cpVO);
			}
		}
		
		model.addAttribute("mymapidx", mymapidx);
		model.addAttribute("mymapVO", mymapVO);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		model.addAttribute("hashtagList", hashtagList);
		model.addAttribute("regcoordinatesList", regcoordinatesList);
		model.addAttribute("checkpointVO", checkpointVO);
		 
		return "search/detail";
	}
	
	/**
	 * 장소 즐겨찾기 추가
	 * @param idx
	 * @return
	 */
	@RequestMapping("/map/getFavoritePlace.do")
	@ResponseBody
	public String getFavoritePlace(@RequestParam("idx") String idx,
								   @RequestParam("placename") String placename){
		
		// 선택한 마커
		int checkpointidx = Integer.parseInt(idx);
		// 유저아이디
		String userid = "test@test.com";
		// 유저 아이디로 기존에 등록했던 마커들 조회
		List<FavoriteplaceVO> compareCheckPointidx = mymapService.selectcheckpoint(userid);
		// 기존에 등록한 마커와 새로 등록할 마커중 동일 여부 체크
		if(compareCheckPointidx != null){
			for(int i=0; i<compareCheckPointidx.size(); i++){
				if(checkpointidx == compareCheckPointidx.get(i).getCheckpointidx()){
					return "이미 등록되어 있습니다.";
				}
			}
		}
		// 동일한거 없으면 등록
		FavoriteplaceVO favoriteplaceVO = new FavoriteplaceVO();
		favoriteplaceVO.setCheckpointidx(checkpointidx);
		favoriteplaceVO.setUserid(userid);
		favoriteplaceVO.setPlacename(placename);
		
		mymapService.insertFavoritePlace(favoriteplaceVO);
		return "장소 저장 완료";
	}
	
	@RequestMapping("/map/getFavoriteMap.do")
	@ResponseBody
	public String getFavoriteMap(@RequestParam("mymapidx") String mymapidxstr){
		
		// 유저 아이디
		String userid = "test1@test.com";
		// 선택한 맵 mymapidx 값
		int mymapidx = Integer.parseInt(mymapidxstr);
		// mymapidx값으로 regmapidx 불러오기
		RegmapVO getRegmap = mymapService.getRegmapList(mymapidx);
		List<FavoritemapVO> compareRegmapidx = mymapService.selectRegmapidx(userid);
		
		if(compareRegmapidx != null){
			for(int i=0; i<compareRegmapidx.size(); i++){
				if(getRegmap.getIdx() == compareRegmapidx.get(i).getRegmapidx()){
					return "이미 등록되어 있습니다.";
				}
			}
		}
		FavoritemapVO favoritemapVO = new FavoritemapVO();
		favoritemapVO.setRegmapidx(getRegmap.getIdx());
		favoritemapVO.setUserid(userid);
		mymapService.insertFavoriteMap(favoritemapVO);
		
		return "맵 저장 완료";
	}
	
	
	@RequestMapping("/map/plantrip.do")
	public String plantrip(Model model){
		
		String userid = "test1@test.com";
		List<FavoriteplaceVO> favoriteplaceList = mymapService.selectcheckpoint(userid);
		List<FavoritemapVO> favoritemapList = mymapService.selectRegmapidx(userid);
		
		List<MymapVO> mymapList = new ArrayList<MymapVO>();
		
		for(int i=0; i<favoritemapList.size(); i++){
			MymapVO mymapVO = mymapService.selectMymapByRegmapIdx(favoritemapList.get(i).getRegmapidx());
			mymapList.add(mymapVO);
		}
		
		model.addAttribute("favoriteplaceList", favoriteplaceList);
		model.addAttribute("favoritemapList", favoritemapList);
		model.addAttribute("mymapList", mymapList);
		
		return "MapTest/plantrip";

	}
	
	@RequestMapping("/map/getMyplace.do")
	@ResponseBody
	public RegcoordinatesVO getMyplace(@RequestParam("checkpointidx") String checkpointidx){
		
		CheckpointVO checkpointVO = mymapService.selectCheckPointByIdx(checkpointidx);
		RegcoordinatesVO regcoordinateVO = mymapService.getRegcoordinatesInfoByIdx(checkpointVO.getRegcoordinatesidx());
		
		return regcoordinateVO;
	}
	
	@RequestMapping("/map/getMymap.do")
	@ResponseBody
	public List<RegcoordinatesVO> getMymap(@RequestParam("mymapidx") String mymapidxstr){
		
		int mymapidx = Integer.parseInt(mymapidxstr);
		
		List<RegcoordinatesVO> regcoordinatesVO = mymapService.getRegcoordinatesInfo(mymapidx);
		
		return regcoordinatesVO;
	}
	
	
}
