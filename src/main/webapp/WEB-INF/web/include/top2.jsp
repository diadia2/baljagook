<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title>gMaps</title>
<style>
.logoImage {
	margin-left: 3%;
	margin-top: 2%;
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

/*-----------------------자동로그인 Toggle 확인------------------------*/
var changeAutoLogin = true;
function changeToggleButton() {
	console.log('checking autologin');
	console.log($('#toggleButton').is(":checked"));
	if($('#toggleButton').is(":checked")) {
		autoLogin = "true";
		changeAutoLogin = false;
	}
}
	$(document).ready(function() {
 		checkAutoLoginCookie();
		
		if(changeAutoLogin) {
			autoLogin = "false";
		}
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
		
/*-----------------------프로필 이미지 가져오기------------------------*/
	$.ajax({
		type : 'POST',
		url : '${ pageContext.request.contextPath }/getMyProfileImage.do',
		contentType : 'application/json',
		dataType : 'json',
		success : function(imageName) {
			$("#profileImage").prop("src", "${ pageContext.request.contextPath }/resources/photo/profileImage/"+imageName);			
		}
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
	<div id="loading">
		<div class="svg-icon-loader">
			<img
				src="${pageContext.request.contextPath }/resources/assets/images/svg-loaders/bars.svg"
				width="40" alt="">
		</div>
	</div>

	<div id="mobile-navigation">
		<button id="nav-toggle" class="collapsed" data-toggle="collapse"
			data-target="#page-sidebar">
			<span></span>
		</button>
	</div>
	
<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/modal/modal.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/interactions-ui/resizable.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/interactions-ui/draggable.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/interactions-ui/sortable.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/interactions-ui/selectable.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/dialog/dialog.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/dialog/dialog-demo.js"></script>
						
	<div id="page-header">
		<div id="header-nav-left">
			<label><span id="alarm"></span> </label>&nbsp;&nbsp;
			<a class="header-btn" id="logout-btn" href="lockscreen-3.html"
				title="Lockscreen page example"><i
				class="glyph-icon icon-linecons-lock"></i></a>
			<div class="user-account-btn dropdown">
				<a href="#" title="My Account" class="user-profile clearfix"
					data-toggle="dropdown"><img id="profileImage" width="28" height="28"
					src="${ pageContext.request.contextPath }/resources/photo/profileImage/${ imageName }"
					alt="Profile image"> <span>${sessionScope.user}</span> <i
					class="glyph-icon icon-angle-down"></i></a>

				<ul class="dropdown-menu" role="menu" style="display: none;"> 
					<c:if test="${empty sessionScope.user }">
						<li><a data-toggle="modal" data-target="#loginModal"
										data-backdrop="static" data-keyboard="false">
										<i class="fa fa-sign-in"></i>&nbsp;&nbsp;Sign Up</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.user }">
						<li><a href="${pageContext.request.contextPath }/member/mypage.do"><i class="fa fa-user"></i>&nbsp;&nbsp;MyPage</a></li>
						<li class="divider"></li>
						<li><a href="${ pageContext.request.contextPath }/logout.do"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Sign Out</a></li>
					</c:if>
				</ul>

			</div>
		</div>
		<div id="header-nav-right" class="row">
			<div class="col-md-4"><a class="navbar-brand" href="${pageContext.request.contextPath }/main.do"><img class="logoImage" width="40" height="40" src="${ pageContext.request.contextPath }/resources/images/baljagook_logo.png"> &nbsp;&nbsp;<span class="mainmsg" style="font-weight: bold; font-size: 15pt;top: 24px; position: absolute;">발자국</span></a></div>
			<div class="col-md-4">
				<div class="input-group" id="searchvar">
					<form action="${pageContext.request.contextPath }/map/search.do" method="get">
						<input type="text" class="form-control" placeholder="Search" id="searchtext"
							style="margin-top: 13px;" onKeyPress="if (event.keyCode==13){ goSearch();event.returnValue=false}">
					</form>
					<span class="input-group-btn"><a
						href="javascript:goSearch()" class="hdr-btn"><i class="glyph-icon icon-search"></i></a></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>