<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	pageEncoding="UTF-8" session="true"%>
<%@include file="/WEB-INF/share.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<style type="text/css">
body {
	padding-top: 80px;
}

@media ( min-width : 1368px) {
	body {
		padding-top: 140px;
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sub.css">

<script type="text/javascript">
	$(document).ready(function() {
		$(".menus > span").click(function() {
			$(".menus  span").removeClass("on");
			$(this).addClass("on");
			var header = $(this).text();
			
			if($(this).text()=='내여행'){
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
								$('#myInfo').append('<li class="top"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[i].idx+'">'+
													data[i].title+'</a><br/>'+data[i].content+'<span onclick="javascript:deleteMymap('+data[i].idx+','+data[i].type+')">×</span></li>');
						    } else {
								$('#myInfo').append('<li><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[i].idx+'">'+
													data[i].title+'</a><br/>'+data[i].content+'<span>×</span></li>');   
						    }
						}
			        }
				});
			}
			
			if($(this).text()=='내계획'){
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
								$('#myInfo').append('<li class="top"><a href="${pageContext.request.contextPath}/map/plantrip.do">'+data[i].title+'</a><br/>'+data[i].content+'<span>×</span></li>');
						    } else {
								$('#myInfo').append('<li><a href="${pageContext.request.contextPath}/map/plantrip.do">'+data[i].title+'</a><br/>'+data[i].content+'<span>×</span></li>');   
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
								console.log(data[i].idx);
								$('#myInfo').append('<li class="top"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[i].idx+'">'+data[i].title+'</a><br/>'+data[i].content+'<span>×</span></li>');
						    } else {
								$('#myInfo').append('<li><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[i].idx+'">'+data[i].title+'</a><br/>'+data[i].content+'<span>×</span></li>');   
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
		    
		    if($('#title').val() == ""){
				alert("제목을 입력하세요");
				return false;
		    }		
		    else if ($('#content').val() == "") {
				alert("내용을 입력하세요");
				return false;
			} 
		    else if ($('#start').val() == "") {
				alert("시작일을 입력하세요");
				return false;
			}
		    else if ($('#end').val() == "") {
				alert("도착일을 입력하세요");
				return false;
			}
		    else if ($('#hashtag').val() == "") {
				alert("해쉬태그를 입력하세요");
				return false;
			}
		    else {
				inputform.submit();
		    }	
		});
			$(".btnx").click(function() {
			    $(".lpop").hide();
			});

			/* datetimepicker부분 */
 			$('#datetimepicker1').datetimepicker({
			    useCurrent : false,
			    sideBySide : true,
			    maxDate : moment(),
			    format : 'YYYY-MM-DD HH:mm'
			});
			$('#datetimepicker2').datetimepicker({
			    useCurrent : false,
			    sideBySide : true,
			    maxDate : moment(),
			    format : 'YYYY-MM-DD HH:mm'
			});
			$("#datetimepicker1").on(
				"dp.show",
				function(e) {
				    $('#datetimepicker1')
					    .data("DateTimePicker").maxDate(
						    $('#end').val());
				});
			$("#datetimepicker2").on(
				"dp.show",
				function(e) {
				    $('#datetimepicker2')
					    .data("DateTimePicker").minDate(
						    $('#start').val());
				});			
			});

    function myPlace(checkpointidx) {

	window.open("${ pageContext.request.contextPath }/member/favoritePlace.do?checkpointidx="
					+ checkpointidx, "_blank", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");

    }

     function deleteMymap(mymapidx, type) {
	console.log(mymapidx);
	console.log(type);
	if (confirm("삭제 하시겠습니까?")) {

	}
}

.dlrj {
	border: 1px solid #ddd;
	border-radius: 20px;
	background-color: #fffdf3;
}
</style>
    }
</script>
<script>
/*------------------비밀번호 변경-------------------------*/		
$(document).ready(function () {
	$('#changePassForm').on('submit', function(e) {
		console.log('changePassForm submitted');
		e.preventDefault();
		
		var newPassInfo = {
				'currentPassword' : $('#changePassForm input[name=currentPassword]').val(),
				'newPassword' : $('#changePassForm input[name=newPassword]').val()
		};
		var dataJSON = JSON.stringify(newPassInfo);
		
		$.ajax({
			type : 'POST',
			data : dataJSON,
			url : '${ pageContext.request.contextPath }/changePassword.do',
			contentType : 'application/json',
			dataType : 'json',
			success : (function(data) {
				alert(data['message']);
				if(data['redirectUrl'] != null) {
					window.location.href = '${ pageContext.request.contextPath }/'+data['redirectUrl'];
				}
			})
		});
	});		
});
</script>
<script>
/*------------------회원 탈퇴-------------------------*/
function deactivateAccount() {
	if(confirm("탈퇴하시겠습니까?ㅠㅠ")) {
		
		$.ajax({
			type : 'POST',
			url : '${ pageContext.request.contextPath }/deactivate.do',
			contentType : 'application/json',
			dataType : 'json',
			success : (function(data) {
				alert(data['message']);
				window.location.href = '${ pageContext.request.contextPath }/'+data['redirectUrl'];
			})
		});
	};
};

/*------------------프로필사진 변경-------------------------*/
	function uploadImage() {
		$("#chooseImage").click();
	}

	$(document).on("change", "#chooseImage", function() {
		var file_data = $("#chooseImage").prop("files")[0];
		var form_data = new FormData();
		form_data.append("file", file_data);

		$.ajax({
		    url: "${ pageContext.request.contextPath }/uploadPhoto.do",
		    cache: false,
		    contentType: false,
		    processData: false,
		    data: form_data,
		    type: 'post',
		    success: function (data) {
				$("#profileImage").prop("src", "https://s3.ap-northeast-2.amazonaws.com/baljagook/profileImage/"+data);
			}
	    });
	})		
		
</script>
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	
	<!-- 비밀번호 변경 Modal -->
	<div class="modal fade" id="changePassModal" tabindex="-1" role="dialog"
		 aria-labelledby="changePassModalTitle" aria-hidden="true">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="changePassModalTitle"
					style="padding-left: 48%;">비밀번호 변경</h5>
				<!-- x버튼 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>	
			</div>
			<div class="modal-body">
				<form id="changePassForm">						
					<div class="row">
						<div class="col-md-12 form-group">
							<input type="password" name="currentPassword" class="form-control modal-text"
								placeholder="기존 비밀번호">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group">
							<input type="password" name="newPassword" class="form-control modal-text"
								placeholder="새로운 비밀번호">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group">
							<input type="password" name="newPasswordConfirm" class="form-control modal-text"
								placeholder="새로운 비밀번호 확인">
						</div>
					</div>
					<div class="col-md-12">
						<button type="submit" class="btn btn-primary col-md-12">비밀번호 변경</button>
					</div>				
				</form>
			</div>
		</div>	 
	</div>
	
	<section>
		<br /> <br />
		<div class="container">

			<div class="row">
				<div class="col-xs-12 col-sm-3 col-md-2">
					<div style="text-align: center;">
						<img class="avatar"
							src="//tripline.global.ssl.fastly.net/media/image/tripuser.png">
					</div>
					<div style="text-align: center; margin: 15px 0px;">
						<div class="btn-group">
							<a class="btn btn-primary btn-sm" href="#"><i
								class="fa fa-plus"></i>&nbsp;&nbsp;Follow</a>
						</div>
			<div class="menuleft">
				<div class="div_img">
					<img id="profileImage" src="https://s3.ap-northeast-2.amazonaws.com/baljagook/profileImage/${imageName}" width="80" height="80"/>
					<div style="height:0px;overflow:hidden">
						<input id="chooseImage" type="file"/>
					</div>
					<button onclick="uploadImage();">사진 업로드</button>
				</div>
				<div class="col-xs-12 col-sm-9 col-md-10">
					<h1 style="margin-top: 0px; margin-bottom: 0px;">${sessionScope.user }</h1>
					<div class="text-muted" style="margin-bottom: 15px;">email</div>
					<div class="lead"></div>
					<div>
						<span style="cursor: pointer"
							onclick="Tripline.myUser.showTrips()"><strong><i
								class="fa fa-map"></i></strong>&nbsp;&nbsp;1&nbsp;Map</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="cursor: pointer"
							onclick="Tripline.myUser.showFollowers()"><strong><i
								class="fa fa-users"></i></strong>&nbsp;&nbsp;0&nbsp;Followers</span>
						<!--<strong>0</strong>&nbsp;Following-->
				<div class="div_name">${sessionScope.user}</div>
				<div class="menus">
					<ul>
						<li><a data-toggle="modal" data-target="#changePassModal"
							   data-backdrop="static" data-keyboard="false">비밀번호변경</a></li>
						<li><a onclick="deactivateAccount();">계정탈퇴</a></li>
					</ul>
				</div>
			</div>
			<div class="div_main">
				<div class="menus">
					<span class="">장소</span> <span class="">MAP</span> <span class="">내계획</span> <span class="on">내여행</span>
				</div>
				<div class="btns">여행등록</div>
				<div class="div_board">
					<!-- 여기에 ajax를 통한 데이터 넣으면 됨 -->
					<ul id="myInfo">
						<c:forEach var="mymapList" items="${ mymapList }" varStatus="idx">
							<c:if test="${ idx.index == 0 }">
								<li class="top"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }">${ mymapList.title }</a><br/>${ mymapList.content }<span>×</span></li>
							</c:if>
							<c:if test="${ idx.index != 0 }">
								<li><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }">${ mymapList.title }</a><br/>${ mymapList.content }<span>×</span></li>
							</c:if>
						</c:forEach> 
					</ul>
					<div class="paging">
						<span>〈</span><span class="on">1</span><span>2</span><span>3</span><span>4</span><span>5</span><span>〉</span>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-xs-12">
					<h4>
						<ul class="nav nav-tabs" style="margin-bottom: 15px;">
							<li class="active"><a href="#trips" data-toggle="tab"
								aria-expanded="true">Maps</a></li>
							<li class=""><a href="#users" data-toggle="tab"
								aria-expanded="false">People</a></li>
							<!--<li class=""><a href="#places" data-toggle="tab" aria-expanded="false">Places</a></li>-->
						</ul>
					</h4>
					<div class="tab-content">
						<div class="tab-pane fade active in" id="trips">
							<ul class="nav nav-pills pills-xs" style="margin-bottom: 15px;">
								<li class="active"><a href="#mytrips" data-toggle="tab"
									data-section="trips" data-query="mytrips" aria-expanded="true">My
										Maps</a></li>
								<li class=""><a href="#following" data-toggle="tab"
									data-section="trips" data-query="following"
									aria-expanded="true">Following</a></li>
							</ul>
							<div class="row">
								<div id="mytriplist" class="trip-list clearfix"></div>
								<div id="mytriplist-noresults" class="col-xs-12 lead cloak"
									style="display: block;">No results</div>
								<div class="col-xs-12 text-center">
									<div class="spinner" style="display: none;">
										<img
											src="//tripline.global.ssl.fastly.net/media/image/loading-big.gif">
									</div>
									<div id="mytriplist-loadmore" class="btn btn-default loadmore"
										style="display: none;">Load More</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="users">
							<ul class="nav nav-pills pills-xs" style="margin-bottom: 15px;">
								<li class="active"><a href="#friends" data-toggle="tab"
									data-section="users" data-query="friends" aria-expanded="false">Friends</a></li>
								<li class=""><a href="#following" data-toggle="tab"
									data-section="users" data-query="following"
									aria-expanded="false">Following</a></li>
								<li class=""><a href="#followers" data-toggle="tab"
									data-section="users" data-query="followers"
									aria-expanded="false">Followers</a></li>
							</ul>
							<div class="row">
								<div id="myuserlist" class="user-list clearfix"></div>
								<div id="myuserlist-noresults" class="col-xs-12 lead cloak"
									style="display: block;">No results</div>
								<div class="col-xs-12 text-center">
									<div class="spinner" style="display: none;">
										<img
											src="//tripline.global.ssl.fastly.net/media/image/loading-big.gif">
									</div>
									<div id="myuserlist-loadmore" class="btn btn-default loadmore"
										style="display: none;">Load More</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="places">
							<ul class="nav nav-pills pills-xs" style="margin-bottom: 15px;">
								<li class="active"><a href="#following" data-toggle="tab"
									data-section="places" data-query="following"
									aria-expanded="false">Following</a></li>
							</ul>
							<div class="row">
								<div id="myplacelist" class="trip-list clearfix"></div>
								<div id="myplacelist-noresults" class="col-xs-12 lead cloak">No
									results</div>
								<div class="col-xs-12 text-center">
									<div class="spinner" style="display: none;">
										<img
											src="//tripline.global.ssl.fastly.net/media/image/loading-big.gif">
									</div>
									<div id="myplacelist-loadmore" class="btn btn-default loadmore">Load
										More</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<iframe
  width="600"
  height="450"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAYUG3CyfQOX6EgmE0QO5hjH95ir0EDZm0
    &q=Space+Needle,Seattle+WA" allowfullscreen>
</iframe>
			<div class="portfolio-area inner-padding">
				<div class="container-fluid">
					<div class="row foo" data-sr="enter" data-sr-id="30"
						style="visibility: visible; -webkit-transform: translateY(0) scale(1); opacity: 1; transform: translateY(0) scale(1); opacity: 1; -webkit-transition: -webkit-transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; transition: transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s;">
						<div class="portfolio-masonry portfolio-items"
							style="position: relative; height: 542px;">
							<div class="portfolio-item isotope web-design"
								style="position: absolute; left: 1075px; top: 271px;">
								<div class="portfolio-item-inner">
									<img src="${pageContext.request.contextPath }/resources/img/work-14.png" alt="responsive img">
									<div class="portfolio-caption">
										<a class="portfolio-action-btn" href="${pageContext.request.contextPath }/resources/img/work-14.png"
											data-popup="prettyPhoto[img]"><img src="${pageContext.request.contextPath }/resources/img/zoom.png"
											alt="responsive img"></a>
										<div class="portfolio-caption-content">
											<h4>
												<a href="#">Project Name</a>
											</h4>
											<a href="#">Category</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>