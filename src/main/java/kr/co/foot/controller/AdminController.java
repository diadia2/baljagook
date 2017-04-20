package kr.co.foot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.foot.coordinates.CoordinatesService;
import kr.co.foot.mymap.MymapService;



@Controller
public class AdminController {

   @Autowired
   private CoordinatesService coordinatesService;
   @Autowired
   private MymapService mymapService;

   @RequestMapping("/admin/dashboard.do")
   public String dashboard(){
	   
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
   
   @RequestMapping("/admin/notifications.do")
   public String notifications(){
	   
	   return "admin_view/notifications";
   }
   
   @RequestMapping("/admin/faq.do")
   public String faq(){
	   
	   return "admin_view/faq";
   }
   
   
}