/**
 * mapComment
 */
	$(function() {
		$.ajax({
			url : "${pageContext.request.contextPath }/comment/mapCommentList.do",
			type : "post",
			data : "userid="+$("#userid").val()+"&content=" + $("#content").val()+"&regmapidx=" + $("#regmapidx").val(),
			success : callback
		});
		$("#cmtBtm").click(function() {
			var json = {
					userid : $("#userid").val(),
					content : $("#content").val(),
					regmapidx : $("#regmapidx").val(),
	/* 				idx : '240' */
			}
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath }/map/commentInsert.do",
				data : json,
				success : callback
			});
		});
	});
	function callback(data) {
		$("#cmt").html(data);
		$("#cmtText").val("")
	}