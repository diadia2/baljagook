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
				<ul class="row list-inline" style="font-style: italic; font-size: 18px;">
					<li class="col-md-12"><a href="main.do">Home</a>&nbsp;&nbsp; <a
						href="#">Introduce</a>&nbsp;&nbsp; <a href="qna.do">FAQ</a></li>
					<%-- <img
							src="${pageContext.request.contextPath }/resources/images/google.png"/> --%>
				</ul>
				<p class="copyright">ⓒ 2017 baljaguk, Inc.</p>
			</div>
			<div style="position: absolute; bottom: 58px; left: 70%;">
				<a
					href="https://play.google.com/store/apps/details?id=co.kr.bit.mymap"><img
					src="<c:url value="/resources/images/google.png"/>" /></a>
			</div>
		</footer>


	</div>
</body>
</html>