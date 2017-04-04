<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>

<link rel="stylesheet" href="./css/sub.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.datetimepicker.js"
	charset="UTF-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/jquery.datetimepicker.css" />
	
<script type="text/javascript">
	$(document).ready(function() {
		$(".div_qna li").click(function() {
			$(this).find("p").slideToggle();
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<div class="container">
			<div class="div_main">
				<div class="div_qna">
					<!-- 여기에 ajax를 통한 데이터 넣으면 됨 -->
					<ul>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
						<li>Q : 순일이의 모험
							<p>A : 내용입니다</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>