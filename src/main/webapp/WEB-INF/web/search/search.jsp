<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search List</title>

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/sub.css">
	
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
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<div class="container">
			<div class="search_box">
				<div class="sub_box">
					<span>도시</span>
					<ul>
						<li><input type="checkbox" value="" /> 서울 <input
							type="checkbox" value="" /> 경기 <input type="checkbox" value="" />
							강원 <input type="checkbox" value="" /> 충청 <input type="checkbox"
							value="" /> 전라 <input type="checkbox" value="" /> 경상 <input
							type="checkbox" value="" /> 제주 <input type="checkbox" value="" />
							부산 <input type="checkbox" value="" /> 인천 <input type="checkbox"
							value="" /> 광주 <input type="checkbox" value="" /> 대전 <input
							type="checkbox" value="" /> 대구 <input type="checkbox" value="" />
							울산</li>
					</ul>
				</div>
				<div class="sub_box">
					<span class="sess">테마</span>
					<ul>
						<li><input type="checkbox" value="" /> 식도락 <input
							type="checkbox" value="" /> 가족 <input type="checkbox" value="" />
							커플</li>
					</ul>
				</div>
				<div class="sub_box">
					<span>계절</span>
					<ul>
						<li><input type="checkbox" value="" /> 봄 <input
							type="checkbox" value="" /> 여름 <input type="checkbox" value="" />
							가을 <input type="checkbox" value="" /> 겨울</li>
					</ul>
				</div>
				<div class="sub_box">
					<span>기간</span>
					<ul>
						<li><input type="checkbox" value="" /> 하루 <input
							type="checkbox" value="" /> 2박3일 <input type="checkbox" value="" />
							3박~</li>
					</ul>
				</div>
			</div>
			<div id="search_list"></div>
			
			<div class="paging">

				<button id="more">more</button>

			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>