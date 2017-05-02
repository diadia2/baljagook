<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/input-switch/inputswitch.js"></script>
<script type="text/javascript">
	/* Input switch */

	$(function() {
		"use strict";
		$('.input-switch').bootstrapSwitch();
	});
</script>
</head>
<body>
	<!-- 비밀번호 변경 모달 -->
	<div class="modal fade" id="recoverPassModal" tabindex="-1"
		role="dialog" aria-labelledby="recoverPassModalTitle"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-center">비밀번호 변경</h4>
				</div>
				<form id="recoverPassForm">
					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon addon-inside bg-black"><i
								class="glyph-icon icon-elusive-mail"></i></span> <input type="text"
								name="email" class="form-control" placeholder="이메일">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary ">임시비밀번호 받기</button>
						<button class="dropdown-item btn btn-default" type="button"
							data-toggle="modal" data-target="#loginModal"
							data-dismiss="modal" data-backdrop="static" data-keyboard="false">
							<i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;로그인
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-center">로그인하세요.</h4>
				</div>
				<form id="loginForm">
					<div class="modal-body" style="padding-top: 20px;">
						<div class="input-group col-md-6"
							style="width: 50%; padding: 0px;">
							<span class="input-group-addon addon-inside bg-black"><i
								class="glyph-icon icon-elusive-torso"></i></span> <input type="text"
								name="email" class="form-control" placeholder="이메일">
						</div>
						<div class="input-group col-md-6"
							style="width: 50%; padding: 0px;">
							<select class="form-control" name="email2"><option>@naver.com</option>
								<option>@gmail.com</option>
								<option>@daum.net</option>
								<option>@nate.com</option>
								<option>직 접 입 력</option></select>
						</div>
						<div class="input-group">
							<span class="input-group-addon addon-inside bg-black"><i
								class="glyph-icon icon-lock"></i></span> <input type="password"
								name="password" class="form-control" placeholder="비밀번호">
						</div>
						<div class="bootstrap-switch-container text-right"
							style="margin: 10px;">
							<span class="font-bold font-black">자동 로그인</span>&nbsp;&nbsp; <input
								type="checkbox" id="toggleButton" data-on-color="info"
								data-size="small" name="checkbox-example-2" class="input-switch"
								checked="checked" data-on-text="On" data-off-text="Off">
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-lg btn-info btn-block">로그인</button>
						</div>

					</div>
				</form>
				<div class="modal-footer" style="padding: 0px;">
					<div class="btn-group btn-group-lg" style="width: 100%;">
						<button id="recoverPassword" class="btn btn-default" type="button"
							data-toggle="modal" data-target="#recoverPassModal"
							data-dismiss="modal" data-backdrop="static" data-keyboard="false"
							style="width: 50%;">
							<i class="glyph-icon icon-question" aria-hidden="true"></i>&nbsp;비밀번호
							찾기
						</button>
						<button class="btn btn-default" type="button" data-toggle="modal"
							data-target="#signUpModal" data-dismiss="modal"
							data-backdrop="static" data-keyboard="false" style="width: 50%;">
							<i class="fa fa-user-plus"></i>&nbsp;회원가입
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 모달 -->
	<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-center">회원 가입</h4>
				</div>
				<form class="form-horizontal bordered-row" id="registerForm"
					data-parsley-validate="">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Email</label>
							<div class="col-sm-6">
								<input type="text" name="email" data-parsley-type="email"
									placeholder="Email address" required class="form-control"
									data-parsley-required-message="필수 입력 항목입니다."
									data-parsley-type-message="이메일 형식으로 입력해주세요.">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">user name</label>
							<div class="col-sm-6">
								<input type="text" name="userid" data-parsley-type="alphanum"
									placeholder="User name" required class="form-control"
									data-parsley-maxlength="10" data-parsley-minlength="5"
									data-parsley-minlength-message="입력값이 너무 짧습니다."
									data-parsley-maxlength-message="입력값이 너무 깁니다."
									data-parsley-pattern-message="영문/숫자 조합 5~10자 조합으로 입력해주세요."
									data-parsley-required-message="필수 입력 항목입니다.">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Password</label>
							<div class="col-sm-6">
								<input type="password" id="ps1" name="password"
									placeholder="Password" required class="form-control"
									data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{5,15}$"
									data-parsley-minlength-message="입력값이 너무 짧습니다."
									data-parsley-maxlength-message="입력값이 너무 깁니다."
									data-parsley-pattern-message="영문/숫자/특수문자 조합 5~15자 조합으로 입력해주세요."
									data-parsley-required-message="필수 입력 항목입니다.">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Repeat Password</label>
							<div class="col-sm-6">
								<input type="password" name="confirmPassword"
									placeholder="Confirm Password" data-parsley-equalto="#ps1"
									required class="form-control"
									data-parsley-required-message="필수 입력 항목입니다.">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">회원가입</button>
						<button class="dropdown-item btn btn-default" type="button"
							data-toggle="modal" data-target="#loginModal"
							data-dismiss="modal" data-backdrop="static" data-keyboard="false">
							<i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;로그인
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/dropdown/dropdown.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/tooltip/tooltip.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/popover/popover.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/progressbar/progressbar.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/button/button.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/collapse/collapse.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/superclick/superclick.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/input-switch/inputswitch-alt.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/slimscroll/slimscroll.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/slidebars/slidebars.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/slidebars/slidebars-demo.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/charts/piegage/piegage.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/charts/piegage/piegage-demo.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/screenfull/screenfull.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/content-box/contentbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/material/material.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/material/ripples.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/overlay/overlay.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/js-init/widgets-init.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/themes/admin/layout.js"></script>
	<!-- validation -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/assets/widgets/parsley/parsley.js"></script>
	<!-- sockjs -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.min.js"></script>
	<!-- stomp -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</body>
</html>