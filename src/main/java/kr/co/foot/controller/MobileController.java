package kr.co.foot.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
import kr.co.foot.util.FileUtils;



@Controller
public class MobileController {

	@Autowired
	private CoordinatesService coordinatesService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MymapService mymapService;

	private FileUtils fileutils;

	
	@RequestMapping("m/main.do")
	public ModelAndView bottom(String userid, Model model) {
		
		List<MymapVO> myPlanList = new ArrayList<>();
		List<MymapVO> favMapList = new ArrayList<>();
		List<FavoriteplaceVO> favPlaceList = new ArrayList<>();
		
		
		userid = "test@test.com";
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
		
		model.addAttribute("myPlanList", myPlanList);
		model.addAttribute("favMapList", favMapList);
		model.addAttribute("favPlaceList", favPlaceList);

		ModelAndView mav = new ModelAndView("mobile/main");
		return mav;
	}
	
	@RequestMapping("m/insert.do")
	public void insertData(HttpServletRequest request) throws IllegalStateException, IOException{
		System.out.println("진입");
		String id = "test@test.com";
		if(request == null){
			System.out.println("널뜸");
		}
		Map<String,String> map = fileutils.saveFile(request);
		
		CoordinatesVO testCoord = new CoordinatesVO();
		testCoord.setAccuracy(map.get("accuracy"));
		testCoord.setLat(map.get("lat"));
		testCoord.setLon(map.get("lon"));
		testCoord.setTimestamp(map.get("timestamp"));
		testCoord.setEmail(id);
		coordinatesService.setCoordinates(testCoord);
	
		
		int coordinatesidx = coordinatesService.selectidx(map.get("timestamp"));
		CheckpointVO checkpoint = new CheckpointVO();
		checkpoint.setContent(map.get("content"));
		checkpoint.setTitle(map.get("title"));
		checkpoint.setCoordinatesidx(coordinatesidx);
		coordinatesService.insertCheckpoint(checkpoint);
		
		int checkpointidx = coordinatesService.selectCheckpointidx(coordinatesidx);
		System.out.println(checkpointidx);
		PhotoVO photo = new PhotoVO();
		photo.setNewname(map.get("newFileName"));
		photo.setOriname(map.get("oriFileName"));
		photo.setCheckpointidx(checkpointidx);
		System.out.println(photo);
		coordinatesService.insertPhoto(photo);
		
	}
}
