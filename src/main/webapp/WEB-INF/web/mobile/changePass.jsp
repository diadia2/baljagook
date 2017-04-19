<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/main.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/sub.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/resources/css/mobile/member.css" rel="stylesheet">
	

	<script src="//code.jquery.com/jquery-latest.min.js"></script>

	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"> -->
<!-- 	<link href="/mobile/img/favicon.ico" rel="icon" type="image/x-icon"> -->
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery-2.1.4.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery.bxslider.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/placeholders.js"></script>

	
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery.swipebox.js"></script>
	<link href="${pageContext.request.contextPath }/resources/js/mobile/swipebox.css" rel="stylesheet" type="text/css"/>


	<!-- Add fancyBox main JS and CSS files -->
<!-- 	<script type="text/javascript" src="./js/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="./js/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" /> -->


	<script src="${pageContext.request.contextPath }/resources/js/mobile/script.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/board.css" rel="stylesheet" type="text/css"/>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/util.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/html5shiv-printshiv.js"></script>
	<![endif]-->
<script>
	$(document).ready(function() {
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
						window.location.href = '${ pageContext.request.contextPath }/m/main.do';
					}
				}
			});				
		});		
		
	});
</script>	


</head>
<body>
	<div class="side_menu_bg"></div>
	<div class="layer_bg"></div>

<div id="wrap">
		<header id="header_1" style="text-align:center;">
			<img src="${pageContext.request.contextPath }/resources/images/mobile/logo.png" />
            	<p>비밀번호 변경</p>
		</header>

	<section id="container" class="register">		
		<section class="register_form">
			<form id="recoverPassForm">

				<fieldset>
					<legend>비밀번호 변경 양식</legend>
					<ul>
						<li>
							<h3>이메일</h3>
							<div>
								<input type="text" name="email" placeholder="이메일" onfocus="this.placeholder=''" onblur="this.placeholder='이메일'">
							</div>
						</li>
					</ul>
					
                    <div class="register_submit">
                        <input type="submit" value="임시비밀번호 받기">
					</div>

                    <div class="register_bottom">
                    </div>

				</fieldset>
			</form>
			
		</section>
		
	</section>
	<!-- //container End -->
</div>
</body>
</html>