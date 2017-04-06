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
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "cmt.do",
			type : "post",
			data : "userid="+$("#userid").val()+"&content=" + $("#content").val()+"&regmapidx=" + $("#regmapidx").val(),
			/* 포스트형식으로 보낼때 json으로 보낸후 컨트롤러에서 리퀘스트바디로 받음 */
			success : callback
		});
		$("#cmtBtm").click(function() {
			/* $.ajax({
				url : "insert.do",
				type : "get",
				data : "userid="+$("#userid").val()+"&content=" + $("#content").val()+"&regmapidx=" + $("#regmapidx").val(),
				/* 포스트형식으로 보낼때 json으로 보낸후 컨트롤러에서 리퀘스트바디로 받음 
				success : callback
			});*/
			var json = {
					userid : $("#userid").val(),
					content : $("#content").val(),
					regmapidx : $("#regmapidx").val(),
	/* 				idx : '240' */
			}
			$.ajax({
				type : "post",
				url : "insert.do",
				data : json,
				/* 포스트형식으로 보낼때 json으로 보낸후 컨트롤러에서 리퀘스트바디로 받음 
					dataType : (xml,html,json,jsonp,script,text)
				*/
				success : callback
			});
		});

	});
	function callback(data) {
		$("#cmt").html(data);
		$("#cmtText").val("")
	}
</script>
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