<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="background-color: #fafafa !important;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
<!-- icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- cookie -->
<script
	src="${pageContext.request.contextPath}/resources/js/js.cookie.js"></script>

<script>
	$(document)
			.ready(
					function() {
						var autoLogin = "false";
						/*-----------------------자동로그인 Toggle 확인------------------------*/
						$('#agree01').change(function() {
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
	<div class="row">
		<div class="col s12 m10 offset-m1 l6 offset-l3"> 
			<div class="card-panel grey lighten-5 z-depth-1" style="background-color: white !important;">
				<div class="row valign-wrapper">

					<div class="col s12">
						<br /> <br />
						<header id="header_1">
							<!-- 발자국 모양 <로고> -->
							<div>
								<a class="navbar-brand"
									href="${pageContext.request.contextPath }/main.do"><img
									class="logoImage" width="40" height="40"
									src="${ pageContext.request.contextPath }/resources/images/baljagook_logo.png">
									&nbsp;&nbsp;<span class="mainmsg"
									style="font-weight: bold; font-size: 15pt; color: black;">발자국</span></a>
							</div>
							<br /> <br />
							<h3>로그인</h3>
							<br />
						</header>
						<section id="container" class="register">
							<section class="register_form">
								<form id="" action="/j_spring_security_check">
									<fieldset>
										<ul>
											<li>
												<div class="input-field col s12">
													<!-- <input type="text" name="email" placeholder="이메일"
										onfocus="this.placeholder=''" onblur="this.placeholder='이메일'"> -->
													<input id="email" type="email" name="j_username"
														class="validate"> <label for="email">Email</label>

												</div>
											</li>
											<li>
												<div class="input-field col s12">
													<input id="password" type="password" name="j_password"
														class="validate"> <label for="password">Password</label>
													<!-- <input type="password"
										name="password" placeholder="비밀번호"
										onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'"> -->
												</div>
											</li>
											<li>
												<div>
													<label for="agree01" class="ios_check"><input
														type="checkbox" id="agree01"
														class="ios-switch green  bigswitch"><span><span></span></span>
														<span>자동로그인</span> </label>
												</div>
											</li>
										</ul>
										<div class="right-align" style="margin-right: 15%">
											<button class="btn waves-effect waves-light blue"
												type="submit" name="action">로그인</button>
											<!-- <input type="button" type="button" value="SIGN IN Facebook" > -->

										</div>
										<div class="center-align">
											<span><a
												href="${ pageContext.request.contextPath }/m/changePass.do">비밀번호를
													잊으셨나요?</a></span><br /> <span><a
												href="${pageContext.request.contextPath }/m/signup.do">회원가입하실래요?</a></span>
										</div>
									</fieldset>
								</form>
							</section>
						</section>
						<!-- //container End -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>