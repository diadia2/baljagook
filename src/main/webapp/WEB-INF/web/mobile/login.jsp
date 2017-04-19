<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
	
<script>
/*-----------------------세션에 아이디가 있는지 확인------------------------*/
var check;
function checkSession() {
	$.ajax({
		type : 'GET',
		url : '${ pageContext.request.contextPath }/checkSession.do',
		dataType : 'json',
		async : false,
		success : function(data) {
				check = data['checkSession'];
		}
	});
};

/*-----------------------페이지 onload 시 쿠키 확인------------------------*/
function checkAutoLoginCookie() {
	checkSession();
	
	if(check) {
		console.log('세션에 이미 로그인 되어있음');
	} else {
		console.log('쿠키 있는지 확인할게');
		if(Cookies.get('token') != null ) {
			console.log('쿠키 있음');
			
			var loginInfo = {
					'email' : null,
					'password' : null,
					'autoLogin' : null
			};
			var dataJSON = JSON.stringify(loginInfo);
			
    			$.ajax({
					type : 'POST',
					data : dataJSON,
					url : '${ pageContext.request.contextPath }/authenticate.do',
					contentType : 'application/json',
					dataType : 'json',
					success : (function() {
							window.location.href = '${ pageContext.request.contextPath }/m/main.do';	
						})
				});	
		} else {
			console.log('쿠키 없음');
		}				
	}
}

$(document).ready(function() {
	var autoLogin="false";

/*-----------------------자동로그인 Toggle 확인------------------------*/
	$('#agree01').change(function() {
		console.log('checking autologin');
		console.log($(this).is(":checked"));
		if($(this).is(":checked")) {
			autoLogin = "true";
		}
	});
	
/*------------------------로그인------------------------*/
	$('#loginForm').on('submit', function(e) {
		console.log('loginForm submitted');
		e.preventDefault();			
		
		var loginInfo = {
				'email' : $('#loginForm input[name=email]').val(),
				'password' : $('#loginForm input[name=password]').val(),
				'autoLogin' : autoLogin
		};
		var dataJSON = JSON.stringify(loginInfo);
		
		$.ajax({
			type : 'POST',
			data : dataJSON,
			url : '${ pageContext.request.contextPath }/authenticate.do',
			contentType : 'application/json',
			dataType : 'json',
			success : (function(data) {
				if(data['redirectUrl'] != null) {
					window.location.href = '${ pageContext.request.contextPath }/m/main.do';
				} else {
					alert(data['message']);
				}
			})
		});
		
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
            	<p>로그인 하세요</p>
		</header>

	<section id="container" class="register">		
		<section class="register_form">
			<form id="loginForm">

				<fieldset>
					<legend>회원가입 양식</legend>
					<ul>
						<li>
							<h3>이메일</h3>
							<div>
								<input type="text" name="email" placeholder="이메일" onfocus="this.placeholder=''" onblur="this.placeholder='이메일'">
							</div>
						</li>
												<li>
							<h3>비밀번호</h3>
							<div>
								<input type="password" name="password" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'">
							</div>
						</li>


						<li>
							<div>
                                <label for="agree01" class="ios_check"><input type="checkbox" id="agree01" class="ios-switch green  bigswitch" ><span><span></span></span>
                                <span>자동로그인</span>
                                </label>
							</div>
						</li>


					</ul>
					
					

                    <div class="register_submit">
                        <input type="submit" value="로그인">
                        <!-- <input type="button" type="button" value="SIGN IN Facebook" > -->
					</div>

                    <div class="register_bottom">
                        <span><a href="${ pageContext.request.contextPath }/m/changePass.do">Lost Password</a></span>
                        <span><a href="${pageContext.request.contextPath }/m/signup.do">회원가입</a></span>
                    </div>

				</fieldset>
			</form>
			
		</section>
		
	</section>
	<!-- //container End -->
</div>
</body>
</html>