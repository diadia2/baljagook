<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>top</title>
	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/demo.js"></script>
		<!--  Notifications Plugin    -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/bootstrap-notify.js"></script>
<style type="text/css">
body {
	padding-top: 55px;
}

/* 검색바 네비바에서 가운데 정렬을 위한 css */
.navbar .navbar-nav {
	display: inline-block;
	float: none;
}

.navbar .navbar-collapse {
	text-align: center;
}

.glyphicon {
	font-size: 50px;
}

#popular { /*  */
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
/* 모달창 text박스 설정 */
.modal-text:focus {
	-webkit-box-shadow: inset 0 -2px 0 #1c91c4;
	box-shadow: inset 0 -2px 0 #1c91c4;
	outline: none;
	border-radius: 0rem;
}

.modal-text {
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
}

/* 사이트 소개 */
.features-clean {
	background: #E6E6E6;
}
/* sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss카드부분 */
.projects-clean {
	color: #313437;
	background-color: #fff;
}

.projects-clean p {
	color: #7d8285;
}

.projects-clean h2 {
	font-weight: bold;
	margin-bottom: 40px;
	padding-top: 40px;
	color: inherit;
}

@media ( max-width :767px) {
	.projects-clean h2 {
		margin-bottom: 25px;
		padding-top: 25px;
		font-size: 24px;
	}
}

.projects-clean .intro {
	font-size: 16px;
	max-width: 500px;
	margin: 0 auto;
}

.projects-clean .intro p {
	margin-bottom: 0;
}

.projects-clean .projects {
	padding-bottom: 40px;
}

.projects-clean .item {
	text-align: center;
	min-height: 375px;
	padding: 5px;
}

.projects-clean .item .name {
	font-weight: bold;
	margin-top: 28px;
	margin-bottom: 8px;
	color: inherit;
}

.projects-clean .item .description {
	font-size: 15px;
	margin-top: 15px;
	margin-bottom: 0;
}

.card {
	box-shadow: 0 0px 2px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	padding-top: 5px;
}

.card:hover {
	box-shadow: 0 7px 14px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
}

/* sssssssssssssssssssssssssssssssssssssssssssssssssfooter */
.footer-basic {
	padding: 40px 0;
	background-color: #ffffff;
	color: #4b4c4d;
}

.footer-basic ul {
	padding: 0;
	list-style: none;
	text-align: center;
	font-size: 18px;
	line-height: 1.6;
	margin-bottom: 0;
}

.footer-basic li {
	padding: 0 10px;
}

.footer-basic ul a {
	color: inherit;
	text-decoration: none;
	opacity: 0.8;
}

.footer-basic ul a:hover {
	opacity: 1;
}

.footer-basic .social {
	text-align: center;
	padding-bottom: 25px;
}

.footer-basic .social .row .col-md-4>a {
	font-size: 24px;
	width: 40px;
	height: 40px;
	line-height: 40px;
	display: inline-block;
	text-align: center;
	border-radius: 50%;
	border: 1px solid #ccc;
	margin: 0 8px;
	color: inherit;
	opacity: 0.75;
}

.footer-basic .social .row .col-md-4>a:hover {
	opacity: 0.9;
}

.footer-basic .copyright {
	margin-top: 15px;
	text-align: center;
	font-size: 13px;
	color: #aaa;
	margin-bottom: 0;
}
</style>
<script type="text/javascript">
	function goSearch(){
	    location.href = "${ pageContext.request.contextPath }/map/search.do?searchtext="+$('#searchtext').val();
	}
</script>
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
		
/* 		console.log('지우기 전 쿠키 : ' +Cookies.get('token'));
		Cookies.remove('token', { path: '${pageContext.request.contextPath}'});
		console.log('지우기  쿠키 : ' +Cookies.get('token')); */
		
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
  							window.location.href = '${ pageContext.request.contextPath }/main.do';	
 						})
					});	
			} else {
				console.log('쿠키 없음');
			}				
		}
	} 

	$(document).ready(function() {
/* 		checkAutoLoginCookie(); */
		var autoLogin="false";

/*-----------------------자동로그인 Toggle 확인------------------------*/
		$('#toggleButton').change(function() {
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
						window.location.href = '${ pageContext.request.contextPath }/'+data['redirectUrl'];
					} else {
						alert(data['message']);
					}
				})
			});
			
		});

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
										window.location.href = '${ pageContext.request.contextPath }/main.do';
									}
								}
							});				
						}						
					}
				}
			}
			
		});
/*-----------------------비밀번호 찾기------------------------*/
		$('#recoverPassForm').on('submit', function(e) {
			console.log('recoverPassForm submitted');
			e.preventDefault();
		
			var emailData = {
					'email' : $('#recoverPassForm input[name=email]').val()
			};
			var dataJSON = JSON.stringify(emailData);
				
			$.ajax({
				type : 'POST',
				data : dataJSON,
				url : '${ pageContext.request.contextPath }/recoverPassword.do',
				contentType : 'application/json',
				dataType : "json",
				success : function(data) {
					
					if(data['errorMessage'] != null) {
						alert(data['errorMessage']);	
					} else {
						alert(data['successMessage']);
						window.location.href = '${ pageContext.request.contextPath }/main.do';
					}
				}
			});				
		});
		
	
	
	
	/* sock */
	var socket = new SockJS('/Baljagook/endpoint');
	var client = Stomp.over(socket);
	client.connect({}, function(frame) {
		console.log('connected stomp over sockjs');
		client.subscribe('/subscribe/echo', function(message) {
			console.log(message);
			$('#alarm').text("new");
			
			/* 알림 demo.js/ jq-Notification.js에 있음 */
			demo.showNotification2('top','left')
			
		});

	});
	});
</script>
</head>
<body>
	<!-- 상단 바 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- 로고, 이미지로 바꿀것 -->
				<a class="navbar-brand" href="${pageContext.request.contextPath }/main.do">나만의 지도</a>
				<button class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#target">
					<!-- 메뉴 최소화시 =버튼 -->
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse" id="target">
				<!-- 검색바 -->
				<form class="navbar-form navbar-nav" action="${pageContext.request.contextPath }/map/search.do" method="get">
					<input type="text" class="form-control" placeholder="검색" id="searchtext"
						size="50%" style="text-align: center;" onKeyPress="if (event.keyCode==13){ goSearch();event.returnValue=false}"/>&nbsp;&nbsp; <a href="javascript:goSearch()"><i
						class="fa fa-search fa-2x" aria-hidden="true"></i></a>
				</form>
<!--  sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss-->
				<label>ID : ${sessionScope.user} </label>
				<label>알림: <span id="alarm"></span> </label>
				<ul class="nav navbar-nav navbar-right">
					<!-- 우상단 드롭 메뉴 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false"><span>메뉴</span> <span
							class="caret"></span> </a>
						<ul class="dropdown-menu">
							<c:if test="${empty sessionScope.user }">
								<li><a data-toggle="modal" data-target="#loginModal"
									data-backdrop="static" data-keyboard="false">로그인</a></li>
							</c:if>
							<c:if test="${not empty sessionScope.user }">
								<li><a href="${ pageContext.request.contextPath }/member/mypage.do">마이페이지</a></li>
								<li class="divider"></li>
								<li><a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a></li>
							</c:if>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단바 끝 -->
	
	<!-- 비밀번호 찾기 Modal -->
	<div class="modal fade" id="recoverPassModal" tabindex="-1" role="dialog"
		 aria-labelledby="recoverPassModalTitle" aria-hidden="true">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="recoverPassModalTitle"
					style="padding-left: 48%;">비밀번호 변경</h5>
				<!-- x버튼 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>	
			</div>
			<div class="modal-body">
				<form id="recoverPassForm">						
					<div class="row">
						<div class="col-md-12 form-group">
							<input type="text" name="email" class="form-control modal-text"
								placeholder="이메일">
						</div>
					</div>
					<div class="col-md-12">
						<button type="submit" class="btn btn-primary col-md-12">임시비밀번호 받기</button>
					</div>				
				</form>
			</div>
		</div>	 
	</div>	

	<!-- 로그인 Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalTitle"
						style="padding-left: 48%;">로고</h5>
					<!-- x버튼 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="loginForm">
					<div class="container-fluid">
						<div class="row">
							<br /> <br /> <br />
							<h5 class="col-md-12 text-center">로그인하세요^^</h5>
							<br /> <br /> <br />
						</div>
						<div class="row">
							<div class="col-md-1">
								<i class="fa fa-user fa-2x" aria-hidden="true"></i>
							</div>
							<div class="col-md-11 form-group">
								<input type="text" name="email" class="form-control modal-text"
									placeholder="이메일">							
							</div>
						</div>
						<div class="row">
							<div class="col-md-1">
								<i class="fa fa-lock fa-2x" aria-hidden="true"></i>
							</div>
							<div class="col-md-11 form-group">
								<input type="password" name="password" class="form-control modal-text"
									placeholder="비밀번호">							
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
								<div class="toggle-button toggle-button--ilma">
									<input id="toggleButton" type="checkbox" > <label
										for="toggleButton" data-on-text="AutoLogin"
										data-off-text="Off" style="font-weight: bold; color: #CED2DA;"></label>
									<div class="toggle-button__icon"></div>
								</div>
							</div>
							<div class="col-md-12">
								<button type="submit" class="btn btn-primary col-md-12">로그인</button>
							</div>
						</div>
					</div>
					</form>
				</div>
				<div class="modal-footer text-center">
					<button id="recoverPassword" class="dropdown-item btn btn-primary" type="button"
						data-toggle="modal" data-target="#recoverPassModal"
						data-dismiss="modal" data-backdrop="static" data-keyboard="false">
						<i class="fa fa-question" aria-hidden="true"></i>&nbsp;비밀번호 찾기
					</button>
					<button class="dropdown-item btn btn-primary" type="button"
						data-toggle="modal" data-target="#signUpModal"
						data-dismiss="modal" data-backdrop="static" data-keyboard="false">
						<i class="fa fa-user-plus"></i>&nbsp;회원가입
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 Modal -->
	<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
		aria-labelledby="signUpModalTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="signUpModalTitle"
						style="padding-left: 48%;">로고</h5>
					<!-- x버튼 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="registerForm">
						<div class="container-fluid">
							<div class="row">
								<br /> <br /> <br />
								<h5 class="col-md-12 text-center">Create a new account</h5>
								<br /> <br /> <br />
							</div>
							<div class="row">
								<div class="col-md-1">
									<i class="fa fa-envelope fa-2x" aria-hidden="true"></i>
								</div>
								<div class="col-md-11 form-group">
									<input type="text" name="email" class="form-control modal-text"
										placeholder="Email address">
								</div>
								<div class="col-md-1">
									<i class="fa fa-user fa-2x" aria-hidden="true"></i>
								</div>
								<div class="col-md-11 form-group">
									<input type="text" name="userid" class="form-control modal-text"
										placeholder="User name">
								</div>
							</div>
							<div class="row">
								<div class="col-md-1">
									<i class="fa fa-lock fa-2x" aria-hidden="true"></i>
								</div>
								<div class="col-md-11 form-group">
									<input type="password" name="password" class="form-control modal-text"
										placeholder="Password">
								</div>
								<div class="col-md-1">
									<i class="fa fa-lock fa-2x" aria-hidden="true"></i>
								</div>
								<div class="col-md-11 form-group">
									<input type="password" name="confirmPassword" class="form-control modal-text"
										placeholder="Confirm password ">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button type="submit" class="btn btn-primary col-md-12">회원가입</button>
								</div>
								<br /> <br />
								<div class="col-md-12">
									<button type="button" class="btn btn-default col-md-12">연동
										버튼</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="col-md-4"></div>
			<div class="col-md-4 text-center">
				<button class="dropdown-item btn btn-primary" type="button"
					data-toggle="modal" data-target="#loginModal"
					data-dismiss="modal" data-backdrop="static" data-keyboard="false">
					<i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;Sign In
				</button>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

	<!-- 비밀번호찾기 Modal -->
	<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
		aria-labelledby="passwordModalTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="passwordModalTitle"
						style="padding-left: 48%;">로고</h5>
					<!-- x버튼 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<br /> <br /> <br />
							<h5 class="col-md-12 text-center">Reset your password</h5>
							<br /> <br /> <br />
						</div>
						<div class="row">
							<div class="col-md-1">
								<i class="fa fa-envelope fa-2x" aria-hidden="true"></i>
							</div>
							<div class="col-md-11 form-group">
								<input type="text" class="form-control modal-text"
									placeholder="Enter your email address">
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<button type="button" class="btn btn-primary col-md-12">RESET
									MY PASSWORD</button>
							</div>
							<br /> <br />
						</div>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button class="dropdown-item btn btn-primary" type="button"
						data-toggle="modal" data-target="#loginModal" data-dismiss="modal"
						data-backdrop="static" data-keyboard="false">
						<i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;Sign In
					</button>
					<button class="dropdown-item btn btn-primary" type="button"
						data-toggle="modal" data-target="#signUpModal"
						data-dismiss="modal" data-backdrop="static" data-keyboard="false">
						<i class="fa fa-user-plus"></i>&nbsp;회원가입
					</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>