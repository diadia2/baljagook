<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style type="text/css">
</style>

<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	function goSearch(){
	    location.href = "${ pageContext.request.contextPath }/map/search.do?searchtext="+$('#searchtext').val();
	}
</script>

</head>
<body>
	<!-- Preloader -->
	<div class="preloader-wrap">
		<div class="preloader-inside">
			<div class="spinner spinner-1">
				<img
					src="${pageContext.request.contextPath }/resources/img/logo.png"
					alt="responsive img">
			</div>
		</div>
	</div>
	<!-- End Preloader -->
	<!-- Scroll Top Button -->
	<a href="#home" class="smoothscroll">
		<div class="scroll-top">
			<i class="fa fa-angle-up"></i>
		</div>
	</a>
	<!-- End Scroll Top Button -->

	<!-- Nav Section -->
	<header>
		<!-- Nav Section -->
		<nav class="navbar navbar-default navbar-fixed-top nav-area"
			id="scroll-menu">
			<div class="container">
				<div class="row">
					<div class="navbar-header col-md-3">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
<script>
	$(document).ready(function() {
/*------------------------로그인------------------------*/
		$('#loginForm').on('submit', function(e) {
			console.log('loginForm submitted');
			e.preventDefault();
			
			var loginInfo = {
					'email' : $('#loginForm input[name=email]').val(),
					'password' : $('#loginForm input[name=password]').val()
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

/*-----------------------회원가입------------------------*/
		$('#registerForm').on('submit', function(e) {
			console.log('registerForm submitted');
			e.preventDefault();
		
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
				<form class="navbar-form navbar-nav">
					<input type="text" class="form-control" placeholder="Search" id="searchtext"
						size="50%" style="text-align: center;" onKeyPress="if (event.keyCode==13){ goSearch();event.returnValue=false}"/>&nbsp;&nbsp; <a href="javascript:goSearch()"><i
						class="fa fa-search fa-2x" aria-hidden="true"></i></a>
				</form>
<!--  sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss-->
				<label>ID : ${sessionScope.user} </label>
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
							<h5 class="col-md-12 text-center">Sign in to your account</h5>
							<br /> <br /> <br />
						</div>
						<div class="row">
							<div class="col-md-1">
								<i class="fa fa-user fa-2x" aria-hidden="true"></i>
							</div>
							<div class="col-md-11 form-group">
								<input type="text" name="email" class="form-control modal-text"
									placeholder="Email or username">
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
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
								<div class="toggle-button toggle-button--ilma">
									<input id="toggleButton" type="checkbox"> <label
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
					<button class="dropdown-item btn btn-primary" type="button"
						data-toggle="modal" data-target="#passwordModal"
						data-dismiss="modal" data-backdrop="static" data-keyboard="false">
						<i class="fa fa-question" aria-hidden="true"></i>&nbsp;Lost
						Password
					</button>
					<button class="dropdown-item btn btn-primary" type="button"
						data-toggle="modal" data-target="#signUpModal"
						data-dismiss="modal" data-backdrop="static" data-keyboard="false">
						<i class="fa fa-user-plus"></i>&nbsp;Sign Up
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
									<input type="password" class="form-control modal-text"
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
						<a class="navbar-brand" href="${pageContext.request.contextPath }/main.do"><img
							src="${pageContext.request.contextPath }/resources/img/logo.png"
							alt="responsive img"></a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<div class="nav navbar-nav navbar-left col-md-6">
							<!-- hidden-xs hidden-sm -->
							<form action="${pageContext.request.contextPath }/map/search.do" method="get">
								<div class="form-group">
									<div class="input-group">
										<input id="searchtext" name="searchtext" type="text" placeholder="Search"
											class="form-control placeholder"> <span
											class="input-group-btn"> <a href="javascript:goSearch()"
											class="btn btn-default btn-search"><i
												class="fa fa-search"></i></a>
										</span>
									</div>
								</div>
							</form>
						</div>
						<ul class="nav navbar-nav col-md-3 aa">
							<li><a href="#">Log In</a></li>
							<!-- <li><a href="#">Log Out</a></li> -->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">User : ${sessionScope.user }</a>
								<ul class="dropdown-menu">
									<li><a href="${ pageContext.request.contextPath }/member/mypage.do">My Page</a></li>
									<li><a href="#">Log Out</a></li>
									<li><a href="#">Service</a></li>
								</ul></li>
						</ul>

					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</nav>
	</header>
	<!-- End Nav Section -->
</body>
</html>