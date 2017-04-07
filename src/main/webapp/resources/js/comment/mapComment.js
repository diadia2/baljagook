/**
 * mapComment
 */
	$(function() {
		$.ajax({
			url : "/comment/mapCommentList.do",
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
				url : "/map/commentInsert.do",
				data : json,
				success : callback
			});
		});
	});
	function callback(data) {
		$("#cmt").html(data);
		$("#cmtText").val("")
	}