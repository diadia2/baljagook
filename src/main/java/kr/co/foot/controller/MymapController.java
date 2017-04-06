package kr.co.foot.controller;

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
import kr.co.foot.mymap.MymapService;
import kr.co.foot.mymap.MymapVO;
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
      int type = 1;  //���=1, ��ȹ=2
      
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
      
      // t_myMap�� ������ ����
      mymapService.regMyMap(mymapVO);
      
      // t_myMap index�� �ҷ�����
      int mymapidx = mymapService.getIndex(regdate); 
      
      // t_regcoordinates�� ��ǥ �����͵� ����      
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
      
      // t_regmap�� ������ ����
      RegmapVO regmapVO = new RegmapVO();
//      String city = request.getParameter("city");
//      String theme = request.getParameter("theme");
      
      int city = 1;
      int theme = 1;
      
      start += ":00";
      end += ":00";
      
      //�����
      SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String sdate = String.valueOf(time1.parse(start).getTime()/1000);
      //������
      SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String edate = String.valueOf(time2.parse(end).getTime()/1000);
      
      regmapVO.setSdate(sdate);
      regmapVO.setEdate(edate);
      regmapVO.setMymapidx(mymapidx);
      regmapVO.setCity(city);
      regmapVO.setTheme(theme);
      
      mymapService.insertRegMap(regmapVO);
      
      // t_hashtag�� ������ ����
      String hashtag = request.getParameter("hashtag").trim();
      String[] nameArr = hashtag.split("#");
      
      for(int i=1; i<nameArr.length; i++){
         HashtagVO hashtagVO = new HashtagVO();
         String name = nameArr[i].trim();
         hashtagVO.setName(name);
         hashtagVO.setMymapidx(mymapidx);
         mymapService.insertHashtag(hashtagVO);
      }
      
      // t_checkpoint �����͵� ����
      List<RegcoordinatesVO> regList = mymapService.getRegcoordinatesInfo(mymapidx);
      
      String markerlat = request.getParameter("markerlat");
      String markerlon = request.getParameter("markerlng");
      String[] markerlatArr = markerlat.split("/");
      String[] markerlonArr = markerlon.split("/");
      
      String getpaneltitle = request.getParameter("paneltitle");
      String getpanelcontent = request.getParameter("panelcontent");
      String[] ptitleArr = getpaneltitle.split("/");
      String[] pcontentArr = getpanelcontent.split("/");
      
      // ��Ŀ ������ŭ for��
      for(int i=0; i<markerlatArr.length; i++){
         String checkPointLat = markerlatArr[i];
         String checkPointLon = markerlonArr[i];
         String paneltitle = ptitleArr[i];
         String panelcontent = pcontentArr[i];
         
         // �ش� ��Ŀ�� ��ǥ�� regcoordinates�� ��ǥ�� ��ġ�ϸ� regcoordinatesidx�� �����ͼ� t_checkpoint�� ����
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
      
      // t_mymap�� �����ȹ ������ ����
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
      
      // t_myMap index�� �ҷ�����
      int mymapidx = mymapService.getIndex(regdate);
      
      // t_regcoordinates�� ��ǥ �����͵� ����      
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
      
      // t_checkpoint �����͵� ����
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
         
         // �˻����뿡 �´� mymapidx �ҷ�����
         List<HashtagVO> eachHashtagList = mymapService.getHashtagList(mymapList.get(i).getIdx());
         // �� mymapidx�� �´� t_hashtag �ҷ�����
         for(int j=0; j<eachHashtagList.size(); j++){
            hashtagList.add(eachHashtagList.get(j));
         }
      }
   
      // mymapidx�� �´� t_regmap �ҷ�����
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
      
      // mympaidx�� t_mymap �ҷ�����
      MymapVO mymapVO = mymapService.selectMymap(mymapidx);
      // mymapidx�� t_regmap �ҷ�����
      RegmapVO regmapVO = mymapService.getRegmapList(mymapidx);
      
      String start = regmapVO.getSdate();
      String end = regmapVO.getEdate();
      start += "000";
      end += "000";
      String sdate = sd.format(new Date(Long.valueOf(start)));
      String edate = sd.format(new Date(Long.valueOf(end)));
      
      // mymapidx�� t_hashtag ��������
      List<HashtagVO> hashtagList = mymapService.getHashtagList(mymapidx);
      
      // mymapidx�� t_regmap ����Ʈ�� ��������
      List<RegcoordinatesVO> regcoordinatesList = mymapService.getRegmapsList(mymapidx);
      
      //coordinatesidx�� t_checkpoint �ҷ�����
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
    * ��� ���ã�� �߰�
    * @param idx
    * @return
    */
   @RequestMapping("/map/getFavoritePlace.do")
   @ResponseBody
   public String getFavoritePlace(@RequestParam("idx") String idx,
                           @RequestParam("placename") String placename){
      
      // ������ ��Ŀ
      int checkpointidx = Integer.parseInt(idx);
      // �������̵�
      String userid = "test@test.com";
      // ���� ���̵�� ������ ����ߴ� ��Ŀ�� ��ȸ
      List<FavoriteplaceVO> compareCheckPointidx = mymapService.selectcheckpoint(userid);
      // ������ ����� ��Ŀ�� ���� ����� ��Ŀ�� ���� ���� üũ
      if(compareCheckPointidx != null){
         for(int i=0; i<compareCheckPointidx.size(); i++){
            if(checkpointidx == compareCheckPointidx.get(i).getCheckpointidx()){
               return "�̹� ��ϵǾ� �ֽ��ϴ�.";
            }
         }
      }
      // �����Ѱ� ������ ���
      FavoriteplaceVO favoriteplaceVO = new FavoriteplaceVO();
      favoriteplaceVO.setCheckpointidx(checkpointidx);
      favoriteplaceVO.setUserid(userid);
      favoriteplaceVO.setPlacename(placename);
      
      mymapService.insertFavoritePlace(favoriteplaceVO);
      return "��� ���� �Ϸ�";
   }
   
   @RequestMapping("/map/getFavoriteMap.do")
   @ResponseBody
   public String getFavoriteMap(@RequestParam("mymapidx") String mymapidxstr){
      
      // ���� ���̵�
      String userid = "test1@test.com";
      // ������ �� mymapidx ��
      int mymapidx = Integer.parseInt(mymapidxstr);
      // mymapidx������ regmapidx �ҷ�����
      RegmapVO getRegmap = mymapService.getRegmapList(mymapidx);
      List<FavoritemapVO> compareRegmapidx = mymapService.selectRegmapidx(userid);
      
      if(compareRegmapidx != null){
         for(int i=0; i<compareRegmapidx.size(); i++){
            if(getRegmap.getIdx() == compareRegmapidx.get(i).getRegmapidx()){
               return "�̹� ��ϵǾ� �ֽ��ϴ�.";
            }
         }
      }
      FavoritemapVO favoritemapVO = new FavoritemapVO();
      favoritemapVO.setRegmapidx(getRegmap.getIdx());
      favoritemapVO.setUserid(userid);
      mymapService.insertFavoriteMap(favoritemapVO);
      
      return "�� ���� �Ϸ�";
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
   
   
}