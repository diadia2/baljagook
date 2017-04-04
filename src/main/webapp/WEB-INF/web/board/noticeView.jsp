<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice Vuew</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sub.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery.datetimepicker.js"
	charset="UTF-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/jquery.datetimepicker.css" />
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<div class="container">
			<div class="div_main">
				<div class="div_view">
					<!-- 여기에 ajax를 통한 데이터 넣으면 됨 -->
					<div class="titles">
						제목 : 공지사항이라요<span>Date : 2017-01-01</span>
					</div>

					<div class="contents">여기부터는 내용이라우</div>

					<div class="menus">
						<button type="button">목록</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>