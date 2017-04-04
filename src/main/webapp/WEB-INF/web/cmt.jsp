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
</head>
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
				data : "idx="+$(this).parent().attr("id"),
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
<body>
	<!-- 출력 -->
	<div>
		<c:forEach var="cmt" items="${cmtList }">
			<c:if test="${cmt.lvl>0 }">ㄴ1</c:if>
			<c:if test="${cmt.lvl>1 }">ㄴ2</c:if>
			<div id="<c:out value='${cmt.idx }' />">
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