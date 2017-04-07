package kr.co.foot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import kr.co.foot.coordinates.CoordinatesService;
import kr.co.foot.coordinates.CoordinatesVO;



@Controller
public class CoordinatesController {

   CoordinatesVO testCoord = new CoordinatesVO();

   @Autowired
   private CoordinatesService coordinatesService;

   @RequestMapping(value = "/setCoordinatesPOST", method = RequestMethod.POST)
   public void setCoordinatesPOST(HttpServletRequest request, @RequestParam("lon") String lon,
         @RequestParam("lat") String lat, @RequestParam("email") String email,
         @RequestParam("timestamp") String timestamp, @RequestParam("accuracy") String accuracy) {

      testCoord.setLat(lat);
      testCoord.setLon(lon);
      testCoord.setEmail(email);
      testCoord.setTimestamp(timestamp);
      testCoord.setAccuracy(accuracy);

      System.out.println(lat);
      System.out.println(lon);
      System.out.println(email);
      System.out.println(timestamp);
      System.out.println(accuracy);

      coordinatesService.setCoordinates(testCoord); 
   }
   
   @RequestMapping("/map/mapFront.do") 
   public String mapFront(){
      
      return "MapTest/frontregtrip";
   }
   
   @RequestMapping("/map/mapcheck.do") 
   public String goMap(HttpServletRequest request,
         @RequestParam("start") String start,
         @RequestParam("end") String end, 
         @RequestParam("title") String title, 
         @RequestParam("hashtag") String hashtag,
         @RequestParam("content") String content, Model model, HttpSession session) throws ParseException{
      
//      String id = session.getAttribute("email");
      
      String id = "ghosdi0624@naver.com";
      
      start += ":00";
      end += ":00";
      
      SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String startTime = String.valueOf(time1.parse(start).getTime()/1000);
      
      SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String endTime = String.valueOf(time2.parse(end).getTime()/1000);

      List<CoordinatesVO> list = coordinatesService.getLonLat(startTime, endTime, id);
      
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
      model.addAttribute("start", start);
      model.addAttribute("end", end);
      model.addAttribute("title", title);
      model.addAttribute("content", content);
      model.addAttribute("hashtag", hashtag);
/*      model.addAttribute("city", city);
      model.addAttribute("theme", theme);*/
      
      return "MapTest/regtrip";
   }
   

   // ajax�κ�
   @RequestMapping("/map/mapAgain.do")
   @ResponseBody
   public List<CoordinatesVO> mapAgain(@RequestParam("start") String start, @RequestParam("end") String end, Model model) throws ParseException{
      
      String id = "ghosdi0624@naver.com";
      
      start += ":00";
      end += ":00";
      
      SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String startTime = String.valueOf(time1.parse(start).getTime()/1000);
      
      SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String endTime = String.valueOf(time2.parse(end).getTime()/1000);
      
      List<CoordinatesVO> list = coordinatesService.getLonLat(startTime, endTime, id);

      model.addAttribute("list", list);

      System.out.println("����");
      
      return list;
   }

   
}