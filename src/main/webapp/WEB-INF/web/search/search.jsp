<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search List</title>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {//chaining!
			console.log(this);
			$(this).css({
				"color" : "blue"
			}).slideUp(1000).slideDown(1000, function() {
				$(this).css({
					"background" : "yellow"
				});
			});
		});
		
		var json = {
			searchtext : "${searchtext}",
			moreCount : "${moreCount}"
		}
		$.ajax({
			url : "${ pageContext.request.contextPath }/map/searchList.do",
			type : "get",
			data : json,
			success : callback
		});
		var num = 1;
		$("#more").click(function() {
			num++;
			var json = {
				searchtext : "${searchtext}",
				moreCount : num
			}
			$.ajax({
				url : "${ pageContext.request.contextPath }/map/searchList.do",
				type : "get",
				data : json,
				success : callback
			});
		});
	});
	function callback(data) {
		$("#search_list").html(data);
	}
	function goSearch() {
		location.href = "${ pageContext.request.contextPath }/map/search.do?searchtext="
				+ $('#searchtext').val();
	}

	/* Like 버튼  */
	function handleLike(check, mymapidxRef) {
		console.log(mymapidxRef);
		console.log(check.checked);

		var dataObj = {
			"userid" : "test@test.com",
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
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<!-- Check Box Section -->
		<div class="page-header" id="home">
			<!-- defult.css page-header 에 사진 정보 있음 -->
			<div class="header-caption">
				<div class="header-caption-contant">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div class="header-caption-inner">
									<h1>Result</h1>
									<table class="table">
										<tr>
											<th><p>City</p></th>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
										</tr>
										<tr>
											<th><p>Theme</p></th>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
										</tr>
										<tr>
											<th><p>Weather</p></th>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
										</tr>
										<tr>
											<th><p>Term</p></th>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
											<td><p>
													<input type="checkbox" value="" /> 서울
												</p></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div>
		<button class="btn btn-default h" id="btn">
			<i class="fa fa-heart h" aria-hidden="true"></i>
		</button>
		
		<button class="btn btn-default h" style="color: red;">
			<i class="fa fa-heart h" aria-hidden="true"></i>
		</button>

	</div>
		<!-- End Check Box Section -->
		<!-- Search List Section -->
		<div class="container"><b>검색결과 : 총 9 건</b></div>
		<div id="search_list"></div>
		<div>
			<button id="more">more</button>
		</div>
		<!-- End Search List Section -->
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>