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
<script type="text/javascript">
	/**
	 * mapCommentList
	 */
	$(function() {
		/* $(".mod1").click(function() {
			console.log($(this).parent().attr('id'));
			console.log($(this).siblings(".cmt").val());
			$(this).siblings(".cmt").removeAttr("disabled");
		});
		$(".mod2")
				.click(
						function() {
							$(this).siblings(".cmt").attr("disabled");
							var json = {
								content : $(this).siblings(".cmt").val(),
								idx : $(this).parent().attr("id")
							}
							$
									.ajax({
										url : "${pageContext.request.contextPath }/map/commentModify.do",
										type : "post",
										data : json,
										success : callback
									});
						}); */
		$(".del")
				.click(
						function() {
							var json = {
									idx : $(this).attr("value"),
									regmapidx :  $("#regmapidx").val()
								}
							$
									.ajax({
										url : "${pageContext.request.contextPath }/map/commentDelete.do",
										type : "post",
										data : json,
										success : callback
									});
						});
		
		$(".reply")
				.click(
						function() {
							var json = {
								userid : "${sessionScope.user }",
								content : $("#content"+$(this).attr("value")).val(),
								regmapidx : $("#regmapidx").val(),
								idx : $(this).attr("value")
							}
							$
									.ajax({
										url : "${pageContext.request.contextPath }/map/commentReply.do",
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
	function aa(id) {
		$("#" + id).css("border-left", "1px");
		console.log(this);
	}
</script>
</head>
<body>
	<div class="content-box">
		<div class="content-box-wrapper">
			<ul class="chat-box">
				<c:forEach var="cmt" items="${mapCommentList }">
					<li class="float-left"
						<c:if test="${cmt.lvl>0 }">style="margin-left: ${cmt.lvl*30 }px;"</c:if>><div
							class="chat-author">
							<img width="36"
								src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="">
						</div>
						<div class="popover right no-shadow">
							<div class="arrow"></div>
							<div class="popover-content">
								<h3>
									<a href="#" title="Horia Simon"><c:out
											value="${cmt.userid }" /></a>
									<div class="float-right">
										<button
											class="btn btn-sm btn-danger float-right tooltip-button del"
											data-placement="left" title="Remove comment" value="${cmt.idx }">
											<i class="glyph-icon icon-remove"></i>
										</button>
									</div>
								</h3>
								${cmt.content }
								<div class="chat-time">
									<i class="glyph-icon icon-clock-o"></i>
									<c:out value="${cmt.regdate }" />
								</div>
								<div class="divider"></div>
								<div class="input-group form"><input
										type="text" placeholder="댓 글" id="content<c:out value='${cmt.idx }' />"
										class="form-control">
									<div class="input-group-btn">
										<button
											class="btn btn-sm btn-default font-bold text-transform-upr reply"
											value="<c:out value='${cmt.idx }' />">
											<span class="button-content">Reply</span>
										</button>
									</div>
								</div>
							</div>
						</div></li>
				</c:forEach>
			</ul>
		</div>

	</div>
</body>
</html>