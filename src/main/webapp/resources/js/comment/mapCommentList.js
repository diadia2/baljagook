/**
 * mapCommentList
 */
$(function() {
		$(".mod1").click(function() {
			console.log($(this).parent().attr('id'));
			console.log($(this).siblings(".cmt").val());
			$(this).siblings(".cmt").removeAttr("disabled");
		});
		$(".mod2").click(function() {
			$(this).siblings(".cmt").attr("disabled");
			 var json = {
				content : $(this).siblings(".cmt").val(),
				idx : $(this).parent().attr("id")
			}
			$.ajax({
				url : "${pageContext.request.contextPath }/map/commentModify.do",
				type : "post",
				data : json,
				success : callback
			}); 
		});
		$(".del").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath }/map/commentDelete.do",
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
		$("#"+id).css("border-left", "1px");
		console.log(this);
	}