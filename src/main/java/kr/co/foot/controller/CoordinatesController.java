package kr.co.foot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.foot.checkpoint.CheckpointVO;
import kr.co.foot.coordinates.CoordinatesService;
import kr.co.foot.coordinates.CoordinatesVO;
import kr.co.foot.mymap.MymapService;
import kr.co.foot.photo.PhotoVO;



@Controller
public class CoordinatesController {

   CoordinatesVO testCoord = new CoordinatesVO();

   @Autowired
   private CoordinatesService coordinatesService;
   @Autowired
   private MymapService mymapService;

   @RequestMapping(value = "/setCoordinatesPOST.do", method = RequestMethod.POST)
   public void setCoordinatesPOST(HttpServletRequest request, @RequestParam("lon") String lon,
         @RequestParam("lat") String lat,
         @RequestParam("timestamp") String timestamp, @RequestParam("accuracy") String accuracy, HttpSession session) {
      
     String userid = (String)session.getAttribute("user");
      testCoord.setLat(lat);
      testCoord.setLon(lon);
      testCoord.setEmail(userid);
      testCoord.setTimestamp(timestamp);
      testCoord.setAccuracy(accuracy);

      System.out.println(lat);
      System.out.println(lon);
      System.out.println(userid);
      System.out.println(timestamp);
      System.out.println(accuracy);

      coordinatesService.setCoordinates(testCoord); 
   }
   
   @RequestMapping("/map/mapcheck.do") 
   public String goMap(HttpServletRequest request,
         @RequestParam("start") String start,
         @RequestParam("end") String end, 
         @RequestParam("title") String title, 
         @RequestParam("hashtag") String hashtag,
         @RequestParam("content") String content, Model model, HttpSession session) throws ParseException{
      
      String id = (String)session.getAttribute("user");
      
//      String id = "test@test.com";
      
      start += ":00";
      end += ":00";
      
      SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String startTime = String.valueOf(time1.parse(start).getTime()/1000);
      
      SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String endTime = String.valueOf(time2.parse(end).getTime()/1000);

      List<CoordinatesVO> list = coordinatesService.getLonLat(startTime, endTime, id);
      
      List<CheckpointVO> checkpointList = new ArrayList<CheckpointVO>();
      for(int i=0; i<list.size(); i++){
         CheckpointVO checkpointVO = mymapService.selectCheckpointByCoorIdx(list.get(i).getIdk());
         if(checkpointVO != null){
            checkpointList.add(checkpointVO);
         }
      }

      System.out.println("=====================");
      List<PhotoVO> photoList = new ArrayList<PhotoVO>();
      if(checkpointList != null){
	      for(int i=0; i<checkpointList.size(); i++){
	    	  System.out.println(checkpointList.get(i).getIdx());
	    	  PhotoVO photoVO = mymapService.selectPhoto(checkpointList.get(i).getIdx());
	    	  if(photoVO != null){
	    		  photoList.add(photoVO);
	    	  }
	      }
      } 
/*      String[] cityArr = request.getParameterValues("city");
      String city = "";
      for(int i=0; i<cityArr.length; i++){
         if(i != cityArr.length-1){
            city += cityArr[i];
            city += ",";
         } else{
            city += cityArr[i];
         }
      }
      
      String[] themeArr = request.getParameterValues("theme");
      String theme = "";
      
      for(int i=0; i<themeArr.length; i++){
         if(i != themeArr.length-1){
            theme += themeArr[i];
            theme += ",";
         } else{
            theme += themeArr[i];
         }
      }
      */
      model.addAttribute("list", list);
      model.addAttribute("checkpointList", checkpointList);
      model.addAttribute("photoList", photoList);
      model.addAttribute("start", start);
      model.addAttribute("end", end);
      model.addAttribute("title", title);
      model.addAttribute("content", content);
      model.addAttribute("hashtag", hashtag);
/*      model.addAttribute("city", city);
      model.addAttribute("theme", theme);*/
      return "MapTest/regtrip";
   }
   

   // ajax
   @RequestMapping("/map/mapAgain.do")
   @ResponseBody
   public Object mapAgain(@RequestParam("start") String start, @RequestParam("end") String end, Model model, HttpSession session) throws ParseException{

     String id = (String)session.getAttribute("user");

      
      start += ":00";
      end += ":00";
      
      SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String startTime = String.valueOf(time1.parse(start).getTime()/1000);
      
      SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String endTime = String.valueOf(time2.parse(end).getTime()/1000);
      System.out.println("startTime: "+startTime);
      System.out.println("endTime: "+endTime);
      List<CoordinatesVO> list = coordinatesService.getLonLat(startTime, endTime, id);
      
      List<CheckpointVO> checkpointList = new ArrayList<CheckpointVO>();
      for(int i=0; i<list.size(); i++){
         CheckpointVO checkpointVO = mymapService.selectCheckpointByCoorIdx(list.get(i).getIdk());
         if(checkpointVO != null){
            checkpointList.add(checkpointVO);
         }
      }
      
      List<PhotoVO> photoList = new ArrayList<PhotoVO>();
      if(checkpointList != null){
         for(int i=0; i<checkpointList.size(); i++){
            PhotoVO photoVO = mymapService.selectPhoto(checkpointList.get(i).getIdx());
            if(photoVO != null){
               photoList.add(photoVO);
            }
         }
      } 

      model.addAttribute("list", list);

      Object[] object = {list,checkpointList,photoList};
      
      return object;
   }

   
}