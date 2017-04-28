package kr.co.foot.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.foot.member.MemberVO;
import kr.co.foot.mypage.DeactivateDTO;
import kr.co.foot.mypage.MyPageService;
import kr.co.foot.mypage.PasswordDTO;
import kr.co.foot.reglogin.LoginDTO;
import kr.co.foot.reglogin.RegLoginService;
import kr.co.foot.util.CommonUtils;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService service;
	
	@Autowired
	private RegLoginService regLoginService;
	
	//회원탈퇴
	@RequestMapping(value="/deactivate.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> deactivateAccount(HttpServletRequest request) throws ParseException {
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sdf.format(cal.getTime());
		String deactivatedate = String.valueOf(sdf.parse(today).getTime()/1000);		
		
		HttpSession session = request.getSession(true);
		String userid = (String) session.getAttribute("user");
		
		DeactivateDTO deactivateDTO = new DeactivateDTO();
		deactivateDTO.setUserid(userid);
		deactivateDTO.setDeactivatedate(deactivatedate);
		
		service.deactivateAccount(userid);
		service.insertDeactivatedate(deactivateDTO);
	
		session.invalidate();
		
		HashMap<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("message", "정상적으로 탈퇴 되었습니다.");
		dataMap.put("redirectUrl", "main.do");
		
		return dataMap;
	}
	
	//비밀번호 변경
	@RequestMapping(value="/changePassword.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> changePassword(@RequestBody PasswordDTO passwordDTO, HttpServletRequest request) {
		System.out.println("비밀번호 변경 컨트롤러 진입");
		
		String currentPassword = passwordDTO.getCurrentPassword();
		String newPassword = passwordDTO.getNewPassword();
		
		HashMap<String, String> dataMap = new HashMap<String, String>();
		
		HttpSession session = request.getSession(true);
		String userid = (String) session.getAttribute("user");
		
		String email = service.getEmailByUserid(userid);
		LoginDTO loginData = new LoginDTO();
		loginData.setEmail(email);
		loginData.setPassword(currentPassword);
		String useridDB = regLoginService.findByEmailPass(loginData);
		if(useridDB != null) {
			MemberVO updatedMember = service.findByUserid(userid);
			updatedMember.setPassword(newPassword);
			service.changePassword(updatedMember);
			
			dataMap.put("message", "비밀번호 변경 성공!");
			dataMap.put("redirectUrl", "/member/mypage.do");
		} else {
			dataMap.put("message", "현재 비밀번호가 틀렸습니다.");
		}
		return dataMap;
	}

//	private static final String filePath = "/Users/mac/Documents/workspace/baljagook/src/main/webapp/resources/photo/profileImage/";		
	private static final String filePath = "/var/lib/tomcat8/webapps/baljagook/resources/photo/profileImage/";	
	
	//프로필사진 변경
	@RequestMapping(value = "/uploadPhoto.do", method = RequestMethod.POST)
	@ResponseBody
	public String uploadPhoto(MultipartHttpServletRequest request, Model model) throws IllegalStateException, IOException {
		
		HttpSession session = request.getSession(true);
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		String userid = (String) session.getAttribute("user");
		String imageName = "";
		Iterator<String> itr = request.getFileNames();
		
		
		
		if(itr.hasNext()) {
			MultipartFile uploadedImage = request.getFile(itr.next());
			
			imageName = CommonUtils.getRandomString()+uploadedImage.getOriginalFilename();
			file = new File(filePath+imageName);
			uploadedImage.transferTo(file);
			
			// DB에 imageName 추가
			MemberVO memberVO = new MemberVO();
			memberVO.setUserid(userid);
			memberVO.setPhoto(imageName);
			service.insertImageName(memberVO);
			
		}
		
		return imageName;
		
	}	
	
}
