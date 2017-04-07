<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- fa폰트 아이콘 -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- bootstrap 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 데이트피커 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
<!-- moment. -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- bootstrap js -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 데이트피커 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


<link rel="stylesheet" 	href="${ pageContext.request.contextPath }/resources/css/sub.css">


<style type="text/css">
body {
	padding-top: 65px;
}

/* 검색바 네비바에서 가운데 정렬을 위한 css */
.navbar .navbar-nav {
	display: inline-block;
	float: none;
}

.navbar .navbar-collapse {
	text-align: center;
}

.glyphicon {
	font-size: 50px;
}

#popular { /*  */
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

/* a태그 링크 색 없에기 */
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
	text-decoration: none !important
}

a.no-uline {
	text-decoration: none
}
</style>

<script type="text/javascript">
	$(function() {
		var $info = $("#info");
		window.onresize = function() {
			$info.html("화면 폭 : " + window.innerWidth + "px");

		}
		/* 		var str = "";
		 for(var i = 0; i <4; i++){
		 str+='<i class="glyphicon glyphicon-map-marker"aria-hidden="true">';
		 }
		 $("#popular").html(str); */
	});
	
	function goSearch(){
	    location.href = "${ pageContext.request.contextPath }/map/search.do?searchtext="+$('#searchtext').val();
	}
	
	/* Like 버튼  */
	function handleLike(check, mymapidxRef) {
		console.log(mymapidxRef);
		console.log(check.checked);
		
		var dataObj = {"userid":"test@test.com", "mymapidxRef":mymapidxRef};
		var dataJSON = JSON.stringify(dataObj);
		
		if(check.checked == true) {		
			$.ajax({
				type: "POST",
				data: dataJSON, 
				url: "${ pageContext.request.contextPath }/like.do",
				contentType: "application/json",
	 			dataType: "json",
				beforeSend: function() {
					console.log("ajax post로 보내는중");
				},
				success: function(data) {
					console.log("ajax post 통신 성공");
					console.log(data);
					console.log(this);
					$("#likeCnt"+mymapidxRef).html(data[mymapidxRef]);
				}
			});
		}
		else if(check.checked == false) {
			$.ajax({
				type: "POST",
				data: dataJSON, 
				url: "${ pageContext.request.contextPath }/unlike.do",
				contentType: "application/json",
	 			dataType: "json",
				beforeSend: function() {
					console.log("ajax post로 보내는중");
				},
				success: function(data) {
					console.log("ajax post 통신 성공");
					console.log(data);
					$("#likeCnt"+mymapidxRef).html(data[mymapidxRef]);
				}
			});
		}
	}
</script>
</head>
<body>
<div></div>
	<!-- 상단 바 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- 로고, 이미지로 바꿀것 -->
				<a class="navbar-brand" href="#">나만의 지도</a>
				<button class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#target">
					<!-- 메뉴 최소화시 =버튼 -->
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse" id="target">
				<!-- 검색바 -->
				<div class="navbar-form navbar-nav">
					<input type="text" class="form-control" placeholder="Search" id="searchtext" size="50%" style="text-align: center;" />&nbsp;&nbsp; 
					<a href="javascript:goSearch()"><i class="fa fa-search fa-2x" aria-hidden="true"></i></a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<!-- 우상단 드롭 메뉴 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false"><span>메뉴</span> <span
							class="caret"></span> </a>
						<ul class="dropdown-menu">
							<li><a data-toggle="modal" data-target="#loginModal"
								data-backdrop="static" data-keyboard="false">로그인</a></li>
							<li><a href="#">마이페이지</a></li>
							<li class="divider"></li>
							<li><a href="#">로그아웃</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단바 끝 -->
	<div class="container">

        
        <div class="search_box">
            <div class="sub_box">
                <span>도시</span>
                <ul>
                    <li>
                        <input type="checkbox" value="" /> 서울
                        <input type="checkbox" value="" /> 경기
                        <input type="checkbox" value="" /> 강원
                        <input type="checkbox" value="" /> 충청
                        <input type="checkbox" value="" /> 전라
                        <input type="checkbox" value="" /> 경상
                        <input type="checkbox" value="" /> 제주
                        <input type="checkbox" value="" /> 부산
                        <input type="checkbox" value="" /> 인천
                        <input type="checkbox" value="" /> 광주
                        <input type="checkbox" value="" /> 대전
                        <input type="checkbox" value="" /> 대구
                        <input type="checkbox" value="" /> 울산
                    </li>
                </ul>
            </div>

            <div class="sub_box">
                <span class="sess">테마</span>
                <ul>
                    <li>
                        <input type="checkbox" value="" /> 식도락
                        <input type="checkbox" value="" /> 가족
                        <input type="checkbox" value="" /> 커플
                    </li>
                </ul>
            </div>

            <div class="sub_box">
                <span>계절</span>
                <ul>
                    <li>
                        <input type="checkbox" value="" /> 봄
                        <input type="checkbox" value="" /> 여름
                        <input type="checkbox" value="" /> 가을
                        <input type="checkbox" value="" /> 겨울
                    </li>
                </ul>
            </div>

            <div class="sub_box">
                <span>기간</span>
                <ul>
                    <li>
                        <input type="checkbox" value="" /> 하루
                        <input type="checkbox" value="" /> 2박3일
                        <input type="checkbox" value="" /> 3박~
                    </li>
                </ul>
            </div>
        </div>


        <div class="search_list">

            <div class="search_top">
                   검색결과 : <b>20</b> 건
            </div>
            <div class="list">
                <ul>
	                
	                <c:forEach var="mymapList" items="${ mymapList }">
	                	<li>
	                        <a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }">
	                            <div class="list_box" >
	                                <div class="imgs">
	                                    <img src="http://imgnews.naver.com/image/108/2016/07/22/2016072218131889688_1_99_20160722190904.jpg" />
	                                </div>
	                                <div class="infos">
	                                    <span class="title">
	                                    	${ mymapList.title }<br/>
	                                    	${ mymapList.content }
	                                    </span><br/><br/>
	                                    <span class="tags">
	                                    <c:forEach var="hashtagList" items="${ hashtagList }">
	                                    	<c:if test="${ hashtagList.mymapidx == mymapList.idx }">
	                                    	#${ hashtagList.name }
	                                    	</c:if>
	                                    </c:forEach>
	                                    </span>
	                                    
	                                   	<!-- Like -->
										<c:choose>
											<c:when test="${ likeAlreadyChecked[mymapList.idx] == true }">
												<i class="fa fa-heart" aria-hidden="true"></i>
												<input type="checkbox" onclick="handleLike(this, ${ mymapList.idx });" checked="checked" >
												<div id="likeCnt${ mymapList.idx}">${ likeMap[mymapList.idx] }</div>
											</c:when>
											<c:otherwise>
												<i class="fa fa-heart" aria-hidden="true"></i>
												<input type="checkbox" onclick="handleLike(this, ${ mymapList.idx });" >
												<div id="likeCnt${ mymapList.idx}">${ likeMap[mymapList.idx] }</div>
											</c:otherwise>
										</c:choose>	                                    
	                                    
	                                    <div class="views">
	                                        <i class="fa fa-eye" aria-hidden="true"></i><span>3,014</span>
	                                    </div>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                </c:forEach>
	                
                </ul>
            </div>

        </div>

        <div class="paging" >
            <span>〈</span><span class="on">1</span><span>2</span><span>3</span><span>4</span><span>5</span><span>〉</span>
        </div>

	</div>
	<!-- 하단 -->
	<div class="row" style="background-color: white;">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="row">
				<h2 class="col-md-3">
					<br /> <a href="#">소개</a>
				</h2>
				<h2 class="col-md-3">
					<br /> <a href="#">공지사항</a>
				</h2>
				<h2 class="col-md-3">
					<br /> <a href="#">FAQ</a>
				</h2>
				<h2 class="col-md-3">
					<br /> <a href="https://play.google.com/intl/en_us/badges/"><img
						src="img/google.png"></a>
				</h2>
				<br /> <br /> <br /> <br /> <br /> <br />
				<div class="text-center col-md-12" style="color: gray;">ⓒ 2017
					baljaguk, Inc.</div>
				<br /> <br />
			</div>
		</div>
	</div>
</body>
</html>