<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share2.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-97946391-1', 'auto');
	ga('send', 'pageview');
</script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script
	src="${pageContext.request.contextPath }/resources/admin/assets/js/demo.js"></script>
<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath }/resources/admin/assets/js/bootstrap-notify.js"></script>
<style type="text/css">
@font-face {
	font-family: 'Nanum Gothic';
	font-style: normal;
	font-weight: 400;
}

@font-face {
	font-family: 'Nanum Gothic';
	font-style: bold;
	font-weight: 600;
}

.mainmsg {
	font: '나눔고딕';
}

body {
	/* 	padding-top: 55px; */
	
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

		/*  		console.log('지우기 전 쿠키 : ' +Cookies.get('token'));
		 Cookies.remove('token', { path: '${pageContext.request.contextPath}'});
		 console.log('지우기  쿠키 : ' +Cookies.get('token')); */

		if (check) {
			console.log('세션에 이미 로그인 되어있음');
		} else {
			console.log('쿠키 있는지 확인할게');
			if (Cookies.get('token') != null) {
				console.log('쿠키 있음');

				var loginInfo = {
					'email' : null,
					'password' : null,
					'autoLogin' : null
				};
				var dataJSON = JSON.stringify(loginInfo);

				$
						.ajax({
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

	$(document)
			.ready(
					function() {
						checkAutoLoginCookie();
						var autoLogin = "false";

						/*-----------------------자동로그인 Toggle 확인------------------------*/
						$('#toggleButton').change(function() {
							console.log('checking autologin');
							console.log($(this).is(":checked"));
							if ($(this).is(":checked")) {
								autoLogin = "true";
							}
						});

						/*------------------------로그인------------------------*/
						$('#loginForm')
								.on(
										'submit',
										function(e) {
											console.log('loginForm submitted');
											e.preventDefault();

											var loginInfo = {
												'email' : $(
														'#loginForm input[name=email]')
														.val(),
												'password' : $(
														'#loginForm input[name=password]')
														.val(),
												'autoLogin' : autoLogin
											};
											var dataJSON = JSON
													.stringify(loginInfo);

											$
													.ajax({
														type : 'POST',
														data : dataJSON,
														url : '${ pageContext.request.contextPath }/authenticate.do',
														contentType : 'application/json',
														dataType : 'json',
														success : (function(
																data) {
															if (data['redirectUrl'] != null) {
																window.location.href = '${ pageContext.request.contextPath }/'
																		+ data['redirectUrl'];
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
						$('#registerForm')
								.on(
										'submit',
										function(e) {
											console
													.log('registerForm submitted');
											e.preventDefault();

											var inputEmail = $(
													'#registerForm input[name=email]')
													.val();
											var inputUserid = $(
													'#registerForm input[name=userid]')
													.val();
											var inputPw = $(
													'#registerForm input[name=password]')
													.val();
											var inputConfirmPw = $(
													'#registerForm input[name=confirmPassword]')
													.val();

											if (!(validateEmail(inputEmail))) {
												alert('입력하신 이메일은 형식에 맞지 않습니다.');
											} else {
												if (!(validateUserid(inputUserid))) {
													alert('아이디 형식이 맞지 않습니다(길이: 5-10, 공백/특수문자 제외)');
												} else {
													if (!(validatePassword(inputPw))) {
														alert('비밀번호 형식이 맞지 않습니다(길이: 5-15, 특수문자(!@#$%^&*만 가능), 공백 제외)');
													} else {
														if (inputPw != inputConfirmPw) {
															alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요');
														} else {
															var newMember = {
																'email' : $(
																		'#registerForm input[name=email]')
																		.val(),
																'userid' : $(
																		'#registerForm input[name=userid]')
																		.val(),
																'password' : $(
																		'#registerForm input[name=password]')
																		.val()
															};
															var dataJSON = JSON
																	.stringify(newMember);

															$
																	.ajax({
																		type : 'POST',
																		data : dataJSON,
																		url : '${ pageContext.request.contextPath }/registerNewMember.do',
																		contentType : 'application/json',
																		dataType : "json",
																		success : function(
																				data) {
																			if (data["emailExists"]) {
																				alert('이미 이메일이 존재합니다.');
																			} else if (data["useridExists"]) {
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
						$('#recoverPassForm')
								.on(
										'submit',
										function(e) {
											console
													.log('recoverPassForm submitted');
											e.preventDefault();

											var emailData = {
												'email' : $(
														'#recoverPassForm input[name=email]')
														.val()
											};
											var dataJSON = JSON
													.stringify(emailData);

											$
													.ajax({
														type : 'POST',
														data : dataJSON,
														url : '${ pageContext.request.contextPath }/recoverPassword.do',
														contentType : 'application/json',
														dataType : "json",
														success : function(data) {

															if (data['errorMessage'] != null) {
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
							client.subscribe('/subscribe/echo', function(
									message) {
								console.log(message);
								$('#alarm').text("new");

								/* 알림 demo.js/ jq-Notification.js에 있음 */
								demo.showNotification2('top', 'left')

							});

						});

						$("#mainvideo").prop('muted', true); //mute 
					});
</script>
<style type="text/css">
#page-content-wrapper {
	padding-top: 0px;
}

#page-content {
	margin-left: 0px;
	margin-left: 0px;
	margin-right: 0px;
	padding: 0px;
}

#page-header {
	visibility: collapse;
}
</style>
</head>
<body>

	<div id="sb-site">
		<div id="page-wrapper">
			<div id="page-content-wrapper">
				<jsp:include page="/top2.do" />

				<div id="page-content" style="background: black;">


					<!-- 메인 사진 -->
					<%-- 		<img src="${pageContext.request.contextPath }/resources/images/background.PNG" class="img-responsive center-block"
			alt="Responsive image" style="width: 100%; height: 700px"> --%>
					<video id="mainvideo" width="100%" height="100%" loop="loop"
						autoplay="autoplay"
						style="margin-top: 0; padding-top: 0; opacity: 0.3; position: relative;">
						<source
							src="${pageContext.request.contextPath }/resources/video/baljagookMain.mp4"
							type="video/mp4">
					</video>

					<!-- 발자국 모양 <로고> -->
					<div
						style="position: absolute; top: 0; left: 0; margin-left: 3%; margin-top: 2%">
						<img
							src="${ pageContext.request.contextPath }/resources/main/footprint1.png"
							width="5%" height="5%" />&nbsp;&nbsp;<span class="mainmsg"
							style="color: white; font-weight: bold; font-size: 15pt">발자국</span>
					</div>
					<!-- 메인 우측 상단  -->
					<c:if test="${empty sessionScope.user }">
						<div
							style="position: absolute; right: 0; top: 0; margin-right: 3%; margin-top: 2%">
							<a data-toggle="modal" data-target="#loginModal"
								data-backdrop="static" data-keyboard="false"
								style="cursor: pointer;"> <i class="fa fa-sign-in"
								style="color: white; font-size: 17pt;"></i>&nbsp;<span
								style="color: white;">로그인</span>&nbsp;&nbsp;
							</a> <a data-toggle="modal" data-target="#signUpModal"
								data-dismiss="modal" data-backdrop="static"
								data-keyboard="false" style="cursor: pointer;"> <i
								class="fa fa-user-plus" style="color: white; font-size: 17pt;"></i>&nbsp;<span
								style="color: white">회원가입</span>
							</a>
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.user }">
						<div
							style="position: absolute; right: 0; top: 0; margin-right: 3%; margin-top: 2%">
							<a href="${ pageContext.request.contextPath }/member/mypage.do">
								<i class="fa fa-user" style="color: white; font-size: 17pt;"></i>&nbsp;<span
								style="color: white;">마이페이지</span>&nbsp;&nbsp;
							</a> <a href="${ pageContext.request.contextPath }/logout.do"> <i
								class="fa fa-sign-out" style="color: white; font-size: 17pt;"></i>&nbsp;<span
								style="color: white;">로그아웃</span>
							</a>
						</div>
					</c:if>
					<!-- 검색바  -->
					<div id="target"
						style="position: absolute; top: 0; left: 0; right: 0; margin-top: 18%; background-color: rgba(0, 0, 0, .5); padding-top: 40px; padding-bottom: 40px;">
						<!-- 검색바 -->
						<div class="container">
							<div class="row  features">
								<div class="col-lg-2 col-md-4 col-sm-6 item"
									style="background: 0;"></div>
								<div class="col-lg-8 col-md-4 col-sm-6 item"
									style="background: 0;">
									<p style="text-align: center">
										<span class="mainmsg"
											style="color: white; font-size: 20pt; font-weight: bold;">발자국,
											나만의 여행 발자취</span>
									<form class="navbar-form navbar-nav"
										action="${pageContext.request.contextPath }/map/search.do"
										method="get" style="text-align: center;">
										<input type="text" size=80%; class="form-control"
											placeholder="원하시는 여행지를 입력해 주세요" id="searchtext"
											style="background-color: transparent; height: 50px"
											onKeyPress="if (event.keyCode==13){ goSearch();event.returnValue=false}" />&nbsp;&nbsp;
										<a href="javascript:goSearch()"> <img
											src="${ pageContext.request.contextPath }/resources/main/search1.png"
											width="5%" height="5%"></a>
									</form>
									<div class="col-lg-8 col-md-4 col-sm-6 item"
										style="background: 0; padding-top: 1%;">
										<span class="mainmsg"
											style="color: white; font-size: 16pt; padding-left: 15%;">
											나만의 새로운 여행 경로를 만들어보세요!</span><br /> <span class="mainmsg"
											style="color: white; font-size: 16pt; padding-left: 15%;">
											여행경로를 타인에게 공유해 보세요! </span><br />
									</div>
									<span style="right: 0;">
										<button class="dropdown-item btn btn-primary" type="button"
											style="height: 65px; font-size: 12pt; background: red; color: white; font-weight: 600; margin-top: 1%;"
											data-toggle="modal" data-target="#signUpModal"
											data-dismiss="modal" data-backdrop="static"
											data-keyboard="false">GET STARTED</button>
									</span>
								</div>
								<div class="col-lg-2 col-md-4 col-sm-6 item"
									style="background: 0;"></div>
							</div>
						</div>
						<!-- <p><span style="color: white; font-size: 20pt;">Your maps are your stories</span> -->
						<!-- 			<h2 style="color: white; text-align: center;">Your maps are your stories</h2>    
			<h3 style="color: white;">Make amazing interactive maps for past,</h3>
			<h3 style="color: white;">present and future adventures. It's free!</h3> -->

						<!-- GET STARTED -->
						<!-- 			<div style="right: 0; bottom: 0; position:inherit;">
				<button class="dropdown-item btn btn-primary" type="button" 
					style="height: 65px; font-size: 12pt; background: white; color: black; font-weight: 600;"
					data-toggle="modal" data-target="#signUpModal"
					data-dismiss="modal" data-backdrop="static" data-keyboard="false">
					GET STARTED
				</button>
			</div> -->






						<!-- 사이트 소개 -->
						<div
							style="position: absolute; left: 0; right: 0; bottom: 0; background: 0">
							<div class="container">
								<div class="intro"></div>
								<div class="row  features">
									<div class="col-lg-3 col-md-4 col-sm-6 item"
										style="background: 0;">
										<h2 class="text-center">
											<img
												src="${ pageContext.request.contextPath }/resources/main/addplace1.png"
												width="30%" height="30%">
										</h2>
										<h3 class="name text-center" style="color: white;">
											<span style="color: red">A</span>dd Places
										</h3>
										<p class="description text-center" style="color: white;">당신이
											다닌 장소를 추가하세요.</p>
									</div>

									<div class="col-lg-3 col-md-4 col-sm-6 item"
										style="background: 0;">
										<h2 class="text-center">
											<img
												src="${ pageContext.request.contextPath }/resources/main/star1.png"
												width="30%" height="30%">
										</h2>
										<h3 class="name text-center" style="color: white;">
											<span style="color: red">A</span>dd Favorites
										</h3>
										<p class="description text-center" style="color: white;">가고싶은
											여행이나 장소를 추가하세요.</p>
									</div>

									<div class="col-lg-3 col-md-4 col-sm-6 item"
										style="background: 0;">
										<h2 class="text-center">
											<img
												src="${ pageContext.request.contextPath }/resources/main/picture1.png"
												width="30%" height="30%">
										</h2>
										<h3 class="name text-center" style="color: white;">
											<span style="color: red">A</span>dd Photos
										</h3>
										<p class="description text-center" style="color: white;">사진
											추가가능.</p>
									</div>
									<div class="col-lg-3 col-md-4 col-sm-6 item"
										style="background: 0;">
										<h2 class="text-center">
											<img
												src="${ pageContext.request.contextPath }/resources/main/share1.png"
												width="30%" height="30%">
										</h2>
										<h3 class="name text-center" style="color: white;">
											<span style="color: red">S</span>hare
										</h3>
										<p class="description text-center" style="color: white;">당신의
											발자취를 공유해 보세요.</p>
									</div>

								</div>
							</div>
						</div>



					</div>
				</div>
				<!-- 인기글 4개 노출 -->
				<div class="projects-clean">
					<div class="container">
						<div class="intro">
							<h2 class="text-center">Featured</h2>
						</div>
						<div class="row projects">
							<div class="col-lg-3 col-sm-6 item">
								<a
									href="${pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList[0].idx }">
									<div class="card">
										<img class="img-reponsive" alt="사진1"
											src="<c:url value="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|${ regOne }&size=256x256&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc"/>">
										<h3 class="name">${ mymapList[0].title }</h3>
										<p class="description">${ mymapList[0].content }</p>
										<div class="card-stats small text-muted"
											style="margin-top: 10px;">
											<i class="fa fa-globe"></i>&nbsp;&nbsp;${ regmapList[0].viewcnt }
											views
										</div>
									</div>
								</a>
							</div>
							<div class="col-lg-3 col-sm-6 item">
								<a
									href="${pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList[1].idx }">
									<div class="card">
										<img class="img-reponsive" alt="사진1"
											src="<c:url value="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|${ regTwo }&size=256x256&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc"/>">
										<h3 class="name">${ mymapList[1].title }</h3>
										<p class="description">${ mymapList[1].content }</p>
										<div class="card-stats small text-muted"
											style="margin-top: 10px;">
											<i class="fa fa-globe"></i>&nbsp;&nbsp;${ regmapList[1].viewcnt }
											views
										</div>
									</div>
								</a>
							</div>
							<div class="col-lg-3 col-sm-6 item">
								<a
									href="${pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList[2].idx }">
									<div class="card">
										<img class="img-reponsive" alt="사진1"
											src="<c:url value="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|${ regThree }&size=256x256&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc"/>">
										<h3 class="name">${ mymapList[2].title }</h3>
										<p class="description">${ mymapList[2].content }</p>
										<div class="card-stats small text-muted"
											style="margin-top: 10px;">
											<i class="fa fa-globe"></i>&nbsp;&nbsp;${ regmapList[2].viewcnt }
											views
										</div>
									</div>
								</a>
							</div>
							<div class="col-lg-3 col-sm-6 item">
								<a
									href="${pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList[3].idx }">
									<div class="card">
										<img class="img-reponsive" alt="사진1"
											src="<c:url value="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|${ regFour }&size=256x256&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc"/>">
										<h3 class="name">${ mymapList[3].title }</h3>
										<p class="description">${ mymapList[3].content }</p>
										<div class="card-stats small text-muted"
											style="margin-top: 10px;">
											<i class="fa fa-globe"></i>&nbsp;&nbsp;${ regmapList[3].viewcnt }
											views
										</div>
									</div>
								</a>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
		<jsp:include page="/bottom2.do" />

	</div>
</body>
</html>