<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/comment/mapComment.js"></script>
</head>
<body>
	<!-- 출력 -->
	<div id="cmt"></div>

	<!-- 입력 aaas-->
	<div>
		<div class="form">
		<input type="hidden" value="1" id="regmapidx">
		<input type="text" value="kt" id="userid" disabled="disabled">
			<textarea placeholder="댓글" id="content"></textarea>
			<input type="button" value="등록" id="cmtBtm" />
		</div>
	</div>


</body>
</html>