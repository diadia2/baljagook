package kr.co.foot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.coordinates.CoordinatesService;
import kr.co.foot.favoritemap.FavoritemapVO;
import kr.co.foot.favoriteplace.FavoriteplaceVO;
import kr.co.foot.hashtag.HashtagVO;
import kr.co.foot.like.LikeDTO;
import kr.co.foot.like.LikeVO;
import kr.co.foot.mymap.MymapService;
import kr.co.foot.mymap.MymapVO;
import kr.co.foot.photo.PhotoVO;
import kr.co.foot.regcoordinates.RegcoordinatesVO;
import kr.co.foot.regmap.RegmapVO;

@Controller
public class MymapController {

   @Autowired
   private MymapService mymapService;
   @Autowired
   private CoordinatesService coordinatesService;
   
   @RequestMapping("/map/regMymap.do")
   public String regMyMap(@RequestParam("title") String title,
                     @RequestParam("content") String content,
                     @RequestParam("start") String start,
                     @RequestParam("end") String end, HttpSession session,
                     HttpServletRequest request) throws Exception{
      
	  String userid = (String)session.getAttribute("user");
      int type = 1;  
      
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
      
      // t_myMap占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
      mymapService.regMyMap(mymapVO);
      
      // t_myMap index占쏙옙 占쌀뤄옙占쏙옙占쏙옙
      int mymapidx = mymapService.getIndex(regdate); 
      
      // t_regcoordinates占쏙옙 占쏙옙표 占쏙옙占쏙옙占싶듸옙 占쏙옙占쏙옙      
      String getlat = request.getParameter("lat");
      String getlon = request.getParameter("lng");
      String getidk = request.getParameter("idk");
      String[] latArr = getlat.split("/");
      String[] lonArr = getlon.split("/");
      String[] idkArr = getidk.split("/");
      
      for(int i=0; i<latArr.length; i++){
         RegcoordinatesVO regcoordinatesVO = new RegcoordinatesVO();
         String lat = latArr[i];
         String lon = lonArr[i];
         regcoordinatesVO.setLat(lat);
         regcoordinatesVO.setLon(lon);
         regcoordinatesVO.setMymapidx(mymapidx);
         mymapService.insertLonLat(regcoordinatesVO);
      }
      
      // t_regmap占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
      RegmapVO regmapVO = new RegmapVO();
//      String city = request.getParameter("city");
//      String theme = request.getParameter("theme");
      
      int city = 1;
      int theme = 1;
      
      start += ":00";
      end += ":00";
      
      //占쏙옙占쏙옙占�
      SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String sdate = String.valueOf(time1.parse(start).getTime()/1000);
      //占쏙옙占쏙옙占쏙옙
      SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String edate = String.valueOf(time2.parse(end).getTime()/1000);
      
      regmapVO.setSdate(sdate);
      regmapVO.setEdate(edate);
      regmapVO.setMymapidx(mymapidx);
      regmapVO.setCity(city);
      regmapVO.setTheme(theme);
      
      mymapService.insertRegMap(regmapVO);
      
      // t_hashtag占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
      String hashtag = request.getParameter("hashtag").trim();
      String[] nameArr = hashtag.split("#");
      
      for(int i=1; i<nameArr.length; i++){
         HashtagVO hashtagVO = new HashtagVO();
         String name = nameArr[i].trim();
         hashtagVO.setName(name);
         hashtagVO.setMymapidx(mymapidx);
         mymapService.insertHashtag(hashtagVO);
      }
      
      // t_checkpoint 占쏙옙占쏙옙占싶듸옙 占쏙옙占쏙옙
      List<RegcoordinatesVO> regList = mymapService.getRegcoordinatesInfo(mymapidx);
      
      String markerlat = request.getParameter("markerlat");
      String markerlon = request.getParameter("markerlng");
      String markeridx = request.getParameter("markeridx");
      String[] markerlatArr = markerlat.split("/");
      String[] markerlonArr = markerlon.split("/");
      String[] markeridxArr = markeridx.split("/");
      
      String getpaneltitle = request.getParameter("paneltitle");
      String getpanelcontent = request.getParameter("panelcontent");
      String[] ptitleArr = getpaneltitle.split("/");
      String[] pcontentArr = getpanelcontent.split("/");
      
      String photoCheckPointIdx = request.getParameter("photoCheckPointIdx");
      String photoOriName = request.getParameter("photoOriName");
      String photoNewName = request.getParameter("photoNewName");
      String[] photoCheckPointIdxArr = photoCheckPointIdx.split("/");
      String[] photoOriNameArr = photoOriName.split("/");
      String[] photoNewNameArr = photoNewName.split("/");
      
      
      // 占쏙옙커 占쏙옙占쏙옙占쏙옙큼 for占쏙옙
      for(int i=0; i<markerlatArr.length; i++){
         String checkPointLat = markerlatArr[i];
         String checkPointLon = markerlonArr[i];
         String checkPointIdx = markeridxArr[i];
         String paneltitle = ptitleArr[i];
         String panelcontent = pcontentArr[i];
         
         // 占쌔댐옙 占쏙옙커占쏙옙 占쏙옙표占쏙옙 regcoordinates占쏙옙 占쏙옙표占쏙옙 占쏙옙치占싹몌옙 regcoordinatesidx占쏙옙 占쏙옙占쏙옙占싶쇽옙 t_checkpoint占쏙옙 占쏙옙占쏙옙
         for(int j=0; j<regList.size(); j++){
            if(regList.get(j).getLat().equals(checkPointLat) && regList.get(j).getLon().equals(checkPointLon)){
               CheckpointVO checkpointVO = new CheckpointVO();
               checkpointVO.setRegcoordinatesidx(regList.get(j).getIdx());
               checkpointVO.setTitle(paneltitle);
               checkpointVO.setContent(panelcontent);
               mymapService.insertCheckpoint(checkpointVO);
               CheckpointVO cpVO = mymapService.selectCheckPoint(regList.get(j).getIdx());
               System.out.println(cpVO);
               for(int k=0; k<photoCheckPointIdxArr.length; k++){
            	   String pcpi = photoCheckPointIdxArr[k];
            	   String pon = photoOriNameArr[k];
            	   String pnn = photoNewNameArr[k];
            	   System.out.println(pcpi);
            	   System.out.println(pon);
            	   System.out.println(pnn);
            	   System.out.println(checkPointIdx);
            	   if(checkPointIdx.equals(pcpi)){
            		   PhotoVO photoVO = new PhotoVO();
            		   photoVO.setOriname(pon);
            		   photoVO.setNewname(pnn);
            		   photoVO.setCheckpointidx(cpVO.getIdx());
            		   coordinatesService.insertPhoto(photoVO);
            		   break;
            	   }

               }
            }
         }
      }

      return "redirect:/";
   }
   
   
   @RequestMapping("/map/planMymap.do")
   public String planMymap(@RequestParam("title") String title,
                     @RequestParam("content") String content, HttpSession session,
                     HttpServletRequest request) throws ParseException{
      
	  String userid = (String)session.getAttribute("user");
      
      // t_mymap占쏙옙 占쏙옙占쏙옙占싫� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
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
      
      // t_myMap index占쏙옙 占쌀뤄옙占쏙옙占쏙옙
      int mymapidx = mymapService.getIndex(regdate);
      
      // t_regcoordinates占쏙옙 占쏙옙표 占쏙옙占쏙옙占싶듸옙 占쏙옙占쏙옙      
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
      
      // t_checkpoint 占쏙옙占쏙옙占싶듸옙 占쏙옙占쏙옙
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
   
	@RequestMapping(value = "/map/searchList.do", method = RequestMethod.GET)
	public String searchList(@RequestParam("searchtext") String searchtext, @RequestParam("moreCount") int moreCount, Model model, HttpServletRequest request){
		
		List<MymapVO> mymapList = mymapService.selectMymapList(searchtext, 4*moreCount);//5*1 더보기 누르면 5*2 5*3  
		System.out.println(mymapList.size());
		List<HashtagVO> hashtagList = new ArrayList<HashtagVO>();
		
		//View로 넘길 like 해시맵 생성
		HashMap<Integer, Integer> likeMap = new HashMap<Integer, Integer>();
		//View로 넘길 like 체크용 해시맵 생성
		HashMap<Integer, Boolean> likeAlreadyChecked = new HashMap<Integer, Boolean>();
		//like 수 초기화
		int likeCnt = 0;
		
		HashMap<Integer, Integer> viewcntMap = new HashMap<Integer, Integer>();
		int viewcnt = 0;
		
		for(int i=0; i<mymapList.size(); i++){
			
			// 占싯삼옙占쏙옙占쎈에 占승댐옙 mymapidx 占쌀뤄옙占쏙옙占쏙옙
			List<HashtagVO> eachHashtagList = mymapService.getHashtagList(mymapList.get(i).getIdx());
			// 占쏙옙 mymapidx占쏙옙 占승댐옙 t_hashtag 占쌀뤄옙占쏙옙占쏙옙
			for(int j=0; j<eachHashtagList.size(); j++){
				hashtagList.add(eachHashtagList.get(j));
			}
		}
	
		// mymapidx占쏙옙 占승댐옙 t_regmap 占쌀뤄옙占쏙옙占쏙옙
		List<RegmapVO> regmapList = new ArrayList<RegmapVO>();
		for(int i=0; i<mymapList.size(); i++){
			RegmapVO getRegmap = mymapService.getRegmapList(mymapList.get(i).getIdx());
			regmapList.add(getRegmap);
			viewcnt = getRegmap.getViewcnt();
			viewcntMap.put(mymapList.get(i).getIdx(), viewcnt);
		}
		
		//Session에 저장된 userid 확인
		HttpSession session = request.getSession(true);
		String loggedUserid = (String) session.getAttribute("user");
		System.out.println("로그인중인 사용자: " + loggedUserid);
		
		//Like
		List<String> userList = new ArrayList<String>();
		for(int i=0; i<mymapList.size(); i++) {
			userList = mymapService.getLikeCnt(mymapList.get(i).getIdx());
			if(userList == null) {
				likeCnt = 0;
			} else {
				likeCnt = userList.size();
			}
			
			//로그인된 userid가 이미 게시글을 '좋아요' 했다면 hashmap에 정보 저장
			if(userList.contains(loggedUserid)) {
				likeAlreadyChecked.put(mymapList.get(i).getIdx(), true);
			}
			
			likeMap.put(mymapList.get(i).getIdx(), likeCnt);	
		}
		
		
		model.addAttribute("mymapList", mymapList);
		model.addAttribute("hashtagList", hashtagList);
		model.addAttribute("likeMap", likeMap);
		model.addAttribute("likeAlreadyChecked", likeAlreadyChecked);
		model.addAttribute("viewcntMap", viewcntMap);
		
		return "search/searchList";
	}
	
	@RequestMapping(value = "/map/search.do", method = RequestMethod.GET)
	public String search(@RequestParam("searchtext") String searchtext, Model model, HttpServletRequest request){
		int moreCount = 1;
		model.addAttribute("searchtext", searchtext);
		model.addAttribute("moreCount", moreCount);
		
		return "search/search";
	}
   
   @RequestMapping("/map/detail.do")
   public String detail(HttpServletRequest request, Model model){
      
      int mymapidx = Integer.parseInt(request.getParameter("mymapidx"));
      SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
      
      // mympaidx占쏙옙 t_mymap 占쌀뤄옙占쏙옙占쏙옙
      MymapVO mymapVO = mymapService.selectMymap(mymapidx);
      // mymapidx占쏙옙 t_regmap 占쌀뤄옙占쏙옙占쏙옙
      RegmapVO regmapVO = mymapService.getRegmapList(mymapidx);
      
      String start = regmapVO.getSdate();
      String end = regmapVO.getEdate();
      start += "000";
      end += "000";
      String sdate = sd.format(new Date(Long.valueOf(start)));
      String edate = sd.format(new Date(Long.valueOf(end)));
      
      List<HashtagVO> hashtagList = mymapService.getHashtagList(mymapidx);
      
      List<RegcoordinatesVO> regcoordinatesList = mymapService.getRegmapsList(mymapidx);
      
      List<CheckpointVO> checkpointVO = new ArrayList<CheckpointVO>();
      for(int i=0; i<regcoordinatesList.size(); i++){
         CheckpointVO cpVO = mymapService.selectCheckPoint(regcoordinatesList.get(i).getIdx());
         if(cpVO!=null){
        	 checkpointVO.add(cpVO);
         }
      }
      for(CheckpointVO vo : checkpointVO){
    	  System.out.println(vo);
      }
      List<PhotoVO> photoList = new ArrayList<PhotoVO>();
      for(int i=0; i<checkpointVO.size(); i++){
    	  PhotoVO photoVO = mymapService.selectPhoto(checkpointVO.get(i).getIdx());
    	  if(photoVO != null){
    		  photoList.add(photoVO);
    	  }
      }
      
      // 조회 수 증가
      mymapService.increaseViewCnt(mymapidx);
      
      model.addAttribute("mymapidx", mymapidx);
      model.addAttribute("mymapVO", mymapVO);
      model.addAttribute("sdate", sdate);
      model.addAttribute("edate", edate);
      model.addAttribute("hashtagList", hashtagList);
      model.addAttribute("regcoordinatesList", regcoordinatesList);
      model.addAttribute("checkpointVO", checkpointVO);
      model.addAttribute("photoList", photoList);
       
      return "search/detail";
   }
   
   /**
    * 占쏙옙占� 占쏙옙占시ｏ옙占� 占쌩곤옙
    * @param idx
    * @return
    */
   @RequestMapping("/map/getFavoritePlace.do")
   @ResponseBody
   public String getFavoritePlace(@RequestParam("idx") String idx,
                           @RequestParam("placename") String placename, HttpSession session){
      System.out.println(idx);
      System.out.println(placename);
      // 占쏙옙占쏙옙占쏙옙 占쏙옙커
      int checkpointidx = Integer.parseInt(idx);
      // 占쏙옙占쏙옙占쏙옙占싱듸옙
      String userid = (String)session.getAttribute("user");
      // 占쏙옙占쏙옙 占쏙옙占싱듸옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙杉占� 占쏙옙커占쏙옙 占쏙옙회
      List<FavoriteplaceVO> compareCheckPointidx = mymapService.selectcheckpoint(userid);
      // 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙커占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙커占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 체크
      if(compareCheckPointidx != null){
         for(int i=0; i<compareCheckPointidx.size(); i++){
            if(checkpointidx == compareCheckPointidx.get(i).getCheckpointidx()){
               return "already registed";
            }
         }
      }
      // 占쏙옙占쏙옙占싼곤옙 占쏙옙占쏙옙占쏙옙 占쏙옙占�
      FavoriteplaceVO favoriteplaceVO = new FavoriteplaceVO();
      favoriteplaceVO.setCheckpointidx(checkpointidx);
      favoriteplaceVO.setUserid(userid);
      favoriteplaceVO.setPlacename(placename);
      
      mymapService.insertFavoritePlace(favoriteplaceVO);
      return "register complete";
   }
   
   @RequestMapping("/map/getFavoriteMap.do")
   @ResponseBody
   public String getFavoriteMap(@RequestParam("mymapidx") String mymapidxstr, HttpSession session){
      
      // 占쏙옙占쏙옙 占쏙옙占싱듸옙
	   String userid = (String)session.getAttribute("user");
      // 占쏙옙占쏙옙占쏙옙 占쏙옙 mymapidx 占쏙옙
      int mymapidx = Integer.parseInt(mymapidxstr);
      // mymapidx占쏙옙占쏙옙占쏙옙 regmapidx 占쌀뤄옙占쏙옙占쏙옙
      RegmapVO getRegmap = mymapService.getRegmapList(mymapidx);
      List<FavoritemapVO> compareRegmapidx = mymapService.selectRegmapidx(userid);
      
      if(compareRegmapidx != null){
         for(int i=0; i<compareRegmapidx.size(); i++){
            if(getRegmap.getIdx() == compareRegmapidx.get(i).getRegmapidx()){
               return "already registed";
            }
         }
      }
      FavoritemapVO favoritemapVO = new FavoritemapVO();
      favoritemapVO.setRegmapidx(getRegmap.getIdx());
      favoritemapVO.setUserid(userid);
      mymapService.insertFavoriteMap(favoritemapVO);
      
      return "register complete";
   }
   
   
   @RequestMapping("/map/plantrip.do")
   public String plantrip(Model model, HttpSession session){
      
	   String userid = (String)session.getAttribute("user");
      List<FavoriteplaceVO> favoriteplaceList = mymapService.selectcheckpoint(userid);
      List<FavoritemapVO> favoritemapList = mymapService.selectRegmapidx(userid);
      
      List<MymapVO> mymapList = new ArrayList<MymapVO>();
      
      for(int i=0; i<favoritemapList.size(); i++){
         MymapVO mymapVO = mymapService.selectMymapByRegmapIdx(favoritemapList.get(i).getRegmapidx());
         mymapList.add(mymapVO);
      }
      
      List<MymapVO> mymapListPlanAndReg = mymapService.selectMymapByuserid(userid);
      
      model.addAttribute("favoriteplaceList", favoriteplaceList);
      model.addAttribute("favoritemapList", favoritemapList);
      model.addAttribute("mymapList", mymapList);
      model.addAttribute("mymapListPlanAndReg", mymapListPlanAndReg);
      
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
   public Object[] getMymap(@RequestParam("mymapidx") String mymapidxstr){
      
      int mymapidx = Integer.parseInt(mymapidxstr);
      
      List<RegcoordinatesVO> regcoordinatesVO = mymapService.getRegcoordinatesInfo(mymapidx);
      List<CheckpointVO> checkpointList = new ArrayList<CheckpointVO>();
      
      for(int i=0; i<regcoordinatesVO.size(); i++){
         CheckpointVO checkpointVO = mymapService.selectCheckPoint(regcoordinatesVO.get(i).getIdx());
         checkpointList.add(checkpointVO);
      }
      
      for(CheckpointVO vo : checkpointList){
         System.out.println(vo);
      }
      
      Object[] object = {regcoordinatesVO, checkpointList};
      
      return object;
   }
   
//	Like
	@RequestMapping(value="/like.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<Integer, Integer> like(@RequestBody LikeDTO likeDTO, HttpServletRequest request) throws Exception {
		
		System.out.println("like 컨트롤러로 들어옴");
		System.out.println(likeDTO);
		
		//검색페이지에 나온 mymapidx를 통해 해당 게시물의 regmapidx 추출
		String userid = likeDTO.getUserid();
		int mymapidx = likeDTO.getMymapidxRef();
		int regmapidx = mymapService.getRegmapIdx(mymapidx);
	
		LikeVO likeVO = new LikeVO();
		likeVO.setUserid(userid);
		likeVO.setRegmapidx(regmapidx);
		
		mymapService.insertLikeInfo(likeVO);
		
		//사용자가 like 클릭 시 업데이트된 likeCnt 데이터 전송
		HashMap<Integer, Integer> likeMap = new HashMap<Integer, Integer>();
		int likeCnt = 0;
		List<String> userList = new ArrayList<String>();
		userList = mymapService.getLikeCnt(mymapidx);
		if(userList == null) {
			likeCnt = 0;
		} else {
			likeCnt = userList.size();
		}
			
		likeMap.put(mymapidx, likeCnt);
			
		return likeMap;
	}
	
//	Unlike	
	@RequestMapping(value="/unlike.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<Integer, Integer> unlike(@RequestBody LikeDTO likeDTO, HttpServletRequest request) throws Exception {
		
		System.out.println("like 컨트롤러로 들어옴");
		System.out.println(likeDTO);
		
		//검색페이지에 나온 mymapidx를 통해 해당 게시물의 regmapidx 추출
		String userid = likeDTO.getUserid();
		int mymapidx = likeDTO.getMymapidxRef();
		int regmapidx = mymapService.getRegmapIdx(mymapidx);
	
		LikeVO likeVO = new LikeVO();
		likeVO.setUserid(userid);
		likeVO.setRegmapidx(regmapidx);
		
		mymapService.deleteLikeInfo(likeVO);
		
		//사용자가 unlike 클릭 시 업데이트된 likeCnt 데이터 전송
		HashMap<Integer, Integer> likeMap = new HashMap<Integer, Integer>();
		int likeCnt = 0;
		List<String> userList = new ArrayList<String>();
		userList = mymapService.getLikeCnt(mymapidx);
		if(userList == null) {
			likeCnt = 0;
		} else {
			likeCnt = userList.size();
		}
			
		likeMap.put(mymapidx, likeCnt);
			
		return likeMap;
	}   
   
   
}