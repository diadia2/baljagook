<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax Comment</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".mod1").click(function() {
			console.log($(this).parent().attr('id'));/* 
												$(this).siblings(".cmt").disabled=false; */
			console.log($(this).siblings(".cmt").val());
			$(this).siblings(".cmt").removeAttr("disabled");
			/* $.ajax({
				url : "insert.do",
				type : "get",
				data : "userid="+$("#userid").val()+"&content=" + $("#content").val()+"&regmapidx=" + $("#regmapidx").val(),
				/* 포스트형식으로 보낼때 json으로 보낸후 컨트롤러에서 리퀘스트바디로 받음 
				success : callback
			});*/
			/* var json = {
				userid : $("#userid").val(),
				content : $("#content").val(),
				regmapidx : $("#regmapidx").val()
			}
			$.ajax({
				url : "insert.do",
				type : "post",
				data : json,
				/* 포스트형식으로 보낼때 json으로 보낸후 컨트롤러에서 리퀘스트바디로 받음 
					dataType : (xml,html,json,jsonp,script,text)
				 
				success : callback
			}); */
		});

		$(".mod2").click(function() {
			$(this).siblings(".cmt").attr("disabled");
			/* $.ajax({
				url : "insert.do",
				type : "get",
				data : "userid="+$("#userid").val()+"&content=" + $("#content").val()+"&regmapidx=" + $("#regmapidx").val(),
				/* 포스트형식으로 보낼때 json으로 보낸후 컨트롤러에서 리퀘스트바디로 받음 
				success : callback
			});*/
			var json = {
				content : $(this).siblings(".cmt").val(),
				idx : $(this).parent().attr("id")
			}
			$.ajax({
				url : "modify.do",
				type : "post",
				data : json,
				success : callback
			});
		});

		$(".del").click(function() {
			$.ajax({
				url : "delete.do",
				type : "post",
				data : "idx=" + $(this).parent().attr("id"),
				success : callback
			});
		});

		var json = {
			userid : $("#userid").val(),
			content : $("#content").val(),
			regmapidx : $("#regmapidx").val()
		}

		$(".reply").click(function() {
			var json = {
				userid : $("#userid").val(),
				content : $("#content").val(),
				regmapidx : $("#regmapidx").val(),
				idx : $(this).parent().attr("id")
			}
			$.ajax({
				url : "reply.do",
				type : "post",
				data : json,
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
	<c:forEach var="cmt" items="${cmtList }">
		<div class="row">
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
						<strong>myusername</strong> <span class="text-muted">commented
							5 days ago</span>
					</div>
					<div class="panel-body">Panel contentssssssssssssssssss ssss</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>