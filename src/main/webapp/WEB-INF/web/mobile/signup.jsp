<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/main.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/sub.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/resources/css/mobile/member.css" rel="stylesheet">
	

	<script src="//code.jquery.com/jquery-latest.min.js"></script>

	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"> -->
<!-- 	<link href="/mobile/img/favicon.ico" rel="icon" type="image/x-icon"> -->
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery-2.1.4.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery.bxslider.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/placeholders.js"></script>

	
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery.swipebox.js"></script>
	<link href="${pageContext.request.contextPath }/resources/js/mobile/swipebox.css" rel="stylesheet" type="text/css"/>


	<!-- Add fancyBox main JS and CSS files -->
<!-- 	<script type="text/javascript" src="./js/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="./js/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" /> -->


	<script src="${pageContext.request.contextPath }/resources/js/mobile/script.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/board.css" rel="stylesheet" type="text/css"/>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/util.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/html5shiv-printshiv.js"></script>
	<![endif]-->
	
<script type="text/javascript">
    function go_login(){
        location.href="${pageContext.request.contextPath}/m/login.do";
    }
</script>
<script>
	$(document).ready(function() {
	
/*------------------------이메일 형식 체크------------------------*/
		function validateEmail(inputEmail) {
			var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		
			if (inputEmail.match(mailFormat)) {
				return true;
			} else {
				return false;
			}
		}
/*-----------------------비밀번호 형식 체크------------------------*/
		function validatePassword(inputPassword) {
			var passwordFormat = /^[a-zA-Z-0-9!@#$%^&*]{5,15}$/;
			
			if (inputPassword.match(passwordFormat)) {
				return true;
			} else {
				return false;
			}
		
		}
/*-----------------------아이디(userid) 형식 체크------------------------*/
		function validateUserid(inputUserid) {
			var useridFormat = /^[a-zA-Z-0-9]{5,10}$/;
			
			if (inputUserid.match(useridFormat)) {
				return true;
			} else {
				return false;
			}
	}
/*-----------------------회원가입------------------------*/
			$('#registerForm').on('submit', function(e) {
				console.log('registerForm submitted');
				e.preventDefault();
			
				var inputEmail = $('#registerForm input[name=email]').val();
				var inputUserid = $('#registerForm input[name=userid]').val();
				var inputPw = $('#registerForm input[name=password]').val();
				var inputConfirmPw = $('#registerForm input[name=confirmPassword]').val();
				
				if(!(validateEmail(inputEmail))) {
					alert('입력하신 이메일은 형식에 맞지 않습니다.');
				} else {
					if(!(validateUserid(inputUserid))) {
						alert('아이디 형식이 맞지 않습니다(길이: 5-10, 공백/특수문자 제외)');
					} else {
						if(!(validatePassword(inputPw))) {
							alert('비밀번호 형식이 맞지 않습니다(길이: 5-15, 특수문자(!@#$%^&*만 가능), 공백 제외)');
						} else {
							if(inputPw != inputConfirmPw) {
								alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요');
							} else {
								var newMember = {
										'email' : $('#registerForm input[name=email]').val(),
										'userid' : $('#registerForm input[name=userid]').val(),
										'password' : $('#registerForm input[name=password]').val()
								};
								var dataJSON = JSON.stringify(newMember);
								
								$.ajax({
									type : 'POST',
									data : dataJSON,
									url : '${ pageContext.request.contextPath }/registerNewMember.do',
									contentType : 'application/json',
									dataType : "json",
									success : function(data) {
										if(data["emailExists"]) {
											alert('이미 이메일이 존재합니다.');
										} else if(data["useridExists"]) {
											alert('이미 아이디가 존재합니다.');
										} else {
											alert('입력하신 이메일로 인증메일을 전송합니다. 이메일 인증 후 로그인하실 수 있습니다.');
											window.location.href = '${ pageContext.request.contextPath }/m/main.do';
										}
									}
								});				
							}						
						}
					}
				}
				
			});		
		
	});
</script>	
</head>
<body>
	<div class="side_menu_bg"></div>
	<div class="layer_bg"></div>

<div id="wrap">
		<header id="header_1" style="text-align:center;">
			<img src="${pageContext.request.contextPath }/resources/images/mobile/logo.png" />
            <p>회원가입</p>
		</header>




	<section id="container" class="register">		
		<section class="register_form2">
			<form id="registerForm">
			
			
			
				<fieldset>
					<legend>회원가입 양식</legend>
					<ul>
						<li>
							<h3>이메일</h3>
							<div>
								<input type="text" name="email" placeholder="이메일" onfocus="this.placeholder=''" onblur="this.placeholder='이메일'">
                                <!-- <span class="chk_right"></span> --><!-- class 종류 : chk_right, chk_cancle, none -->
							</div>
						</li>
						
						<li>
							<h3>아이디</h3>
							<div>
								<input type="text" name="userid" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'">
                                <!-- <span class="chk_right"></span> --><!-- class 종류 : chk_right, chk_cancle, none -->
							</div>
						</li>
												
                        <li>
							<h3>비밀번호</h3>
							<div>
								<input type="password" name="password" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'">
                                <!-- <span class="chk_cancle"></span> -->
							</div>
						</li>

                        <li>
							<h3>비밀번호 확인</h3>
							<div>
								<input type="password" name="confirmPassword" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'">
                                <span class="none"></span>
							</div>
						</li>

					</ul>
					
					

                    <div class="register_submit">
                        <input type="submit" value="회원가입">
                        <input type="button" type="button" value="로그인" onclick="go_login();">
					</div>


				</fieldset>
			</form>
			
		</section>
		
	</section>
	<!-- //container End -->
</div>
</body>
</html>