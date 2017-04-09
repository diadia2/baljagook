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
<script src="${pageContext.request.contextPath }/resources/js/comment/mapCommentList.js"></script>
</head>
<body>
	<!-- 출력 -->
	<div>
		<c:forEach var="cmt" items="${cmtList }">
			<div id="<c:out value='${cmt.idx }' />" <c:if test="${cmt.lvl>0 }">style="margin-left: ${cmt.lvl*30 }px;"</c:if>>
				<input type="text" class="cmt" value ="<c:out value='${cmt.content }' />" disabled="disabled">
				<span id="<c:out value='id${cmt.idx }' />">
				<c:out value="${cmt.userid }, " />
				<c:out value="${cmt.regdate }, " />
	<%-- <c:out value="${cmt.regmapidx }" /> --%>
				</span>
				<br />
				<button class="mod1">수정</button>
				<button class="mod2">완료</button>
				<button class="del">삭제</button>
				<button class="reply">답글</button>
			</div>
			=======================
			<br />
		</c:forEach>

		
	</div>

</body>
</html>