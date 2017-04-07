<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Map Comment List Ajax</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/comment/mapCommentList.js"></script>
</head>
<body>
	<c:forEach var="cmt" items="${mapCommentList }">
		<div class="row" id="<c:out value='${cmt.idx }' />" <c:if test="${cmt.lvl>0 }">style="margin-left: ${cmt.lvl*30 }px;"</c:if>>
			<!-- 프로필사진 -->
			<div class="col-sm-1">
				<div class="thumbnail">
					<img class="img-responsive user-photo"
						src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
				</div>
			</div>
			<div class="col-sm-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong><c:out value="${cmt.userid }" /></strong> <span class="text-muted"><c:out value="${cmt.regdate }" /></span>
					</div>
					<div class="panel-body"><input type="text" class="cmt" value ="<c:out value='${cmt.content }' />" disabled="disabled"></div>
				</div>
				<button class="mod1">수정</button>
				<button class="mod2">완료</button>
				<button class="del">삭제</button>
				<button class="reply">답글</button>
			</div>
		</div>
	</c:forEach>
</body>
</html>