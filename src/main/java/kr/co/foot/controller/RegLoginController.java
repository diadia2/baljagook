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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import kr.co.foot.mypage.MyPageService;
import kr.co.foot.reglogin.AutoLoginDTO;
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

	@Autowired
	private MyPageService myPageService;	
	
	//세션 체크
	@RequestMapping(value="/checkSession.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Boolean> checkSession(HttpServletRequest request) {
		
		HashMap<String, Boolean> dataMap = new HashMap<String, Boolean>();
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("user");
		System.out.println("세션에 로그인된 아이디: " +userid);
		
		if(userid != null) {
			dataMap.put("checkSession", true);
		} else {
			dataMap.put("checkSession", false);
		}
		
		return dataMap;
	}
	
	//세션 아이디 가져오기
	@RequestMapping(value="/getSessionUserid.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, String> getSessionUserid(HttpServletRequest request) {
		
		HashMap<String, String> dataMap = new HashMap<String, String>();
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("user");
		System.out.println("세션에 로그인된 아이디: " +userid);
		
		if(userid != null) {
			dataMap.put("sessionUserid", userid);
		} else {
			dataMap.put("sessionUserid", null);
		}
		
		return dataMap;
	}	
	
	
	
	//로그인 인증
	@RequestMapping(value="/authenticate.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> authenticate(@RequestBody LoginDTO loginData, HttpServletRequest request, HttpServletResponse response) {
		
		HashMap<String, String> dataMap = new HashMap<String, String>();

		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++) {
			Cookie c = cookies[i];
			
			//먼저 자동로그인 쿠키가 있는지 확인
			if(c.getName().equals("token")) {
				String token = c.getValue();
				String email = service.getEmailByToken(token);
				String userid = service.getUseridByEmail(email);
				HttpSession session = request.getSession(true);
				session.setAttribute("user", userid);
			
			//자동로그인 쿠키가 없다면	
			} else {
				
				//데이터베이스의 회원정보로 로그인 입력정보가 맞는지 확인
				String loginUserid = service.findByEmailPass(loginData);
				if(loginUserid != null) {
					HttpSession session = request.getSession(true);
					session.setAttribute("user", loginUserid);
					dataMap.put("redirectUrl", "main.do");
					
					//자동로그인 toggle을 선택하면 자동로그인 쿠키 설정
					if(loginData.getAutoLogin().equals("true")) {
						String token = CommonUtils.getRandomString();
						Cookie cToken = new Cookie("token", token);
						cToken.setMaxAge(60*60*24*7);
						response.addCookie(cToken);
						
						AutoLoginDTO autoLoginDTO = new AutoLoginDTO();
						autoLoginDTO.setEmail(loginData.getEmail());
						autoLoginDTO.setToken(token);
						service.insertAutoLoginData(autoLoginDTO);
					}			
					
				} else {
					dataMap.put("message", "이메일 또는 비밀번호가 틀렸습니다.");
				}		
			}
		}
		
		return dataMap;
		
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		//세션 무효화
		session.invalidate();

		Cookie[] cookies = request.getCookies();
		//쿠키가 존재하면
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				Cookie c = cookies[i];
				//자동로그인 쿠키가 있으면
				if(c.getName().equals("token")) {
					if(c.getValue() != null) {
						String token = c.getValue();
						//데이터베이스에 저장된 자동로그인 쿠키(토큰)를 지우고
						service.deleteAutoLoginData(token);
						//자동로그인 쿠키 무효화
						c.setMaxAge(0);
						c.setValue(null);
						response.addCookie(c);
					}
				}
			}
		}
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
	
	//비밀번호 분실 시 입력한 이메일로 임시비밀번호 전송
	@RequestMapping(value="/recoverPassword.do", method=RequestMethod.POST,  consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> recoverPassword(@RequestBody MemberDTO memberData) {
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		
		String inputEmail = memberData.getEmail();
		System.out.println(inputEmail);
		
		String emailDB = service.findByEmail(inputEmail);
		
		if(emailDB == null) {
			resultMap.put("errorMessage", "입력하신 이메일은 회원가입된 이메일이 아닙니다.");
			return resultMap;
		} else {
			String tempPassword = CommonUtils.getRandomString().substring(0, 7);
			try {
				sendTempPassword(inputEmail, tempPassword);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (javax.mail.MessagingException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			MemberVO targetMember = myPageService.findByEmail(emailDB);
			targetMember.setPassword(tempPassword);
			myPageService.changePassword(targetMember);
			resultMap.put("successMessage", "입력하신 이메일로 임시비밀번호를 전송해드렸습니다. 확인 후 다시 로그인해주세요.");
			return resultMap;
		}
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
	
	//임시비밀번호 이메일로 전송
	public void sendTempPassword(String email, String tempPassword) throws AddressException, javax.mail.MessagingException, MessagingException {
		String to = email;
		String from = "threebaljagook@gmail.com";
		final String username = "threebaljagook@gmail.com";
		final String password = "";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		message.setSubject("발자국 회원 임시비밀번호 전송");
		message.setContent(
				"<h1>임시비밀번호는 다음과 같습니다. 이 임시비밀번호로 로그인하신 후, 마이페이지에서 비밀번호를 변경해주시기 바랍니다.</h1>"
				+"<br/>"
				+"임시비밀번호 : "+tempPassword,
				"text/html; charset=UTF-8");
		Transport.send(message);
		
		System.out.println("임시비밀번호 이메일 전송 성공!");
	}
	
	//인증 이메일 전송
	public void sendVerificationEmail(String email, String code, String contextPath) throws AddressException, javax.mail.MessagingException, MessagingException {
		String to = email;
		String from = "threebaljagook@gmail.com";
		final String username = "threebaljagook@gmail.com";
		final String password = "";
		
		String server = "http://localhost:8000";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
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
