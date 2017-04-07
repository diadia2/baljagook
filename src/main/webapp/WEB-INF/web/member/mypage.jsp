<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sub.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery.datetimepicker.js"
	charset="UTF-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/jquery.datetimepicker.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$(".menus > span").click(function() {
			$(".menus  span").removeClass("on");
			$(this).addClass("on");
			var header = $(this).text();
			
			if($(this).text()=='내여행' || $(this).text()=='내계획'){
			    $.ajax({
				    type: 'POST' , 
				    url: '${ pageContext.request.contextPath }/member/resetMypage.do',
				    dataType : 'json',
				    data : {
						header : header
				    },
				    success: function(data) {
						$('#myInfo > li').remove();
						
						for(var i=0; i<data.length; i++){
						    if(i==0){
								$('#myInfo').append('<li class="top"><a href="#!">'+data[i].title+'</a><span>×</span></li>');
						    } else {
								$('#myInfo').append('<li><a href="#!">'+data[i].title+'</a><span>×</span></li>');   
						    }
						}
			        }
				});
			}
			 
			if($(this).text()=='MAP'){
			    $.ajax({
				    type: 'POST' , 
				    url: '${ pageContext.request.contextPath }/member/resetMypageTwo.do',
				    dataType : 'json',
				    data : {
						header : header
				    },
				    success: function(data) {
						$('#myInfo > li').remove();
						
						for(var i=0; i<data.length; i++){
						    if(i==0){
								$('#myInfo').append('<li class="top"><a href="#!">'+data[i].title+'</a><span>×</span></li>');
						    } else {
								$('#myInfo').append('<li><a href="#!">'+data[i].title+'</a><span>×</span></li>');   
						    }
						}
			        }
				});
			}
			
			if($(this).text()=='장소'){
			    $.ajax({
				    type: 'POST' , 
				    url: '${ pageContext.request.contextPath }/member/resetMypageThree.do',
				    dataType : 'json',
				    data : {
						header : header
				    },
				    success: function(data) {
						$('#myInfo > li').remove();
						
						for(var i=0; i<data.length; i++){
						    if(i==0){
								$('#myInfo').append('<li class="top"><a href="javascript:myPlace('+data[i].checkpointidx+')">'+data[i].placename+'</a><span>×</span></li>');
						    } else {
								$('#myInfo').append('<li><a href="javascript:myPlace('+data[i].checkpointidx+')">'+data[i].placename+'</a><span>×</span></li>');   
						    }
						}
			        }
				});
			}
		});
		
		
		
		$(".btns").click(function() { 
			$(".lpop").show();
		});
		$("#reg").click(function() {
			location.href = "regMymap.do";
		});
		$(".btnx").click(function() {
			$(".lpop").hide();
		});
		$('.dates').datetimepicker({
			format : 'd.m.Y H:i',
			lang : 'kr'
		});
	});
	
	function myPlace(checkpointidx){
	    
	    window.open("${ pageContext.request.contextPath }/member/favoritePlace.do?checkpointidx="+checkpointidx, "_blank", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");

	}
</script>

</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<div class="container">
			<div class="menuleft">
				<div class="div_img">
					<img
						src="${pageContext.request.contextPath }/resources/images/DAMNIT.png" />
					<div class="div_btn">
						<img
							src="${pageContext.request.contextPath }/resources/images/img.png" />
					</div>
				</div>
				<div class="div_name">Soonil</div>
				<div class="menus">
					<ul>
						<li><a href="#!">비밀번호변경</a></li>
						<li><a href="#!">계정탈퇴</a></li>
					</ul>
				</div>
			</div>
			<div class="div_main">
				<div class="menus">
					<span class="">장소</span> <span class="">MAP</span> <span class="">내계획</span> <span class="on">내여행</span>
				</div>
				<div class="btns">등록</div>
				<div class="div_board">
					<!-- 여기에 ajax를 통한 데이터 넣으면 됨 -->
					<ul id="myInfo">
						<c:forEach var="mymapList" items="${ mymapList }" varStatus="idx">
							<c:if test="${ idx.index == 0 }">
								<li class="top"><a href="#!">${ mymapList.title }</a><span>×</span></li>
							</c:if>
							<c:if test="${ idx.index != 0 }">
								<li><a href="#!">${ mymapList.title }</a><span>×</span></li>
							</c:if>
						</c:forEach> 
					</ul>
					<div class="paging">
						<span>〈</span><span class="on">1</span><span>2</span><span>3</span><span>4</span><span>5</span><span>〉</span>
					</div>
				</div>
			</div>
			<div class="lpop">
				<span class="btnx">×</span>
				<div class="contentview">
					<form name="" method="post">
						<input type="text" name="" id="" class="titles" placeholder="제목입력" />
						<input type="text" class="dates" readonly placeholder="날짜선택" /> ~
						<input type="text" class="dates" readonly placeholder="날짜선택" /> <input
							type="text" name="" id="" class="tags"
							placeholder="#태그를 입력 후 엔터!" />
						<div>
							<ul class="taglib">
								<li>#이별<span>x</span></li>
								<li>#사랑<span>x</span></li>
								<li>#눈물<span>x</span></li>
								<li>#ㅋㅋㅋ<span>x</span></li>
								<li>#하하하<span>x</span></li>
							</ul>
						</div>
					</form>
					<button id="reg">등록하기</button><button class="btnx">취소</button>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>