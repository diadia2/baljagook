<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share2.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View profile</title>
<style type="text/css">
.xbutton {
	position: absolute !important;
	z-index: 35 !important;
	font-size: 16px !important;
	color: #000; 
	background: rgba(244, 67, 54, 0);	
}
</style>
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
<script type="text/javascript">
	function showMyMap() {
		// mymap
		$.ajax({
			type : 'POST',
			url : '${ pageContext.request.contextPath }/member/getMymapList.do',
			dataType : 'json',
			success : function(data) {
						$('#mymapInfo').children().remove();
						console.log(data);
						console.log(data[0].length);
						//console.log(data[0][0].content); // mymap 0번째의 내용
						//console.log(data[0][0].idx);	 // mymap 0번째 인덱스
						//console.log(data[1]);			 // reglist들의 list
						//console.log(data[1][data[0][0].idx]);	// reglist들의 list의 0번째 리스트
						//console.log(data[1][data[0][0].idx][0].lat);	// reglist들의 list의 0번째 리스트의 0번째 lat
						var lonlat = "";
						for (i = 0; i < data[0].length; i++) {
							for (j = 0; j < data[1][data[0][i].idx].length; j++) {
								lonlat += data[1][data[0][i].idx][j].lat;
								lonlat += ",";
								lonlat += data[1][data[0][i].idx][j].lon;
								if (j != (data[1][data[0][i].idx].length) - 1) {
									lonlat += "|";
								}
							}
							$('#mymapInfo').append(
													'<div class="col-lg-3 col-md-4 col-sm-6"><div class="thumbnail-box-wrapper"><div class="thumbnail-box"><button onclick="deleteMyMap('+data[0][i].idx+')" class="btn btn-sm btn-danger tooltip-button del icon-tr xbutton" title="삭제" value=""><i class="glyph-icon icon-remove"></i></button><a class="thumb-link" href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='
													+ data[0][i].idx
													+ '" title=""></a><div class="thumb-overlay"></div><img src="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|'
													+ lonlat
													+ '&size=400x400&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc" alt=""></div><div class="thumb-pane"><h3 class="thumb-heading animated rollIn"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='
													+ data[0][i].idx
													+ '" title="">'
													+ data[0][i].title
													+ '</a> <small>'
													+ data[0][i].regdate
													+ '</small></h3></div></div></div>');
											lonlat = "";
						}
					}
			});	
	}

	function showMyPlan() {
		// myplan
		$.ajax({
			type : 'POST',
			url : '${ pageContext.request.contextPath }/member/getMyPlanList.do',
			dataType : 'json',
			success : function(data) {
						$('#myplanInfo').children().remove();
							console.log(data);
							console.log(data[0].length);
							//console.log(data[0][0].content); // mymap 0번째의 내용
							//console.log(data[0][0].idx);	 // mymap 0번째 인덱스
							//console.log(data[1]);			 // reglist들의 list
							//console.log(data[1][data[0][0].idx]);	// reglist들의 list의 0번째 리스트
							//console.log(data[1][data[0][0].idx][0].lat);	// reglist들의 list의 0번째 리스트의 0번째 lat
							var lonlat = "";
							for (i = 0; i < data[0].length; i++) {
								for (j = 0; j < data[1][data[0][i].idx].length; j++) {
									lonlat += data[1][data[0][i].idx][j].lat;
									lonlat += ",";
									lonlat += data[1][data[0][i].idx][j].lon;
									if (j != (data[1][data[0][i].idx].length) - 1) {
										lonlat += "|";
									}
								}
								$('#myplanInfo').append(
														'<div class="col-lg-3 col-md-4 col-sm-6"><div class="thumbnail-box-wrapper"><div class="thumbnail-box"><button onclick="deleteMyPlan('+data[0][i].idx+')" class="btn btn-sm btn-danger tooltip-button del icon-tr xbutton" title="삭제" value=""><i class="glyph-icon icon-remove"></i></button><a class="thumb-link" href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='
														+ data[0][i].idx
														+ '" title=""></a><div class="thumb-overlay"></div><img src="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|'
														+ lonlat
														+ '&size=400x400&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc" alt=""></div><div class="thumb-pane"><h3 class="thumb-heading animated rollIn"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='
														+ data[0][i].idx
														+ '" title="">'
														+ data[0][i].title
														+ '</a> <small>'
														+ data[0][i].regdate
														+ '</small></h3></div></div></div>');
												lonlat = "";
							}
					}
		});	
	}

	function showFavoriteMap() {
		//favorite Map
		$.ajax({
				type : 'POST',
				url : '${ pageContext.request.contextPath }/member/getFavoriteMapList.do',
				dataType : 'json',
				success : function(data) {
							$('#favoritemap').children().remove();
							console.log(data);
							console.log(data[0].length);
							//console.log(data[0][0].content); // mymap 0번째의 내용
							//console.log(data[0][0].idx);	 // mymap 0번째 인덱스
							//console.log(data[1]);			 // reglist들의 list
							//console.log(data[1][data[0][0].idx]);	// reglist들의 list의 0번째 리스트
							//console.log(data[1][data[0][0].idx][0].lat);	// reglist들의 list의 0번째 리스트의 0번째 lat
							var lonlat = "";
							for (i = 0; i < data[0].length; i++) {
								for (j = 0; j < data[1][data[0][i].idx].length; j++) {
									lonlat += data[1][data[0][i].idx][j].lat;
									lonlat += ",";
									lonlat += data[1][data[0][i].idx][j].lon;
									if (j != (data[1][data[0][i].idx].length) - 1) {
										lonlat += "|";
									}
								}
								$('#favoritemap').append(
														'<div class="col-lg-4 col-md-4 col-sm-6"><div class="thumbnail-box-wrapper"><div class="thumbnail-box"><button onclick="deleteFavoriteMap('+data[0][i].idx+')" class="btn btn-sm btn-danger tooltip-button del icon-tr xbutton" title="삭제" value=""><i class="glyph-icon icon-remove"></i></button><a class="thumb-link" href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='
														+ data[0][i].idx
														+ '" title=""></a><div class="thumb-overlay"></div><img src="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|'
														+ lonlat
														+ '&size=400x400&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc" alt=""></div><div class="thumb-pane"><h3 class="thumb-heading animated rollIn"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='
														+ data[0][i].idx
														+ '" title=""><small>'
														+ data[0][i].title
														+ '</small></a></h3></div></div></div>');
												lonlat = "";
							}
						}
		});	
	}

	function showFavoritePlace() {
		//favorite Place
		$.ajax({
				type : 'POST',
				url : '${ pageContext.request.contextPath }/member/getFavoritePlaceList.do',
				dataType : 'json',
				success : function(data) {
							$('#favoriteplace').children().remove();
							var lonlat = "";
							for (i = 0; i < data[0].length; i++) {
								lonlat += data[1][i].lat;
								lonlat += ",";
								lonlat += data[1][i].lon;
								$('#favoriteplace').append(
														'<div class="col-lg-4 col-md-4 col-sm-6"><div class="thumbnail-box-wrapper"><div class="thumbnail-box"><button onclick="deleteFavoritePlace('+data[0][i].idx+')" class="btn btn-sm btn-danger tooltip-button del icon-tr xbutton" title="삭제" value=""><i class="glyph-icon icon-remove"></i></button><a class="thumb-link" href="javascript:myPlace('
														+ data[0][i].checkpointidx
														+ ')" title=""></a><div class="thumb-content"><div class="center-vertical"><div class="center-content">'
														+ '<i class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i></div></div></div><div class="thumb-overlay"></div><img src="https://maps.googleapis.com/maps/api/staticmap?center='
														+ lonlat
														+ '&zoom=19&size=400x400&markers=color:red|'
														+ lonlat
														+ '&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc" alt=""></div><div class="thumb-pane"><h3 class="thumb-heading animated rollIn"><a href="#" title=""><small>'
														+ data[0][i].placename
														+ '</small></a></h3></div></div></div>');
												lonlat = "";
							}
						}
		});	
	}

/*-----------------------프로필 이미지 가져오기------------------------*/
	function showProfileImage() {
		$.ajax({
			type : 'POST',
			url : '${ pageContext.request.contextPath }/getMyProfileImage.do',
			contentType : 'application/json',
			dataType : 'json',
			success : function(imageName) {
				$("#profileImage").prop("src", "${ pageContext.request.contextPath }/resources/photo/profileImage/"+imageName);
			}
		});	
	}

	$(document).ready(function() {
		showMyMap();
		showMyPlan();
		showFavoriteMap();
		showFavoritePlace();
		showProfileImage();
	});
		
	function myPlace(checkpointidx) {
		window.open(
					"${ pageContext.request.contextPath }/member/favoritePlace.do?checkpointidx="
					+ checkpointidx,
					"FavoritePlace",
					"top=10, width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}

	/*----------------------My Map 삭제------------------------*/
	function deleteMyMap(mymapidx) {
		console.log(mymapidx);
		if (confirm("삭제 하시겠습니까?")) {
			$.ajax({
				type : 'POST',
				data : jQuery.param({
					mymapidx : mymapidx
				}),
				url : '${ pageContext.request.contextPath }/deleteMyMap.do',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : (function(data) {
					alert('삭제되었습니다');
					showMyMap();
				})
			});
		}
	}

	/*----------------------My Plan 삭제------------------------*/
	function deleteMyPlan(mymapidx, type) {
		console.log(mymapidx);
		console.log(type);
		if (confirm("삭제 하시겠습니까?")) {
			$.ajax({
				type : 'POST',
				data : jQuery.param({
					mymapidx : mymapidx
				}),
				url : '${ pageContext.request.contextPath }/deleteMyPlan.do',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : (function(data) {
					alert('삭제되었습니다');
					showMyPlan();
				})
			});
		}
	}

	/*----------------------Favorite Map 삭제------------------------*/
	function deleteFavoriteMap(idx) {
		console.log(idx);
		if (confirm("삭제 하시겠습니까?")) {
			$.ajax({
				type : 'POST',
				data : jQuery.param({
					idx : idx
				}),
				url : '${ pageContext.request.contextPath }/deleteFavoriteMap.do',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : (function(data) {
					alert('삭제되었습니다');
					showFavoriteMap();
				})
			});
		}
	}

	/*----------------------Favorite Place 삭제------------------------*/
	function deleteFavoritePlace(idx) {
		console.log(idx);
		if (confirm("삭제 하시겠습니까?")) {
			$.ajax({
				type : 'POST',
				data : jQuery.param({
					idx : idx
				}),
				url : '${ pageContext.request.contextPath }/deleteFavoritePlace.do',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : (function(data) {
					alert('삭제되었습니다');
					showFavoritePlace();
				})
			});
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
	function submitUpdatePass() {
		$('#changePassForm').submit();
	}
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
var timer;
function checkFile(imageName) {
 		$.ajax({
			url : '${ pageContext.request.contextPath }/resources/photo/profileImage/'+imageName,
			type: 'HEAD',
			error : function() {
				timer = setTimeout(function() {
							checkFile(imageName);
						}, 3000);
			},
			success : function(data) {
				clearTimeout(timer);
				showProfileImage();
/* 				$("#profileImage").prop("src", "${ pageContext.request.contextPath }/resources/photo/profileImage/"+imageName); */
				$('#addProfileImg').modal('hide');
			}
		});
	}
Dropzone.autoDiscover = false;
$(document).ready(function () {
	
 	$('#uploadProfileImg').click(function () {
		$('#addProfileImg').modal('show');
	});
	
	$("div#dropThat").dropzone({
		url: "${ pageContext.request.contextPath }/uploadPhoto.do",
		maxFilesize : 3,
		maxFiles : 1,
		autoProcessQueue: false,
		init: function() {
			
			this.on("maxfilesexceeded", function(file) {
				this.removeAllFiles();
				this.addFile(file);
			});
			
			var myDropzone = this;
		 	
			$('#finishUpload').click(function() {
		 		myDropzone.processQueue(); 		
			});
			
			this.on("success", function(file, imageName) {
				checkFile(imageName);		
			});
		}		
	});	
});		
</script>
</head>
<body>
<!------------------ 프로필 이미지 등록 Modal -------------------->	
	<div class="modal fade" id="addProfileImg" tabindex="-1" role="dialog" aria-labelledby="addProfileImgModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">프로필 사진 등록</h4>					
				</div>
				<div class="modal-body">
					<div id="dropThat" class="dropzone"></div>
				</div>
				<div class="modal-footer">
					<button id="finishUpload" class="btn btn-success">완료</button>
				</div>
			</div>
		</div>
	</div>
	<div id="sb-site">
		<div id="page-wrapper">
			<div id="page-content-wrapper">
				<jsp:include page="/top2.do" />
				<div id="page-content">
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/uniform/uniform.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/uniform/uniform-demo.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/tabs/tabs.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/chosen/chosen.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/chosen/chosen-demo.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/input-switch/inputswitch.js"></script>
					<script type="text/javascript">
						/* Input switch */

						$(function() {
							"use strict";
							$('.input-switch').bootstrapSwitch();
						});
					</script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/textarea/textarea.js"></script>
					<script type="text/javascript">
						/* Textarea autoresize */

						$(function() {
							"use strict";
							$('.textarea-autosize').autosize();
						});
					</script>
					<div class="row mailbox-wrapper">
						<div class="col-md-4">
							<div class="panel-layout">
								<div class="panel-box">
									<div class="panel-content image-box" style="max-height: 200px;">
										<div class="ribbon">
											<div class="bg-primary">Ribbon</div>
										</div>
										<div class="image-content font-white">
											<div class="meta-box meta-box-bottom">
												<img width="80" height="80"
													src="${ pageContext.request.contextPath }/resources/photo/profileImage/${ imageName }"
													alt="" class="meta-image img-bordered img-circle">
												<h3 class="meta-heading">${sessionScope.user }</h3>
											</div>
										</div>
										<img
											src="${pageContext.request.contextPath }/resources/assets/image-resources/blurred-bg/blurred-bg-13.jpg"
											alt="">
									</div>
									<div class="panel-content pad15A bg-white radius-bottom-all-4">
										<div class="clear profile-box">
											<ul class="nav nav-pills nav-justified">
												<li><a href="#" class="btn btn-sm bg-google"><span
														class="glyph-icon icon-separator"><i
															class="glyph-icon icon-google-plus"></i></span> <span
														class="button-content">Google+</span></a></li>
												<li><a href="#" class="btn btn-sm bg-facebook"><span
														class="glyph-icon icon-separator"><i
															class="glyph-icon icon-facebook"></i></span> <span
														class="button-content">Facebook</span></a></li>
												<li><a href="#" class="btn btn-sm bg-twitter"><span
														class="glyph-icon icon-separator"><i
															class="glyph-icon icon-twitter"></i></span> <span
														class="button-content">Twitter</span></a></li>
											</ul>
										</div>
										<div class="mrg15T mrg15B"></div>
									</div>
								</div>
							</div>
							<div class="content-box mrg15B">
								<h3 class="content-box-header clearfix">
									Follow online
									<div class="font-size-11 float-right">
										<a href="#" title=""><i
											class="glyph-icon mrg5R opacity-hover icon-plus"></i></a> <a
											href="#" title=""><i
											class="glyph-icon opacity-hover icon-cog"></i></a>
									</div>
								</h3>
								<div class="content-box-wrapper text-center clearfix">
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial1.jpg"
											alt="">
										<div class="small-badge bg-red"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial2.jpg"
											alt="">
										<div class="small-badge bg-orange"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial3.jpg"
											alt="">
										<div class="small-badge bg-red"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial4.jpg"
											alt="">
										<div class="small-badge bg-green"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial5.jpg"
											alt="">
										<div class="small-badge bg-orange"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial6.jpg"
											alt="">
										<div class="small-badge bg-red"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="example-box-wrapper">
								<ul class="list-group row list-group-icons">
									<li class="col-md-3 active"><a href="#tab-example-1"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon icon-gear"></i> Account Settings</a></li>
									<li class="col-md-3"><a href="#tab-example-2"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-primary icon-edit"></i> My Map</a></li>
									<li class="col-md-3"><a href="#tab-example-3"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-blue-alt icon-calculator"></i> My Plan</a></li>
									<li class="col-md-3"><a href="#tab-example-4"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-yellow icon-star"></i> Favorites </a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane pad0A fade active in" id="tab-example-1">
										<div class="row">
											<div class="col-md-6">
												<div class="content-box mrg15B">
													<h3 class="content-box-header clearfix text-center">
														Change Password</h3>
													<div class="content-box-wrapper pad0T clearfix">
														<form id="changePassForm" class="form-horizontal pad15L pad15R bordered-row">
															<div class="form-group">
																<label class="col-sm-6 control-label">Old
																	password:</label>
																<div class="col-sm-6">
																	<input type="password" class="form-control" name="currentPassword"
																		placeholder="">
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-6 control-label">New
																	password:</label>
																<div class="col-sm-6">
																	<input type="password" class="form-control" name="newPassword"
																		placeholder="">
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-6 control-label">Repeat
																	password:</label>
																<div class="col-sm-6">
																	<input type="password" class="form-control" name="newPasswordConfirm"
																		placeholder="">
																</div>
															</div>
														</form>
													</div>
													<div class="button-pane mrg20T">
														<button onclick="submitUpdatePass()" class="btn btn-success">Update Password</button>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="content-box">
													<h3 class="content-box-header clearfix text-center">
														Account Settings</h3>
													<form
														class="form-horizontal clearfix pad15L pad15R pad20B bordered-row">
														<div class="form-group">
															<label class="col-sm-7 control-label">Enable
																message:</label>
															<div class="col-sm-3">
																<input type="checkbox" data-on-color="danger"
																	data-size="small" name="checkbox-example-1"
																	class="input-switch" data-on-text="On"
																	data-off-text="Off">
															</div>
														</div>
														<div class="form-group col-sm-12 text-center">
															<div class="fileinput-preview thumbnail"
																data-trigger="fileinput"
																style="width: 200px; height: 150px">
																<img id="profileImage" src="${ pageContext.request.contextPath }/resources/photo/profileImage/${ imageName }" width="200px" height="150px"/>
															</div>
															<br /> <br />
															<button id="uploadProfileImg" type="button" class="btn btn-success">사진
																업로드</button>
														</div>
														<div class="form-group col-sm-12 text-center">
															<button type="button" class="btn btn-danger" onclick="deactivateAccount()">계정 탈퇴</button>
														</div>														
													</form>
												</div>
											</div>
										</div>
									</div>
					

									<div class="tab-pane fade" id="tab-example-2">
										<div class="panel-body" style="background-color: white;">
											<div class="example-box-wrapper">
												<div class="col-lg-3 col-md-4 col-sm-6">
													<div class="thumbnail-box-wrapper">
														<div class="thumbnail-box thumbnail-box-inverse">
															<a class="thumb-link" href="#" title=""
																data-toggle="modal" data-target="#myModal"
																data-backdrop="static" data-keyboard="false"
																style="border: 2px solid"></a>
															<div class="thumb-content">
																<div class="center-vertical">
																	<div class="center-content">
																		<i
																			class="icon-helper icon-center animated rotateIn font-white glyph-icon icon-plus"></i>
																	</div>
																</div>
															</div>
															<div class="thumb-overlay bg-white"></div>
															<img
																src="${ pageContext.request.contextPath }/resources/images/click.jpg"
																alt="">
														</div>
														<div class="thumb-pane">
															<h3 class="thumb-heading animated rollIn">
																<a href="#" title="">새로 등록하기</a> <small>Create
																	Map</small>
															</h3>
														</div>
													</div>
												</div>
												<div id="mymapInfo" class="row">
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="tab-pane fade" id="tab-example-3">
										<div class="panel-body" style="background-color: white;">
											<div class="example-box-wrapper">		
												<div class="col-lg-3 col-md-4 col-sm-6">
													<div class="thumbnail-box-wrapper">
														<div class="thumbnail-box thumbnail-box-inverse">
															<a class="thumb-link"
																href="${pageContext.request.contextPath}/map/plantrip.do"
																title="" style="border: 2px solid"></a>
															<div class="thumb-content">
																<div class="center-vertical">
																	<div class="center-content">
																		<i
																			class="icon-helper icon-center animated rotateIn font-white glyph-icon icon-plus"></i>
																	</div>
																</div>
															</div>
															<div class="thumb-overlay bg-white"></div>
															<img
																src="${ pageContext.request.contextPath }/resources/images/click.jpg"
																alt="">
														</div>
														<div class="thumb-pane">
															<h3 class="thumb-heading animated rollIn">
																<a
																	href="${pageContext.request.contextPath}/map/plantrip.do"
																	title="">새로 계획하기</a> <small>Create Plan</small>
															</h3>
														</div>
													</div>
												</div>
												<div id="myplanInfo" class="row">
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="tab-pane fade" id="tab-example-4">
										<div class="col-md-6">
											<div class="content-box">
												<h3 class="content-box-header clearfix text-center">Favorite
													Map</h3>
												<div class="panel-body" style="background-color: white;">
													<div class="example-box-wrapper">
														<div id="favoritemap" class="row"></div>
													</div>
												</div>
											</div>
										</div>



										<div class="col-md-6">
											<div class="content-box">
												<h3 class="content-box-header clearfix text-center">Favorite
													Place</h3>
												<div class="panel-body" style="background-color: white;">
													<div class="example-box-wrapper">
														<div id="favoriteplace" class="row"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									
								</div>
							</div>
						</div>
						
						<!-------------------------- datepicker ------------------------------->
						<script type="text/javascript"
							src="${pageContext.request.contextPath }/resources/assets/widgets/datepicker-ui/datepicker.js"></script>
						<script type="text/javascript"
							src="${pageContext.request.contextPath }/resources/assets/widgets/datepicker-ui/datepicker-demo.js"></script>
						<script type="text/javascript"
							src="${pageContext.request.contextPath }/resources/assets/widgets/daterangepicker/moment.js"></script>
						<script type="text/javascript"
							src="${pageContext.request.contextPath }/resources/assets/widgets/daterangepicker/daterangepicker.js"></script>
						<script type="text/javascript"
							src="${pageContext.request.contextPath }/resources/assets/widgets/daterangepicker/daterangepicker-demo.js"></script>
						<script type="text/javascript"
							src="${pageContext.request.contextPath }/resources/assets/widgets/timepicker/timepicker.js"></script>
				
						<!------------------------- 여행 등록 Modal ----------------------------->	
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								
								<form action="${ pageContext.request.contextPath }/map/mapcheck.do" method="POST" name="inputform">
									
									<div class="modal-content">
										
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title">Modal title</h4>
										</div>
									
										<div class="modal-body">
											<input name="title" type="text" class="form-control"
												placeholder="제목"> <br /> <input name="content"
												type="text" class="form-control" placeholder="설명"><br />
												<div class="form-group">
													<div class="input-prepend input-group">
														<span class="add-on input-group-addon"><i
															class="glyph-icon icon-calendar"></i></span> <input type="text"
															name="daterangepickertime" id="daterangepicker-time"
															class="form-control" value=""> <input type="text"
															id="start" name="start" value="${start}"> <input
															type="text" id="end" name="end" value="${end }">
														<script type="text/javascript">
															/* daterangepicker-time에서 apply 누르면 실행(daterangepicker.js에 추가함) */
															function changeDP() {
																var date = document.inputform.daterangepickertime.value;
																var time1 = date.substring(11, 13);
																var time2 = date.substring(33, 35);
																console.log(time1);
																if ((date.substring(17, 19)) == ("PM")) {
																	time1 = Number(time1) + 12;
																}
																if ((date.substring(39, 41)) == ("PM")) {
																	time2 = Number(time2) + 12;
																}
																document.inputform.start.value = date
																		.substring(0, 11)
																		+ time1
																		+ date.substring(13, 16);
																document.inputform.end.value = date
																		.substring(22, 33)
																		+ time2
																		+ date.substring(35, 38);
															}
														</script>
													</div>
												</div>
											<input name="hashtag" type="text" class="form-control title-text"
												placeholder="#해쉬태그">
										</div>
										
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">등록하기</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
										</div>
									</div>
								</form>
							</div>
						</div>		

				</div>	
			</div>
			<jsp:include page="/bottom2.do" />	
		</div>
	</div>
</div>

	
	
</body>
</html>