<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		alert('이메일 인증 실패ㅠㅠ다시 시도해주세요.');
		window.location.href = '${ pageContext.request.contextPath }/main.do';
	});
</script>
</head>
<body>
</body>
</html>