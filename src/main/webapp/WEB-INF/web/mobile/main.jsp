<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=bac4f916-3297-3be4-93ff-e37ae88b8f42"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6x6lwLmHlSpovbF0nM-fPIPpjfv4D9IM&libraries=places"></script>

<link href="${pageContext.request.contextPath }/resources/css/mobile/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/css/mobile/main.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/css/mobile/sub.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/css/mobile/board.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/resources/css/mobile/enterprise.css"
	rel="stylesheet" type="text/css" />

	<script src="//code.jquery.com/jquery-latest.min.js"></script>

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"> -->
<link href="${pageContext.request.contextPath }/resources/images/mobile/favicon.ico" rel="icon" type="image/x-icon">
<script
	src="${pageContext.request.contextPath }/resources/js/mobile/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/mobile/jquery-2.1.4.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/mobile/jquery.bxslider.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/mobile/placeholders.js"></script>

<script
	src="${pageContext.request.contextPath }/resources/js/mobile/jquery.swipebox.js"></script>
<link href="${pageContext.request.contextPath }/resources/js/mobile/swipebox.css"
	rel="stylesheet" type="text/css" />


<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/mobile/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/js/mobile/fancybox/source/jquery.fancybox.css?v=2.1.5"
	media="screen" />


<script src="${pageContext.request.contextPath }/resources/js/mobile/script.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/resources/js/mobile/util.js"
	type="text/javascript"></script>

<!--     <script src="https://maps.google.com/maps/api/js?key=AIzaSyCAr0HeB2LSff7sqIUhi5D4H0NA0nPD7Bs&sensor=false" type="text/javascript"></script> -->



    <style type="text/css">
        
        /* 하단 길찾기 */
        #navDiv{
            width:100%;height:70%;background:#fff;position:absolute;z-index:98;bottom:0px;
            display:none;
        }
        #camera{
        	float:right;
        	bottom:0;
        	right:0;
        	margin-right:5%;
        	margin-bottom:7%;
        	position:absolute;
        }
        #location{
        	float:right;
        	bottom:0;
        	right:0;
        	margin-right:5%;
        	margin-bottom:25%;
        	position:absolute;
        }
    </style>
  
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/test.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/mobile/main/map.js"></script> --%>
<script type="text/javascript">

/* 	var map;
	var zoom;
	var center; */

	// 타임라인 div 클릭시 센터좌표 이동
	function goZoomIn(lat, lng){
		var center = new google.maps.LatLng(lat, lng);
		map.setCenter(center);
	}	
	
	
	$(document).ready(function() {
		$("#hidden_favMap").hide();
		$("#hidden_favPlace").hide();
		$("#hidden_myPlan").hide();

// 		즐겨찾기한 지도 목록 보기
		$("#show_favMap").click(function() {			
			$("#hidden_favMap").slideToggle('slow');
			var nowText = $(this).find(".menu_te").text();

			if (nowText == "▲") {
				$(this).find(".menu_te").text("▼");
			} else {
				$(this).find(".menu_te").text("▲");
			}
		});

//		즐겨찾기한 장소 목록 보기		
		$("#show_favPlace").click(function() {
			$("#hidden_favPlace").slideToggle('slow');
			var nowText = $(this).find(".menu_te").text();

			if (nowText == "▲") {
				$(this).find(".menu_te").text("▼");
			} else {
				$(this).find(".menu_te").text("▲");
			}
		});

//		내계획 목록 보기
		$("#show_myPlan").click(function() {			
			$("#hidden_myPlan").slideToggle('slow');
			var nowText = $(this).find(".menu_te").text();

			if (nowText == "▲") {
				$(this).find(".menu_te").text("▼");
			} else {
				$(this).find(".menu_te").text("▲");
			}
		});

		$("#openNavi").click(function() {
			$("#navDiv").slideDown("slow");
		});

		$("#closeNavi").click(function() {
			$("#navDiv").slideUp("slow");
		});

		$(".coupon_tab_btn span").click(function() {
			$(".coupon_tab_btn span").each(function() {
				$(this).removeClass("active");
			});

			$(this).addClass("active");
		});

		$("#clsNav").click(function() {
			$("#bottomDiv").hide();
		});

		$("#clsNav2").click(function() {
			$("#bottomDiv").hide();
		});
	});

	var latitude = "";
	var longitude = "";

	function getLocation() {
		var options = {
			// 가능한 경우, 높은 정확도의 위치(예를 들어, GPS 등) 를 읽어오려면 true로 설정
			// 그러나 이 기능은 배터리 지속 시간에 영향을 미친다. 
			enableHighAccuracy : true, // 대략적인 값이라도 상관 없음: 기본값

			// 위치 정보가 충분히 캐시되었으면, 이 프로퍼티를 설정하자, 
			// 위치 정보를 강제로 재확인하기 위해 사용하기도 하는 이 값의 기본 값은 0이다.
			maximumAge : 3000, // 5분이 지나기 전까지는 수정되지 않아도 됨

			// 위치 정보를 받기 위해 얼마나 오랫동안 대기할 것인가?
			// 기본값은 Infinity이므로 getCurrentPosition()은 무한정 대기한다.
			timeout : 15000
		// 15초 이상 기다리지 않는다.
		}

		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition, showError,
					options);
		} else {
			alert("이 브라우저에서는 위치 추적을 할 수 없습니다.");
		}
	}
	getLocation();

	function showPosition(position) {
		latitude = position.coords.latitude;
		longitude = position.coords.longitude;
		latitude == "37.530806";
		longitude == "126.8482816";
		if (latitude == "") {
			//좌표 못가져오면 서울시 좌표로 고정
			latitude == "37.5664101";
			longitude == "126.9783282";

		}
		get_map(latitude, longitude);

	}
	function get_map(latitude, longitude) {
		var locations = new Array();
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 16,
			center : new google.maps.LatLng(latitude, longitude),
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			mapTypeControl: false,
			zoomControl: false,
			streetViewControl: false
		});
		map.setOptions({passiveLogo: false});
		var startLat = "";
		var startLng = "";
		var endLat = "";
		var endLng = "";

		google.maps.event.addListener(map, 'idle', function() {
/* 			startLat = map.getBounds().getSouthWest().lat();
			startLng = map.getBounds().getSouthWest().lng();
			endLat = map.getBounds().getNorthEast().lat();
			endLng = map.getBounds().getNorthEast().lng(); */

		});
		
/* 		var camera = document.getElementById('camera');
		var location = document.getElementById('location');
        map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(camera);
        map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(location); */
	}

	function showError(error) {
		switch (error.code) {
		case error.PERMISSION_DENIED:
			get_map("37.5664101", "126.9783282");
			alert("위치추적을 거부했습니다.");
			break;
		case error.POSITION_UNAVAILABLE:
			alert("Location information is unavailable.");
			get_map("37.5664101", "126.9783282");
			break;
		case error.TIMEOUT:
			alert("TIME OUT")
			get_map("37.5664101", "126.9783282");
			break;
		case error.UNKNOWN_ERROR:
			alert("알수 없는 오류가 발생되어 지도 데이터를 불러올수 없습니다.");
			break;
		}
	}

	function goSearchs() {
		location.href = "./search.html";
	}
</script>

<!-- 내계획 모바일 지도화면에 뿌려주기 -->
<script>
//내 여행 계획 지도에 뿌려주기
	function displayMyPlan(mymapidx) {
	    $.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/map/getMymap.do',
		    dataType : 'json',
		    data : {
				mymapidx : mymapidx
		    },
		    success: function(data) {
		    	$('.btn_slide_close').click();
				console.log(data);
				var mymapLonLat = new Array();
				var mymapCheckpoint = new Array();
				for(var i=0; i<data[0].length; i++){
				    mymapLonLat.push({lat:Number(data[0][i].lat), lng:Number(data[0][i].lon)});
				    for(var j=0; j<data[1].length; j++){
						if(data[0][i].idx == data[1][j].regcoordinatesidx){
						    mymapCheckpoint.push({lat:Number(data[0][i].lat), lng:Number(data[0][i].lon), title:data[1][j].title, content:data[1][j].content});
						}
				    }
				}
				goZoomIn(Number(data[0][0].lat), Number(data[0][0].lon));
				
				// mymapLonLatList의 데이터가 있을때 새로들어온 데이터와 비교해서 동일하면 삭제하기
				if(mymapLonLatList.length != 0){
				    for(var i=0; i<mymapLonLatList.length; i++){
						if(mymapLonLatList[i].mymapidx == data[0][0].mymapidx){
						    mymapLonLatList.splice(i,1);
						    mymapCheckpointList.splice(i,1);
						    drawFavoriteMap();
						    return;
						}
				    }
				}
				 
				mymapLonLatList.push({mymapLonLat:mymapLonLat, mymapidx:data[0][0].mymapidx});
				mymapCheckpointList.push({mymapCheckpoint:mymapCheckpoint, mymapidx:data[0][0].mymapidx});
				console.log(mymapLonLatList);
				console.log(mymapCheckpointList);
				drawFavoriteMap();
	        }
		});   
	}		
</script>

<!-- 즐겨찾기한 지도 모바일 지도화면에 뿌리기 -->
<script>
	var mymapLonLatList = new Array();
	var mymapCheckpointList = new Array();
	var mymapCoordinates;

		function displayFavMap(mymapidx){
		    
		    $.ajax({
			    type: 'POST' , 
			    url: '${ pageContext.request.contextPath }/map/getMymap.do',
			    dataType : 'json',
			    data : {
					mymapidx : mymapidx
			    },
			    success: function(data) {
			    	$('.btn_slide_close').click();
					var mymapLonLat = new Array();
					var mymapCheckpoint = new Array();
					for(var i=0; i<data[0].length; i++){
					    mymapLonLat.push({lat:Number(data[0][i].lat), lng:Number(data[0][i].lon)});
					    for(var j=0; j<data[1].length; j++){
							if(data[0][i].idx == data[1][j].regcoordinatesidx){
							    mymapCheckpoint.push({lat:Number(data[0][i].lat), lng:Number(data[0][i].lon), title:data[1][j].title, content:data[1][j].content});
							}
					    }
					}
					goZoomIn(Number(data[0][0].lat), Number(data[0][0].lon));
					
					// mymapLonLatList의 데이터가 있을때 새로들어온 데이터와 비교해서 동일하면 삭제하기
					if(mymapLonLatList.length != 0){
					    for(var i=0; i<mymapLonLatList.length; i++){
							if(mymapLonLatList[i].mymapidx == data[0][0].mymapidx){
							    mymapLonLatList.splice(i,1);
							    mymapCheckpointList.splice(i,1);
							    drawFavoriteMap();
							    return;
							}
					    }
					}
					 
					mymapLonLatList.push({mymapLonLat:mymapLonLat, mymapidx:data[0][0].mymapidx});
					mymapCheckpointList.push({mymapCheckpoint:mymapCheckpoint, mymapidx:data[0][0].mymapidx});
					console.log(mymapLonLatList);
					console.log(mymapCheckpointList);
					drawFavoriteMap();
		        }
			});	
		}
		
		var checkPointMarker = new Array();
		
		function drawFavoriteMap() {    
		    map = new google.maps.Map(document.getElementById('map'), {
				zoom : zoom,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				center : center,
				mapTypeControl: false,
				zoomControl: false,
				streetViewControl: false
			});
		    
		    for(var i=0; i<mymapLonLatList.length; i++){    
				var mymapCoordinates = mymapLonLatList[i].mymapLonLat;
					var mymapPath = new google.maps.Polyline({
						path : mymapCoordinates,
						geodesic : true,
						strokeColor : '#FF0000',
						strokeOpacity : 1.0,
						strokeWeight : 3
					});
					mymapPath.setMap(null);
					mymapPath.setMap(map);
			}
		    console.log(mymapCheckpointList.length);
			
		    /////////////////////
			for(var i=0; i<mymapCheckpointList.length; i++){
			    for(var j=0; j<mymapCheckpointList[i].mymapCheckpoint.length; j++){
					console.log(mymapCheckpointList[i].mymapCheckpoint[j]);
						
					checkPointMarker.push(new google.maps.Marker({
				   	 	position: mymapCheckpointList[i].mymapCheckpoint[j],
				    	map: map
					}));
				  
				  var listener6 = google.maps.event.addListener(map, 'click', function(){
					if(infowindow != null){
						  infowindow.close();
					  }
				  });
				  var listener7 = google.maps.event.addListener(checkPointMarker, 'click', function(){
					  if(infowindow != null){
						  infowindow.close();
					  }
					  infowindow = new google.maps.InfoWindow({
						    content: gogogo
						  }); 
					  infowindow.open(map, this);
				  });  
			    }
			}
		    
		    
		    
 		    if(listLonLat.length != 0) {
			var initflightPlanCoordinates = listLonLat;
				var initflightPath = new google.maps.Polyline({
					path : initflightPlanCoordinates,
					geodesic : true,
					strokeColor : '#000000',
					strokeOpacity : 1.0,
					strokeWeight : 2
				});
				initflightPath.setMap(null);
				
				if(checkMarker.length != 0){	// 라인 마커가 있으면
					for (var i = 0; i < checkMarker.length; i++) {
						checkMarker[i].setMap(null);
					  }
					checkMarker = [];
					startLocation = null;
					endLocation = null;
				}
				
				initflightPath.setMap(map);
			}
		    addLineMarker();
		    
		}		
</script>



<!-- 즐겨찾기한 장소 모바일 지도화면 뿌리기 -->
<script>
	var displayedFavPlaces = {};
	var favPlace;
	var fpCoord;
	var isNew = true;

	function displayFavPlace(checkpointidx) {
		
//		해당 즐찾장소가 이미 지도에 찍혀져 있는지 확인
		if(displayedFavPlaces[checkpointidx] != null) {
			isNew = false;
		}

		$.ajax({
			    type: 'POST' , 
			    url: '${ pageContext.request.contextPath }/map/getMyplace.do',
			    dataType : 'json',
			    data : {
			    	checkpointidx : checkpointidx
			    },
			    success: function(data) {
			    	fpCoord = {lat:Number(data.lat),lng:Number(data.lon)};
					
			    	if(isNew) {
			    		$('.btn_slide_close').click();
			    		goZoomIn(data.lat, data.lon);
						favPlace = new google.maps.Marker({
							map : map,
							position : fpCoord,
							icon : "https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png" 
						});
						displayedFavPlaces[checkpointidx] = favPlace;
			    	} else {
			    		$('.btn_slide_close').click();
			    		displayedFavPlaces[checkpointidx].setMap(null);
			    		delete displayedFavPlaces[checkpointidx];
			    		isNew = true;
			    	}
									
					var listener3 = 
						google.maps.event.addListener(map, 'click', function() {
							if(infowindow != null){
								infowindow.close();
							  }
					  	});
					var listener1 = 
						google.maps.event.addListener(favPlace, 'click', function() {
							if(infowindow != null){
								infowindow.close();
						  	} 
						  
							infowindow = new google.maps.InfoWindow({
							    content: (this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+
							    '<br/><input type="button" value="위치추가" onClick="addFavoriteMarker('+
							    		(this.position.lat()).toFixed(7)+", "+(this.position.lng()).toFixed(7)+')"/>'
							}); 
						infowindow.open(map, this);
					  	});				        
 				}
			});	   
		}
		
 		function addFavoriteMarker(lat, lon){
		    console.log(lat+", "+lon);
		    listLonLat.push({lat:lat, lng:lon});
		    favoritePlaceLonLat = null;
		    goZoomIn(lat, lon);
		    initialize();
		} 

</script>


<script type="text/javascript">
$(document).ready(function() {
	$('#agree01').change(function() {
        if($(this).is(":checked")) {
            var flag = $(this).is(":checked");
            Android.showMyValue(flag);
            
        } else{
        	var flag = $(this).is(":checked");
            Android.showMyValue(flag);
        }  
    });
});

function returnCheck(){
	$('#agree01').attr("checked",false);
}

function getAndroidFlag(flag){
	 $('#agree01').val(flag);
}

function takepicture(){
    Android.takePicture();
}

function getCurPorition(){
    Android.getCurPosition();
}

function returnCurPosition(lat, lon){
    var curMarker = new Array();
    var center = new google.maps.LatLng(lat, lon);
    map.setCenter(center);
    map.setZoom(15);
	curMarker.push(new google.maps.Marker({
	    position: center,
		map: map,
		center : center
	}));
}

</script>
</head>
<body>
	<div class="side_menu_bg"></div>
	<div class="layer_bg"></div>

	<div id="wrap" style="height: 100%;">

		<header id="header" class="clearfix">
			<a href="#!" class="gnb_menu"> <span class="left"></span> <span
				class="center"></span> <span class="right"></span>
			</a>
			<h2 class="page_tit">
				<a href="./main.html"><img src="${pageContext.request.contextPath }/resources/images/mobile/logo.png" alt="로고"
					class="logo" style="height: 60px;" /></a>
			</h2>



		</header>
		<!--header_end-->



		<aside id="side_menu">

			<!-- 로그인 안되었을 때 -->
			<div class="user_info">
				<div class="user_img" id="user_img">
					<a href="${pageContext.request.contextPath }/resources/images/mobile/login.html"> <img src="${pageContext.request.contextPath }/resources/images/mobile/user_no_img.png"
						alt="유저이미지" />
					</a>
				</div>
				<div class="user_txt" style="vertical-align: middle;">
					<a href="./login.html"><strong class="login_txt01">로그인을
							해주세요.</strong></a>

				</div>
			</div>



			<!-- 로그인 안되었을 때 -->
			<!--
		<div class="user_info">
			<div class="user_img" id="user_img">
				<a href="./login.html">
					<img src="${pageContext.request.contextPath }/resources/images/mobile/user_img.png" alt="유저이미지" />
				</a>
			</div>
            <div class="user_txt" style="vertical-align:middle;">
                        <a href="./login.html"><strong class="login_txt01"><span>홍순일</span>님 환영합니다</strong></a>
        
            </div>
		</div>
        -->


			<nav id="gnb">
				<ul class="depth01 clearfix">


					<li><a href="#!"> <img src="${pageContext.request.contextPath }/resources/images/mobile/icon_menu1.png"
							alt="즐겨찾기" /> <span>즐겨찾기</span>
					</a> <img class="menu_rg" src="${pageContext.request.contextPath }/resources/images/mobile/icon_menu4.png" alt="검색"
						onclick="goSearchs();" /></li>



					<!-- 즐겨찾기한 지도 목록 보기 -->
					<li id="show_favMap"><a href="#!"> <img
							src="${pageContext.request.contextPath }/resources/images/mobile/icon_menu2.png" alt="즐찾지도" /> <span>즐찾지도</span>
					</a> <span class="menu_te">▲</span></li>
					<li id="hidden_favMap">
						<div id="favMapList" style="width: 100%; max-height: 200px; overflow: hidden; overflow-y: auto;">
							<ul class="sub_depth01 clearfix">
								<c:forEach items="${ favMapList }" var="favMap">
									<li onclick="displayFavMap(${ favMap.idx });"><a>${ favMap.title }</a></li>
								</c:forEach> 
							</ul>
						</div>
					</li>

					<!-- 즐겨찾기한 장소 목록 보기 -->
					<li id="show_favPlace"><a href="#!"> <img
							src="${pageContext.request.contextPath }/resources/images/mobile/icon_menu3.png" alt="즐찾장소" /> <span>즐찾장소</span>
					</a> <span class="menu_te">▲</span></li>
					<li id="hidden_favPlace">
						<div id="favPlaceList"
							style="width: 100%; max-height: 200px; overflow: hidden; overflow-y: auto;">
							<ul class="sub_depth01 clearfix">
								<c:forEach items="${ favPlaceList }" var="favPlace">
									<li onclick="displayFavPlace(${ favPlace.checkpointidx });"><a>${ favPlace.placename }</a></li>
								</c:forEach>
							</ul>
						</div>
					</li>

					<!-- 내 여행계획 보기 -->
					<li id="show_myPlan"><a href="#!"> <img
							src="${pageContext.request.contextPath }/resources/images/mobile/icon_menu1.png" alt="내계획" /> <span>내계획</span>
					</a> <span class="menu_te">▲</span></li>
					<li id="hidden_myPlan">
						<div id="myPlanList"
							style="width: 100%; max-height: 200px; overflow: hidden; overflow-y: auto;">
							<ul class="sub_depth01 clearfix">
								<c:forEach items="${ myPlanList }" var="myPlan">
									<li onclick="displayMyPlan(${ myPlan.idx });"><a>${ myPlan.title }</a></li>
								</c:forEach>
							</ul>
						</div>
					</li>





				</ul>
				<div class="register_btn">
					<label for="agree01" class="ios_check"><input
						type="checkbox" id="agree01" class="ios-switch green  bigswitch"><span><span></span></span>
						<span class="t_xt">실시간 기록</span> </label>
				</div>

			</nav>
			<a href="#!" class="btn_slide_close"><img
				src="${pageContext.request.contextPath }/resources/images/mobile/btn_slide_close.png" alt="메뉴 닫기" /></a>
		</aside>


		<div style="" id="navDiv">
			<div id="closeNavi" class="btnNavi"
				style="width: 100%; height: 20px; font-weight: bold; background-color: white; padding-top: 10px; padding-left: 10px;">
				<div style="width: 85%; display: inline-block;">서초구 저기동 저기 어디?
				</div>


				<span
					style="float: right; margin-right: 25px; width: 20px; text-align: center; position: absolute;"
					id="clsNav">X</span>
			</div>
			<div class="coupon_tab_btn">
				<span class="tab_btn tab01 active"> <a href="#!">자가용</a>
				</span> <span class="tab_btn tab02"> <a href="#!">대중교통</a>
				</span> <span class="tab_btn tab03"> <a href="#!">도보</a>
				</span>


			</div>

			<div
				style="width: 100%; overflow: hidden; overflow-y: auto; height: 83%;">

				<ul class="foot_depth01 clearfix">

					<li><a href="#!"> <span>장소1</span>
					</a></li>

					<li><a href="#!"> <span>장소1</span>
					</a></li>
					<li><a href="#!"> <span>장소1</span>
					</a></li>
					<li><a href="#!"> <span>장소1</span>
					</a></li>
					<li><a href="#!"> <span>장소1</span>
					</a></li>
					<li><a href="#!"> <span>장소1</span>
					</a></li>
					<li><a href="#!"> <span>장소1</span>
					</a></li>
					<li><a href="#!"> <span>장소1</span>
					</a></li>
					<li><a href="#!"> <span>장소1</span>
					</a></li>
					<li><a href="#!"> <span>장소1</span>
					</a></li>

				</ul>

			</div>


		</div>




		<section id="container" style="height: 89%; padding: 0;">
			<div id="map" style="width: 100%; height: 100%; position:absolute;"></div>
				<div id=location><a href="javascript:getCurPorition()"><img src="${pageContext.request.contextPath }/resources/images/location.png"/></a></div>
				<div id=camera><a href="javascript:takepicture()"><img src="${pageContext.request.contextPath }/resources/images/camera.png"/></a></div>




			<div id="bottomDiv" class="btnNavi"
				style="width: 100%; height: 60px; bottom: 0px; font-size: 30px; font-weight: bold; display: block; position: fixed; background-color: white; opacity: 0.8; padding-top: 10px; padding-left: 10px;">

				<div style="width: 85%; display: inline-block;" id="openNavi">
					서초구 저기동 저기 어디?</div>

				<span
					style="float: right; margin-right: 25px; width: 20px; text-align: center; position: absolute;"
					id="clsNav2">X</span>

			</div>



			<!-- footer -->


		</section>
		<!-- //container End -->



	</div>
	<!--wrap_end-->
	


</body>
</html>