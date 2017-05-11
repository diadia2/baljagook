<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	function go_login() {
		location.href = "${pageContext.request.contextPath}/m/login.do";
	}
</script>
<script>
	$(document)
			.ready(
					function() {

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
	<div class="row">
		<div class="col s12 m10 offset-m1 l6 offset-l3">
			<div class="card-panel grey lighten-5 z-depth-1"
				style="background-color: white !important;">
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
							<h3>시작하기</h3>
							<br />
						</header>
						<section id="container" class="register">
							<section class="register_form">
								<form id="registerForm">
									<fieldset>
										<ul>
											<li>
												<div class="input-field col s12">
													<!-- <input type="text" name="email" placeholder="이메일"
										onfocus="this.placeholder=''" onblur="this.placeholder='이메일'"> -->
													<input id="email" type="email" name="email"
														class="validate"> <label for="email">Email</label>

												</div>
											</li>
											<li>
												<div class="input-field col s12">
													<input id="userid" type="text" class="validate"
														name="userid"> <label for="userid">User Id</label>
												</div>
											</li>


											<li>
												<div class="input-field col s12">
													<input id="password" type="password" name="password"
														class="validate"> <label for="password">Password</label>
												</div>
											</li>
											<li>
												<div class="input-field col s12">
													<input id="confirmPassword" type="password"
														name="confirmPassword" class="validate"> <label
														for="password">Confirm Password</label>
												</div>
											</li>

										</ul>
										<div class="center-align">
											<button class="btn waves-effect waves-light blue"
												type="submit" name="action">
												가입하기<i class="material-icons right">send</i>
											</button>
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