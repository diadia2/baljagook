<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
	<div class="side_menu_bg"></div>
	<div class="layer_bg"></div>

	<div id="wrap">
		<header id="header_1" style="text-align: center;">
			<img
				src="${pageContext.request.contextPath }/resources/images/mobile/logo.png" />
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
									<input type="text" name="email" placeholder="이메일"
										onfocus="this.placeholder=''" onblur="this.placeholder='이메일'">
								</div>
							</li>
							<li>
								<h3>비밀번호</h3>
								<div>
									<input type="password" name="password" placeholder="비밀번호"
										onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'">
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



						<div class="register_submit">
							<input type="submit" value="로그인">
							<!-- <input type="button" type="button" value="SIGN IN Facebook" > -->
						</div>

						<div class="register_bottom">
							<span><a
								href="${ pageContext.request.contextPath }/m/changePass.do">Lost
									Password</a></span> <span><a
								href="${pageContext.request.contextPath }/m/signup.do">회원가입</a></span>
						</div>

					</fieldset>
				</form>

			</section>

		</section>
		<!-- //container End -->
	</div>
</body>
</html>