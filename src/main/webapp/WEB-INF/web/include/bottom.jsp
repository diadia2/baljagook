<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 하단 footer -->
	<div class="footer-basic">
		<footer>
			<div class="social container">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i> </a>
						<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a><a
							href="#"><i>kakao</i></a>
					</div>
					<div class="col-md-4">
						<a href="https://play.google.com/intl/en_us/badges/"><img
							src="<c:url value="/resources/images/google.png"/>"/></a>
							<%-- <img
							src="${pageContext.request.contextPath }/resources/images/google.png"/> --%>
					</div>
				</div>
			</div>
			<ul class="list-inline">
				<li><a href="main.do">Home</a></li>
				<li><a href="#">Introduce</a></li>
				<li><a href="noticeList.do">Notice</a></li>
				<li><a href="qna.do">FAQ</a></li>
			</ul>
			<p class="copyright">ⓒ 2017 baljaguk, Inc.</p>
		</footer>
	</div>
</body>
</html>