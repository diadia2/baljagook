package kr.co.foot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

import kr.co.foot.member.MemberVO;
import kr.co.foot.reglogin.LoginDTO;
import kr.co.foot.reglogin.MemberDTO;
import kr.co.foot.reglogin.RegLoginService;
import kr.co.foot.util.CommonUtils;

@Controller
public class RegLoginController {
	
//	@Autowired
//	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private RegLoginService service;
	
	//로그인 인증
	@RequestMapping(value="/authenticate.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> authenticate(@RequestBody LoginDTO loginData, HttpServletRequest request) {
		
		HashMap<String, String> dataMap = new HashMap<String, String>();
		String loginUserid = service.findByEmailPass(loginData);
		if(loginUserid != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("user", loginUserid);
			dataMap.put("redirectUrl", "main.do");
		} else {
			dataMap.put("message", "이메일 또는 비밀번호가 틀렸습니다.");
		}
		
		return dataMap;
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원가입
	@RequestMapping(value="/registerNewMember.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, Boolean> registerNewMember(@RequestBody MemberDTO memberData, HttpServletRequest request) throws ParseException {
		
		//email 또는 userid 중복에러 정보 담기
		HashMap<String, Boolean> errorMap = new HashMap<String, Boolean>();
		
		String inputEmail = memberData.getEmail();
		String inputUserid = memberData.getUserid();
		String code = CommonUtils.getRandomString();
				
		//현재 시간 구하기
	    Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String today = sdf.format(cal.getTime());
	    String regdate = String.valueOf(sdf.parse(today).getTime()/1000);		
		
		MemberVO member = new MemberVO(); 
		int status = 0;
		
		member.setEmail(memberData.getEmail());
		member.setUserid(memberData.getUserid());
		member.setPassword(memberData.getPassword());
//		member.setPassword(passwordEncoder.encode(memberData.getPassword()));
		member.setStatus(status);
		member.setRegdate(regdate);
		member.setCode(code);
		
		if(emailAlreadyExists(inputEmail)) {
			errorMap.put("emailExists", true);
		} else if(useridAlreadyExists(inputUserid)) {
			errorMap.put("useridExists", true);
		} else {
			service.registerNewMember(member);
			try {
				sendVerificationEmail(inputEmail, code, request.getContextPath());
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (javax.mail.MessagingException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			errorMap.put("emailExists", false);
			errorMap.put("useridExists", false);
		}
	
		return errorMap; 
	}
	
	//사용자 링크 클릭 시 인증코드 확인
	@RequestMapping(value="/confirm.do", method=RequestMethod.GET)
	public ModelAndView confirmCode(@RequestParam("code") String code, Model model) {
		String emailDB = service.findByCode(code);
		System.out.println(code);
		
		if(emailDB != null) {
			service.verifyEmail(emailDB);
			model.addAttribute("email", emailDB);
			ModelAndView mav = new ModelAndView("/verificationSuccess");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/verificationFail");
			return mav;
		}
	}	
	
	//email 중복 확인
	public boolean emailAlreadyExists(String email) {
		String emailDB = service.findByEmail(email);
		if(emailDB != null) {
			return true;
		} else {
			return false;
		}
	}
	
	//userid 중복 확인
	public boolean useridAlreadyExists(String userid) {
		String useridDB = service.findByUserid(userid);
		if(useridDB != null) {
			return true;
		} else {
			return false;
		}
	}
	
	//인증 이메일 전송
	public void sendVerificationEmail(String email, String code, String contextPath) throws AddressException, javax.mail.MessagingException, MessagingException {
		String to = email;
		String from = "threebaljagook@gmail.com";
		final String username = "baljagook";
		final String password = "Baljagook3!";
		
		String server = "http://localhost:8000";
		
		String host = "express-relay.jangosmtp.net";
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "25");
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		message.setSubject("발자국 회원가입 인증 이메일");
		message.setContent(
				"<h1>발자국에 가입해주셔서 감사합니다. 아래 링크를 클릭하시면 인증절차가 마무리됩니다.</h1>"
				+"<br/>"
				+server+contextPath+"/confirm.do?code="+code,
				"text/html; charset=UTF-8");
		Transport.send(message);
		
		System.out.println("인증 이메일 전송 성공!");
	}
}
