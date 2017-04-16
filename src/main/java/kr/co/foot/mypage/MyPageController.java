package kr.co.foot.mypage;

import java.io.File;
import java.io.IOException;
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

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.PutObjectRequest;

import kr.co.foot.member.MemberVO;
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
	public HashMap<String, String> deactivateAccount(HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		String userid = (String) session.getAttribute("user");
		
		service.deactivateAccount(userid);
		
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
	
	//프로필사진 변경
	@RequestMapping(value = "/uploadPhoto.do", method = RequestMethod.POST)
	@ResponseBody
	public String uploadPhoto(MultipartHttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(true);
		String userid = (String) session.getAttribute("user");
		String imageName = "";
		Iterator<String> itr = request.getFileNames();
		if(itr.hasNext()) {
			MultipartFile uploadedImage = request.getFile(itr.next());
			
			// 아마존 S3 설정
			BasicAWSCredentials credentials = new BasicAWSCredentials("",
					"");
			AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
					.withCredentials(new AWSStaticCredentialsProvider(credentials)).build();
			String bucketName = "baljagook";
			String folderName = "profileImage";
			imageName = CommonUtils.getRandomString()+uploadedImage.getOriginalFilename();
			String key = folderName + "/" + imageName;

			System.out.println(key);

			// 아마존 S3에 업로드
			try {
				File memberImage = multipartToFile(uploadedImage);
				PutObjectRequest imageFile = new PutObjectRequest(bucketName, key, memberImage);
				s3Client.putObject(imageFile);

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// DB에 imageName 추가
			MemberVO memberVO = new MemberVO();
			memberVO.setUserid(userid);
			memberVO.setPhoto(imageName);
			service.insertImageName(memberVO);
			
		}
		
		return imageName;
		
	}

	// 업로드된 MultipartFile을 File 객체로 변환
	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {

		File convFile = new File(multipart.getOriginalFilename());
		multipart.transferTo(convFile);
		return convFile;

	}	
	
}
