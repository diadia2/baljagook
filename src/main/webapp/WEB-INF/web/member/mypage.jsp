<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@include file="/WEB-INF/share.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>

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
     
/*-----------------------비밀번호 형식 체크------------------------*/
	function validatePassword(inputPassword) {
		var passwordFormat = /^[a-zA-Z-0-9!@#$%^&*]{5,15}$/;
 		
		if (inputPassword.match(passwordFormat)) {
			return true;
		} else {
			return false;
		}
	}	     
     
</script>
<script>
/*------------------비밀번호 변경-------------------------*/		
$(document).ready(function () {
	$('#changePassForm').on('submit', function(e) {
		console.log('changePassForm submitted');
		e.preventDefault();
		
		var inputNewPw = $('#changePassForm input[name=newPassword]').val();
		var inputNewPwConfirm = $('#changePassForm input[name=newPasswordConfirm]').val();
		
		if(!validatePassword(inputNewPw)) {
			alert('비밀번호 형식이 맞지 않습니다(길이: 5-15, 특수문자(!@#$%^&*만 가능), 공백 제외)');
		} else {
			if(inputNewPw != inputNewPwConfirm) {
				alert('비밀번호가 일치하지 않습니다');
			} else {
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
			}			
		}
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
		<div class="container">
			<div class="menuleft">
				<div class="div_img">
					<img id="profileImage" src="https://s3.ap-northeast-2.amazonaws.com/baljagook/profileImage/${imageName}" width="80" height="80"/>
					<div style="height:0px;overflow:hidden">
						<input id="chooseImage" type="file"/>
					</div>
					<button onclick="uploadImage();">사진 업로드</button>
				</div>
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
			<div class="lpop">
				<span class="btnx">×</span>
				<div class="contentview">
					<form action="${ pageContext.request.contextPath }/map/mapcheck.do" method="POST" name="inputform">
						<div class="row">	
							<div class='col-md-1'></div>
								<div class='col-md-10'>
									<input type="text" name="title" id="title" class="form-control" placeholder="여행제목" />
								</div>
							<div class='col-md-1'></div>
						</div>	
						<div class="row">	 
							<div class='col-md-1'></div>
								<div class='col-md-10'>
									<input type="text" name="content" id="content" class="form-control" placeholder="여행내용" />
								</div>
							<div class='col-md-1'></div>
						</div>	
						<div class="row">
							<div class='col-md-1'></div>
							<div class='col-md-5'>
								<div class="form-group">
									<div class='input-group date' id='datetimepicker1'>
										<input type='text' class="form-control" name="start" id="start" />
										<span class="input-group-addon"> <i class="fa fa-calendar" aria-hidden="true"></i></span>
									</div>
								</div>
							</div>
							<div class='col-md-5'>
								<div class="form-group">
									<div class='input-group date' id='datetimepicker2'>
										<input type='text' class="form-control" name="end" id="end" /> 
										<span class="input-group-addon"> <i class="fa fa-calendar" aria-hidden="true"></i></span>
									</div>
								</div>
							</div> 
							<div class='col-md-1'></div>
						</div>
						<div class="row">
							<div class='col-md-1'></div>
								<div class='col-md-10'>
									<input type="text" name="hashtag" id="hashtag" class="form-control" placeholder="태그추가  ex) #여행 #여름" />
								</div>
							<div class='col-md-1'></div>
						</div>
						<button id="reg" class="btn btn-primary">등록하기</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>