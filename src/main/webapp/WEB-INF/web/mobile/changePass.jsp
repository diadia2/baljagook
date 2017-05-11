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

<script>
	$(document)
			.ready(
					function() {
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
																window.location.href = '${ pageContext.request.contextPath }/m/main.do';
															}
														}
													});
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
						<div>
							<br />
							<br />
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
								<br />
								<br />
								<h3>비밀번호 변경</h3>
								<br />
							</header>
							<section id="container" class="register">
								<section class="register_form">
									<form id="recoverPassForm">
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
											</ul>
											<div class="center-align">
												<button class="btn waves-effect waves-light blue"
													type="submit" name="action">임시 비밀번호 받기</button>
												<!-- <input type="button" type="button" value="SIGN IN Facebook" > -->

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
	</div>
</body>
</html>