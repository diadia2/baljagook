<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>top</title>

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
</head>
<body>
	<!-- 상단 바 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- 로고, 이미지로 바꿀것 -->
				<a class="navbar-brand" href="main.do">나만의 지도</a>
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
					<input type="text" class="form-control" placeholder="Search"
						size="50%" style="text-align: center;" />&nbsp;&nbsp; <a href="searchList.do"><i
						class="fa fa-search fa-2x" aria-hidden="true"></i></a>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<!-- 우상단 드롭 메뉴 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false"><span>메뉴</span> <span
							class="caret"></span> </a>
						<ul class="dropdown-menu">
							<li><a data-toggle="modal" data-target="#loginModal"
								data-backdrop="static" data-keyboard="false">로그인</a></li>
							<li><a href="mypage.do">마이페이지</a></li>
							<li class="divider"></li>
							<li><a href="#">로그아웃</a></li>
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
								<input type="text" class="form-control modal-text"
									placeholder="Email or username">
							</div>
						</div>
						<div class="row">
							<div class="col-md-1">
								<i class="fa fa-lock fa-2x" aria-hidden="true"></i>
							</div>
							<div class="col-md-11 form-group">
								<input type="password" class="form-control modal-text"
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
								<button type="button" class="btn btn-primary col-md-12">Sign
									In</button>
							</div>
						</div>
					</div>
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
								<input type="text" class="form-control modal-text"
									placeholder="Email address">
							</div>
							<div class="col-md-1">
								<i class="fa fa-user fa-2x" aria-hidden="true"></i>
							</div>
							<div class="col-md-11 form-group">
								<input type="text" class="form-control modal-text"
									placeholder="User name">
							</div>
						</div>
						<div class="row">
							<div class="col-md-1">
								<i class="fa fa-lock fa-2x" aria-hidden="true"></i>
							</div>
							<div class="col-md-11 form-group">
								<input type="password" class="form-control modal-text"
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
								<button type="button" class="btn btn-primary col-md-12">Sign
									Up</button>
							</div>
							<br /> <br />
							<div class="col-md-12">
								<button type="button" class="btn btn-default col-md-12">연동
									버튼</button>
							</div>
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
						<i class="fa fa-user-plus"></i>&nbsp;Sign Up
					</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>