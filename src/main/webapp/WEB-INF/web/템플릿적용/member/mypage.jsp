<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<style type="text/css">
body {
	padding-top: 80px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>

		<div class="container">
			<div class="row">
				<div class="col-md-2" style="border: solid;">s<br/></div>
				<div class="col-md-10" style="border: solid;">s</div>
			</div>
		</div>


	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>