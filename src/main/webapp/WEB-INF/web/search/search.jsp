<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share2.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<style type="text/css">

@media(max-width:400px){
	#page-content{
		margin: 0px;
	}
}
</style>
<style>
.thumb-pane {
	background-color: white;
	margin-bottom: 0px !important;
}

.thumbnail-box-wrapper {
	border: solid 1px;
	border-color: rgba(128, 128, 128, 0.23);
}

.thumbnail-box-wrapper:HOVER {
	box-shadow: 0 6px 10px rgba(0, 0, 0, .23), 0 10px 30px
		rgba(0, 0, 0, .19);
}

.margin3 {
	margin-bottom: 20px !important;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Portfolio gallery</title>
<script type="text/javascript">
/*-----------------------세션 아이디 확인 후 가져오기------------------------*/
var sessionUserid;
function checkSession() {
	$.ajax({
		type : 'GET',
		url : '${ pageContext.request.contextPath }/getSessionUserid.do',
		dataType : 'json',
		async : false,
		success : function(data) {
			console.log(data['sessionUserid']);
			sessionUserid = data['sessionUserid'];
		}
	});
};

/*-------------------------------검색 부분--------------------------------*/	
	$(function() {		 
		var json = {
			searchtext : "${searchtext}",
			moreCount : "${moreCount}",
			flag : 1
		}
		$.ajax({
			url : "${ pageContext.request.contextPath }/map/searchList.do",
			type : "get",
			data : json,
			success : callback
		});
		var num = 1;
		$(window).scroll(function() {
							if ($("body").height() < $(window).height()) {
								alert("There isn't a vertical scroll bar");
							}
							if ($(window).scrollTop() == $(document).height() - $(window).height()) {
								num++;
								var json = {
									searchtext : "${searchtext}",
									moreCount : num,
									flag : 1
								}
								$.ajax({
											url : "${ pageContext.request.contextPath }/map/searchList.do",
											type : "get",
											data : json,
											success : callback
										});
							}
						});

	});
	function callback(data) {
		console.log(data);
		$("#portfolio-grid").append(data);
		$("#portfolio-grid").mixitup({
			showOnLoad : "mix_all"
		})
	}
	/* Like 버튼  */
	function handleLike(check, mymapidxRef) {
		console.log(mymapidxRef);
		console.log(check.checked);

		var dataObj = {
			"userid" : sessionUserid,
			"mymapidxRef" : mymapidxRef
		};
		var dataJSON = JSON.stringify(dataObj);

		if (check.checked == true) {
			$.ajax({
				type : "POST",
				data : dataJSON,
				url : "${ pageContext.request.contextPath }/like.do",
				contentType : "application/json",
				dataType : "json",
				beforeSend : function() {
					console.log("ajax post로 보내는중");
				},
				success : function(data) {
					console.log("ajax post 통신 성공");
					console.log(data);
					console.log(this);
					$("#likeCnt" + mymapidxRef).html(data[mymapidxRef]);
				}
			});
		} else if (check.checked == false) {
			$.ajax({
				type : "POST",
				data : dataJSON,
				url : "${ pageContext.request.contextPath }/unlike.do",
				contentType : "application/json",
				dataType : "json",
				beforeSend : function() {
					console.log("ajax post로 보내는중");
				},
				success : function(data) {
					console.log("ajax post 통신 성공");
					console.log(data);
					$("#likeCnt" + mymapidxRef).html(data[mymapidxRef]);
				}
			});
		}
	}
</script>
<script type="text/javascript">
/* searchList 불러오기 */
	function hover2(flag){ 
	    $('#portfolio-grid').children().remove(); 
		var json = {
			searchtext : "${searchtext}",
			moreCount : "${moreCount}",
			flag : flag
		}
		$.ajax({
			url : "${ pageContext.request.contextPath }/map/searchList.do",
			type : "get",
			data : json,
			success : callback
		});
		var num = 1;
		$(window).scroll(function() {
							if ($("body").height() < $(window).height()) {
								alert("There isn't a vertical scroll bar");
							}
							if ($(window).scrollTop() == $(document).height()- $(window).height()) {
								num++;
								var json = {
									searchtext : "${searchtext}",
									moreCount : num,
									flag : flag
								}
								$.ajax({
											url : "${ pageContext.request.contextPath }/map/searchList.do",
											type : "get",
											data : json,
											success : callback
										});
							}
						});
	}
</script>


</head>
<body>
	<div id="sb-site">
		<div id="page-wrapper">
			<div id="page-content-wrapper">
				<jsp:include page="/top2.do" /> 
				<div id="page-content">
					<link rel="stylesheet" type="text/css"
						href="${pageContext.request.contextPath }/resources/assets/frontend-elements/portfolio-navigation.css">
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/mixitup/mixitup.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/mixitup/images-loaded.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/mixitup/isotope.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/mixitup/portfolio-demo.js"></script>
					<div
						class="portfolio-controls mrg10L mrg10R radius-all-4 portfolio-nav-alt bg-blue clearfix controls">
						<div class="container text-center">
							<ul class="float-none">
								<li onclick="javascript:hover2(1)" class="filter" data-filter="hover_1">최근순</li>
								<li onclick="javascript:hover2(2)" class="filter" data-filter="hover_2">조회수순</li>
								<li onclick="javascript:hover2(3)" class="filter" data-filter="hover_3">추천순</li>
							</ul>
						</div>
					</div>
					<div class="clearfix">
						<ul id="portfolio-grid" class="reset-ul">
						</ul>
					</div>

					<div class="divider"></div>
					<!-- 					<div class="text-center">
						<ul class="pagination pagination-lg">
							<li><a href="#">«</a></li>
							<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">»</a></li>
						</ul>
					</div> -->
				</div>
			</div>

		</div>
		<jsp:include page="/bottom2.do" />
	</div>
</body>
</html>