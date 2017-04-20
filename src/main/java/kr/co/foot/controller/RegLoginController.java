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
	
	//�몄�� 泥댄��
	@RequestMapping(value="/checkSession.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Boolean> checkSession(HttpServletRequest request) {
		
		HashMap<String, Boolean> dataMap = new HashMap<String, Boolean>();
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("user");
		System.out.println("�몄���� 濡�洹몄�몃�� ���대��: " +userid);
		
		if(userid != null) {
			dataMap.put("checkSession", true);
		} else {
			dataMap.put("checkSession", false);
		}
		
		return dataMap;
	}
	
	//�몄�� ���대�� 媛��몄�ㅺ린
	@RequestMapping(value="/getSessionUserid.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, String> getSessionUserid(HttpServletRequest request) {
		
		HashMap<String, String> dataMap = new HashMap<String, String>();
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("user");
		System.out.println("�몄���� 濡�洹몄�몃�� ���대��: " +userid);
		
		if(userid != null) {
			dataMap.put("sessionUserid", userid);
		} else {
			dataMap.put("sessionUserid", null);
		}
		
		return dataMap;
	}	
	
	
	
	//濡�洹몄�� �몄�
	@RequestMapping(value="/authenticate.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> authenticate(@RequestBody LoginDTO loginData, HttpServletRequest request, HttpServletResponse response) {
		
		HashMap<String, String> dataMap = new HashMap<String, String>();

		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++) {
			Cookie c = cookies[i];
			
			//癒쇱�� ����濡�洹몄�� 荑��ㅺ� ����吏� ����
			if(c.getName().equals("token")) {
				String token = c.getValue();
				String email = service.getEmailByToken(token);
				String userid = service.getUseridByEmail(email);
				HttpSession session = request.getSession(true);
				session.setAttribute("user", userid);
				System.out.println(session.getAttribute("user"));
			//����濡�洹몄�� 荑��ㅺ� ���ㅻ㈃	
			} else {
				
				//�곗�댄�곕��댁�ㅼ�� ������蹂대� 濡�洹몄�� ���μ��蹂닿� 留���吏� ����
				String loginUserid = service.findByEmailPass(loginData);
				if(loginUserid != null) {
					HttpSession session = request.getSession(true);
					session.setAttribute("user", loginUserid);
					dataMap.put("redirectUrl", "main.do");
					
					//����濡�洹몄�� toggle�� ������硫� ����濡�洹몄�� 荑��� �ㅼ��
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
					dataMap.put("message", "�대��� ���� 鍮�諛�踰��멸� ���몄�듬����.");
				}		
			}
		}
		
		return dataMap;
		
	}
	
	//濡�洹몄����
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		//�몄�� 臾댄�⑦��
		session.invalidate();

		Cookie[] cookies = request.getCookies();
		//荑��ㅺ� 議댁�ы��硫�
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				Cookie c = cookies[i];
				//����濡�洹몄�� 荑��ㅺ� ���쇰㈃
				if(c.getName().equals("token")) {
					if(c.getValue() != null) {
						String token = c.getValue();
						//�곗�댄�곕��댁�ㅼ�� ���λ�� ����濡�洹몄�� 荑���(����)瑜� 吏��곌�
						service.deleteAutoLoginData(token);
						//����濡�洹몄�� 荑��� 臾댄�⑦��
						c.setMaxAge(0);
						c.setValue(null);
						response.addCookie(c);
					}
				}
			}
		}
		return "redirect:/";
	}
	
	//����媛���
	@RequestMapping(value="/registerNewMember.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, Boolean> registerNewMember(@RequestBody MemberDTO memberData, HttpServletRequest request) throws ParseException {
		
		//email ���� userid 以�蹂듭���� ��蹂� �닿린
		HashMap<String, Boolean> errorMap = new HashMap<String, Boolean>();
		
		String inputEmail = memberData.getEmail();
		String inputUserid = memberData.getUserid();
		String code = CommonUtils.getRandomString();
				
		//���� ��媛� 援ы��湲�
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
	
	//鍮�諛�踰��� 遺��� �� ���ν�� �대��쇰� ����鍮�諛�踰��� ����
	@RequestMapping(value="/recoverPassword.do", method=RequestMethod.POST,  consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> recoverPassword(@RequestBody MemberDTO memberData) {
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		
		String inputEmail = memberData.getEmail();
		System.out.println(inputEmail);
		
		String emailDB = service.findByEmail(inputEmail);
		
		if(emailDB == null) {
			resultMap.put("errorMessage", "���ν���� �대��쇱�� ����媛����� �대��쇱�� ��������.");
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
			resultMap.put("successMessage", "���ν���� �대��쇰� ����鍮�諛�踰��몃�� ���≫�대���몄�듬����. ���� �� �ㅼ�� 濡�洹몄�명�댁＜�몄��.");
			return resultMap;
		}
	}
	
	
	//�ъ�⑹�� 留��� �대┃ �� �몄�肄��� ����
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
	
	//email 以�蹂� ����
	public boolean emailAlreadyExists(String email) {
		String emailDB = service.findByEmail(email);
		if(emailDB != null) {
			return true;
		} else {
			return false;
		}
	}
	
	//userid 以�蹂� ����
	public boolean useridAlreadyExists(String userid) {
		String useridDB = service.findByUserid(userid);
		if(useridDB != null) {
			return true;
		} else {
			return false;
		}
	}
	
	//����鍮�諛�踰��� �대��쇰� ����
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
		message.setSubject("諛���援� ���� ����鍮�諛�踰��� ����");
		message.setContent(
				"<h1>����鍮�諛�踰��몃�� �ㅼ��怨� 媛��듬����. �� ����鍮�諛�踰��몃� 濡�洹몄�명���� ��, 留��댄���댁����� 鍮�諛�踰��몃�� 蹂�寃쏀�댁＜��湲� 諛�������.</h1>"
				+"<br/>"
				+"����鍮�諛�踰��� : "+tempPassword,
				"text/html; charset=UTF-8");
		Transport.send(message);
		
		System.out.println("����鍮�諛�踰��� �대��� ���� �깃났!");
	}
	
	//�몄� �대��� ����
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
		message.setSubject("諛���援� ����媛��� �몄� �대���");
		message.setContent(
				"<h1>諛���援��� 媛����댁＜���� 媛��ы�⑸����. ���� 留��щ�� �대┃����硫� �몄���李④� 留�臾대━�⑸����.</h1>"
				+"<br/>"
				+server+contextPath+"/confirm.do?code="+code,
				"text/html; charset=UTF-8");
		Transport.send(message);
		
		System.out.println("�몄� �대��� ���� �깃났!");
	}
}
