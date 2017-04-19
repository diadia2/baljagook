<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
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
<script src="${pageContext.request.contextPath}/resources/js/js.cookie.js"></script>	


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
    	#lpop{
    		margin-right:20%;
        	margin-bottom:50%;
	    	bottom:0;
        	right:0;
	    	float:right;
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
		
		checkAutoLoginCookie();		
		
		$("#hidden_favMap").hide();
		$("#hidden_favPlace").hide();
		$("#hidden_myPlan").hide();
		$("#lpop").hide();

// 		즐겨찾기한 지도 목록 보기
		$("#show_favMap").click(function() {			
			$("#hidden_favMap").slideToggle('fast');
			show_favMap();
			$("#hidden_favPlace").slideUp('fast');
			$("#show_favPlace").find(".menu_te").text("▼");
			$("#hidden_myPlan").slideUp('fast');
			$("#show_myPlan").find(".menu_te").text("▼");
		});

//		즐겨찾기한 장소 목록 보기		
		$("#show_favPlace").click(function() {
			$("#hidden_favPlace").slideToggle('fast');
			show_favPlace();
			$("#hidden_favMap").slideUp('fast');
			$("#show_favMap").find(".menu_te").text("▼");
			$("#hidden_myPlan").slideUp('fast');
			$("#show_myPlan").find(".menu_te").text("▼");
		});

//		내계획 목록 보기
		$("#show_myPlan").click(function() {			
			$("#hidden_myPlan").slideToggle('fast');
			show_myPlan();
			$("#hidden_favMap").slideUp('fast');
			$("#show_favMap").find(".menu_te").text("▼");
			$("#hidden_favPlace").slideUp('fast');
			$("#show_favPlace").find(".menu_te").text("▼");
		});

		$("#openNavi").click(function() {
		    if(infowindow != null){
				infowindow.close();
		  	}
			$("#navDiv").fadeIn("fast");
			$("#header").fadeOut("fast");
			$("#bottomDiv").hide();
		});

		$("#closeNavi").click(function() {
		    if(infowindow != null){
				infowindow.close();
	  		}
		    $("#navDiv").fadeOut("fast");
			$("#header").fadeIn("fast");
			$("#bottomDiv").show();
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
		
		$(".btnx").click(function() {
		    $("#lpop").hide();
		});
		
		$("#bottomDiv").hide();
		
	});
	
	function show_favMap(){
	    var hidden_favMap_text = $("#show_favMap").find(".menu_te").text();

		if (hidden_favMap_text == "▼") {
			$("#show_favMap").find(".menu_te").text("▲");
		} else {
			$("#show_favMap").find(".menu_te").text("▼");
		}
	}
	function show_favPlace(){
	    var show_favPlace_text = $("#show_favPlace").find(".menu_te").text();

		if (show_favPlace_text == "▼") {
			$("#show_favPlace").find(".menu_te").text("▲");
		} else {
			$("#show_favPlace").find(".menu_te").text("▼");
		}
	}
	function show_myPlan(){
	    var show_myPlan_text = $("#show_myPlan").find(".menu_te").text();

		if (show_myPlan_text == "▼") {
			$("#show_myPlan").find(".menu_te").text("▲");
		} else {
			$("#show_myPlan").find(".menu_te").text("▼");
		}
	}

	function get_map(latitude, longitude) {
	    tmap = new Tmap.Map({div:'map_div', width:'0px', height:'0px'});
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
 		var listener3 = google.maps.event.addListener(map, 'click', function(mouseEvent){
 		    $("#navDiv").fadeOut("fast");
		 	$("#header").fadeIn("fast"); 
			if(infowindow != null){
				  infowindow.close();
			  }
			  
			infowindow = new google.maps.InfoWindow({
				  content: '<a href="javascript:startSpot('+mouseEvent.latLng.lat()+','+mouseEvent.latLng.lng()
					    +')"><img src="http://openmap2.tmap.co.kr/start.png"/></a>&nbsp;&nbsp;&nbsp;<a href="javascript:endSpot('+mouseEvent.latLng.lat()+','+mouseEvent.latLng.lng()
						+')"><img src="http://openmap2.tmap.co.kr/arrival.png"/></a>&nbsp;&nbsp;&nbsp;<br/>'+"출발/도착을 선택하세요"
			});
			
			  var center = new google.maps.LatLng(mouseEvent.latLng.lat().toFixed(7), mouseEvent.latLng.lng().toFixed(7));
			  infowindow.setPosition(center);
			  infowindow.open(map, this);
		  });  
 		var listener4 = google.maps.event.addListener(map, 'drag', function(){
 		   if(infowindow != null){
			  infowindow.close();
		  }
 		});
	}

	window.onload=function(){
	    //위치정보를 확인할 수 있는 브라우저인지 확인
	    if(navigator.geolocation == undefined){
	        alert("위치 정보 기능을 지원하지 않습니다!")
	        return;
	    }
	    
	    navigator.geolocation.getCurrentPosition(success, fail);
	 }
	function success(position) { //성공시
	    log("위치정보 확인 성공!");
	    /* for(var property in position.coords) { //반복문 돌면서 출력
	        log("Key 값:"+property+" 정보:"+position.coords[property]);
	    } */
	    var lat=position.coords["latitude"];
	    var lon=position.coords["longitude"];
	    get_map(lat, lon);
	 }
	//실패시
 function fail(err){
    switch (err.code){
        case err.PERMISSION_DENIED:
            msg = "사용자 거부";
        break;
 
        case err.PERMISSION_UNAVAILABLE:
            msg = "지리정보를 얻을 수 없음";
        break;
 
        case err.TIMEOUT:
            msg = "시간초과";
        break;
 
        case err.UNKNOWN_ERROR:
            msg = "알 수 없는 오류 발생";
        break;
    }
        log(msg);
 }
 function log(msg){
    get_map("37.5664101", "126.9783282");
  }
 
 function resetFindRoad(){
     if(startLocation != null || endLocation != null){
	     lineReset();
	     startLocation = null;
	     endLocation = null;
	     startMarker.setMap(null); 
	 	 endMarker.setMap(null);
	 	 $("#bottomDiv").hide();
	 	 $("#navDiv").fadeOut("fast");
	 	 $("#header").fadeIn("fast");
	 	 if(infowindow != null){
			  infowindow.close();
		 }
     }
 }
 
//기존 길찾기 라인 삭제
	function lineReset(){
		$('#addinfo').children().remove();			// 길찾기 정보 리셋
		for(var i=0; i<flightPaths.length; i++)		// 자동차 라인 리셋
			  flightPaths[i].setMap(null);
		if(directionsDisplay!=null)					// 교통수단 라인 리셋
			directionsDisplay.setMap(null);
		for(var i=0; i<flightPathsWalk.length; i++)	// 도보 라인 리셋
			flightPathsWalk[i].setMap(null);
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
			console.log(data);
		    	$('.btn_slide_close').click();
/* 		    	var center = new google.maps.LatLng(data[0][0].lat, data[0][0].lon);
		        map.setCenter(center);
		        map.setZoom(15); */
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

var curMarker;
var checkLat
var checkLon;
var checkaccuracy;
function returnCurPosition(lat, lon, accuracy){
    if(lat == 0 || lon == 0){
		alert('GPS가 꺼져있거나 단말기와 GPS 수신 연동중입니다.');
		return;
    }
    if(curMarker != null){
		curMarker.setMap(null);
    }
    var center = new google.maps.LatLng(lat, lon);
    map.setCenter(center);
    map.setZoom(15);
	curMarker  = new google.maps.Marker({
	    position: center,
		map: map,
		center : center,
		accuracy : accuracy
	});
	
	var listener1 = google.maps.event.addListener(curMarker, 'click', function() {
			if(confirm("체크 포인트로 저장하시겠습니까?")){
/* 			    var setTitle = prompt("제목을 입력하세요");
			    var setContent = prompt("내용을 입력하세요"); */
			    document.lpopform.title.value="";
				document.lpopform.content.value="";
			    $(".lpop").show();
			    
			    checkLat = this.position.lat().toFixed(7);
			    checkLon = this.position.lng().toFixed(7);
			    checkaccuracy = this.accuracy;  
			}
	});	
}

function regCheckpoint(){
    
	    $.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/m/setCheckpoint.do',
		    dataType : 'json',
		    data : {
				setTitle : $('#checktitle').val(),
				setContent : $('#checkcontent').val(),
				lat : checkLat,
				lon : checkLon,
				accuracy : checkaccuracy
		    },
		    success: function(data) {
				alert(data);
				$("#lpop").hide();
	    }
	});  
    
}

</script>


<script type="text/javascript">

/* 자동차 길찾기 */

	var first, second;					// 길찾기 첫번째, 두번째 좌표
	var startMarker, endMarker;			// 길찾기 시작마커, 도착마커
	var startMarkers = [];
	var endMarkers = [];				// 도착 좌표
	var startLocation, endLocation;		// 길찾기 시작좌표, 도착좌표
	
	function startSpot(lat, lng){
	    startLocation = {lat:lat,lng:lng};
	    if(infowindow != null){
			infowindow.close();
	    }
		if(startMarker != null){
		    startMarker.setMap(null);
		}
		startMarker = new google.maps.Marker({
			position : startLocation,
			icon : 'http://openmap2.tmap.co.kr/start.png',
			map : map
		});
		var listenerStartMarker = google.maps.event.addListener(startMarker, 'click', function(){
			if(confirm('길찾기를 종료하시겠습니까?')){
			    resetFindRoad();
			}
		});
		if(startLocation != null && endLocation != null){
		    $("#navDiv").fadeIn("fast");
			$("#header").fadeOut("fast");
		    if($('#tab1').css("background-color") == 'rgb(85, 164, 37)'){
				searchRoute(startLocation, endLocation);
		    }
		    if($('#tab2').css("background-color") == 'rgb(85, 164, 37)'){
				calculateAndDisplayRoute();
		    }
		    if($('#tab3').css("background-color") == 'rgb(85, 164, 37)'){
				searchRouteWalking(startLocation, endLocation);
	    	}
		}
	}
	
	function endSpot(lat, lng){
	    endLocation = {lat:lat,lng:lng};
	    if(infowindow != null){
			infowindow.close();
   		}
		if(endMarker != null){
		    endMarker.setMap(null);
		}
		endMarker = new google.maps.Marker({
			position : endLocation,
			icon : 'http://openmap2.tmap.co.kr/arrival.png',
			map : map
		});
		var listenerEndMarker = google.maps.event.addListener(endMarker, 'click', function(){
			if(confirm('길찾기를 종료하시겠습니까?')){
			    resetFindRoad();
			}
		});
		if(startLocation != null && endLocation != null){
		    $("#navDiv").fadeIn("fast");
			$("#header").fadeOut("fast");
			if($('#tab1').css("background-color") == 'rgb(85, 164, 37)'){
				searchRoute(startLocation, endLocation);
		    }
		    if($('#tab2').css("background-color") == 'rgb(85, 164, 37)'){
				calculateAndDisplayRoute();
		    }
		    if($('#tab3').css("background-color") == 'rgb(85, 164, 37)'){
				searchRouteWalking(startLocation, endLocation);
	    	}
		}
	}
	
	function searchRoute(latlng1, latlng2) {
		lineReset();
		
		var routeFormat = new Tmap.Format.KML({
			extractStyles : true,
			extractAttributes : true
		});
		
		var lonlat1 = googleToTmap(new Tmap.LonLat(latlng1.lng, latlng1.lat));
		var lonlat2 = googleToTmap(new Tmap.LonLat(latlng2.lng, latlng2.lat));
		
		var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml";
		urlStr += "&startX=" + lonlat1.lon;
		urlStr += "&startY=" + lonlat1.lat;
		urlStr += "&endX=" + lonlat2.lon;
		urlStr += "&endY=" + lonlat2.lat;
		urlStr += "&appKey=bac4f916-3297-3be4-93ff-e37ae88b8f42";
		var prtcl = new Tmap.Protocol.HTTP({
			url : urlStr,
			format : routeFormat
		}); 
		routeLayer = new Tmap.Layer.Vector("route", {
			protocol : prtcl,
			strategies : [ new Tmap.Strategy.Fixed() ]
		});  

		routeLayer.events.register("featuresadded", routeLayer, getLoad);
		tmap.addLayer(routeLayer);
	}
	
	function findLoadAgain(){
		lineReset();
		searchRoute(startLocation, endLocation);
	}
</script>

<script type="text/javascript">

/* 도보 길찾기 */
 
 	function forWalk(){
		lineReset();
		searchRouteWalking(startLocation, endLocation);
	}
 
	function searchRouteWalking(latlng1, latlng2) {
		lineReset();
		
		var routeFormat = new Tmap.Format.KML({
			extractStyles : true,
			extractAttributes : true
		});
		 
		var lonlat1 = googleToTmap(new Tmap.LonLat(latlng1.lng, latlng1.lat));
		var lonlat2 = googleToTmap(new Tmap.LonLat(latlng2.lng, latlng2.lat));
		
		var startName = "출발";
	    var endName = "도착";
	    
		var urlStr = "https://apis.skplanetx.com/tmap/routes/pedestrian?version=1&format=xml";
		urlStr += "&startX=" + lonlat1.lon;
		urlStr += "&startY=" + lonlat1.lat;
		urlStr += "&endX=" + lonlat2.lon;
		urlStr += "&endY=" + lonlat2.lat;
		urlStr += "&startName="+encodeURIComponent(startName);
        urlStr += "&endName="+encodeURIComponent(endName);
		urlStr += "&appKey=bac4f916-3297-3be4-93ff-e37ae88b8f42";
		var prtcl = new Tmap.Protocol.HTTP({
			url : urlStr,
			format : routeFormat
		}); 
		routeLayerWalk = new Tmap.Layer.Vector("route", {
			protocol : prtcl,
			strategies : [ new Tmap.Strategy.Fixed() ]
		});  

		routeLayerWalk.events.register("featuresadded", routeLayerWalk, getLoadWalk);
		tmap.addLayer(routeLayerWalk);
	} 
	

</script>

<script type="text/javascript">

/* 대중교통 길찾기 */

	var directionsDisplay;
	var directionsService;
	
	function calculateAndDisplayRoute() {
		lineReset();
		directionsDisplay = new google.maps.DirectionsRenderer;
		directionsService = new google.maps.DirectionsService;		
		
		var selectedMode = "TRANSIT";
		directionsService.route({
			origin : startLocation,
			destination : endLocation, 
			travelMode : google.maps.TravelMode[selectedMode]
		}, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
				console.log(directionsDisplay);
				console.log(response);
			} else {
				window.alert('Directions request failed due to ' + status);
			}
		});
		directionsDisplay.setMap(map);
		 directionsDisplay.setPanel(document.getElementById('addinfo'));
	}

</script>

<script type="text/javascript">

//자동차 길찾기 좌표 포맷
function getLoad(e){
	$('#addinfo').children().remove();
	for(var i=0; i<routeLayer.features.length; i++){
		if(routeLayer.features[i].attributes.turnType == "200"){
/*출발*/		$('#addinfo').append('<div class="InfoAppend"><mark style="background:yellow">'+((routeLayer.features[i].attributes.totalDistance)/1000).toFixed(1)+'km. 약 '+((routeLayer.features[i].attributes.totalTime)/60).toFixed(0)+'분</mark></div>');
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:22px;text-align:center;position:absolute;"><img src="http://openmap2.tmap.co.kr/start.png" /></span><span style="margin-left:30px"> '+routeLayer.features[i].attributes.description+'</span></div>');
/*도착*/		} else if(routeLayer.features[i].attributes.turnType == "201"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:22px;text-align:center;position:absolute;"><img src="http://openmap2.tmap.co.kr/arrival.png"/></span><span style="margin-left:30px"> '+routeLayer.features[i].attributes.description+'</span></div>');				
/*좌회전*/	} else if(routeLayer.features[i].attributes.turnType == "12" || routeLayer.features[i].attributes.turnType == "16" || routeLayer.features[i].attributes.turnType == "17"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/left.PNG" /></span><span style="margin-left:30px">'+routeLayer.features[i].attributes.description+'</span></div>');				
/*우회전*/	} else if(routeLayer.features[i].attributes.turnType == "13" || routeLayer.features[i].attributes.turnType == "18" || routeLayer.features[i].attributes.turnType == "19"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/right.PNG" /></span><span style="margin-left:30px">'+routeLayer.features[i].attributes.description+'</span></div>');				
/*유턴*/		} else if(routeLayer.features[i].attributes.turnType == "14"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/uturn.PNG"/></span><span style="margin-left:30px">'+routeLayer.features[i].attributes.description+'</span></div>');				
/*직진*/		} else if(routeLayer.features[i].attributes.turnType == "11" || routeLayer.features[i].attributes.turnType == "51"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/go.PNG"/></span><span style="margin-left:30px">'+routeLayer.features[i].attributes.description+'</span></div>');				
/*그외*/		} else {
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap01.png"/></span><span style="margin-left:30px">'+routeLayer.features[i].attributes.description+'</span></div>');
		}
	}
	
	for(var i=0; i<routeLayer.features.length; i++){
		if(routeLayer.features[i].geometry.components == null){
			var xy = tmapToGoogle(new Tmap.LonLat(routeLayer.features[i].geometry.x, routeLayer.features[i].geometry.y));
			var x = xy.lat;
			var y = xy.lon;
			addLine(x,y,i);
		} else {
			for(var j=0; j<routeLayer.features[i].geometry.components.length; j++){
				var xy = tmapToGoogle(new Tmap.LonLat(routeLayer.features[i].geometry.components[j].x, routeLayer.features[i].geometry.components[j].y));
				var x = xy.lat;
				var y = xy.lon;
				addLine(x,y,i); 
			} 
		}
	}
}
	
// 도보 길찾기 좌표 포맷
function getLoadWalk(e){

	$('#addinfo').children().remove();
	for(var i=0; i<routeLayerWalk.features.length; i++){
		if(routeLayerWalk.features[i].attributes.turnType == "200"){
/*출발*/		$('#addinfo').append('<div class="InfoAppend"><mark style="background:yellow">'+((routeLayerWalk.features[i].attributes.totalDistance)/1000).toFixed(1)+'km. 약 '+((routeLayerWalk.features[i].attributes.totalTime)/60).toFixed(0)+'분</mark></div>');
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:22px;text-align:center;position:absolute;"><img src="http://openmap2.tmap.co.kr/start.png" /></span><span style="margin-left:30px"> '+routeLayerWalk.features[i].attributes.description+'</span></div>');
/*도착*/		} else if(routeLayerWalk.features[i].attributes.turnType == "201"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:22px;text-align:center;position:absolute;"><img src="http://openmap2.tmap.co.kr/arrival.png"/></span><span style="margin-left:30px"> '+routeLayerWalk.features[i].attributes.description+'</span></div>');				
/*좌회전*/	} else if(routeLayerWalk.features[i].attributes.turnType == "12" || routeLayerWalk.features[i].attributes.turnType == "16" || routeLayerWalk.features[i].attributes.turnType == "17"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/left.PNG" /></span><span style="margin-left:30px">'+routeLayerWalk.features[i].attributes.description+'</span></div>');				
/*우회전*/	} else if(routeLayerWalk.features[i].attributes.turnType == "13" || routeLayerWalk.features[i].attributes.turnType == "18" || routeLayerWalk.features[i].attributes.turnType == "19"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/right.PNG" /></span><span style="margin-left:30px">'+routeLayerWalk.features[i].attributes.description+'</span></div>');				
/*유턴*/		} else if(routeLayerWalk.features[i].attributes.turnType == "14"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/uturn.PNG"/></span><span style="margin-left:30px">'+routeLayerWalk.features[i].attributes.description+'</span></div>');				
/*직진*/		} else if(routeLayerWalk.features[i].attributes.turnType == "11"){
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/go.PNG"/></span><span style="margin-left:30px">'+routeLayerWalk.features[i].attributes.description+'</span></div>');				
/*그외*/		} else {
			$('#addinfo').append('<div class="InfoAppend"><span style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap03.png"/></span><span style="margin-left:30px">'+routeLayerWalk.features[i].attributes.description+'</span></div>');
		}
	}
	for(var i=0; i<routeLayerWalk.features.length; i++){
		if(routeLayerWalk.features[i].geometry.components == null){
			var xy = tmapToGoogle(new Tmap.LonLat(routeLayerWalk.features[i].geometry.x, routeLayerWalk.features[i].geometry.y));
			var x = xy.lat;
			var y = xy.lon;
			addLineWalk(x,y,i);
		} else {
			for(var j=0; j<routeLayerWalk.features[i].geometry.components.length; j++){
				var xy = tmapToGoogle(new Tmap.LonLat(routeLayerWalk.features[i].geometry.components[j].x, routeLayerWalk.features[i].geometry.components[j].y));
				var x = xy.lat;
				var y = xy.lon;
				addLineWalk(x,y,i); 
			} 
		}
	}
}
</script>
<script>
/*-----------------------세션에 아이디가 있는지 확인------------------------*/
var check;
function checkSession() {
	$.ajax({
		type : 'GET',
		url : '${ pageContext.request.contextPath }/checkSession.do',
		dataType : 'json',
		async : false,
		success : function(data) {
				check = data['checkSession'];
		}
	});
};

/*-----------------------페이지 onload 시 쿠키 확인------------------------*/
function checkAutoLoginCookie() {
	checkSession();
	
	if(check) {
		console.log('세션에 이미 로그인 되어있음');
	} else {
		console.log('쿠키 있는지 확인할게');
		if(Cookies.get('token') != null ) {
			console.log('쿠키 있음');
			
			var loginInfo = {
					'email' : null,
					'password' : null,
					'autoLogin' : null
			};
			var dataJSON = JSON.stringify(loginInfo);
			
    			$.ajax({
					type : 'POST',
					data : dataJSON,
					url : '${ pageContext.request.contextPath }/authenticate.do',
					contentType : 'application/json',
					dataType : 'json',
					success : (function() {
 							window.location.href = '${ pageContext.request.contextPath }/m/main.do';	
						})
				});	
		} else {
			console.log('쿠키 없음');
		}				
	}
}
</script>
<script>
	function goSearch() {
		location.href="${ pageContext.request.contextPath }/m/search.do";
	}
	function showLoginForm() {
		location.href="${ pageContext.request.contextPath }/m/login.do";
	}
	$(document).ready(function() {
		$("#noUser_show_favMap").click(function() {			
			showLoginForm();
		});
		$("#noUser_show_favPlace").click(function() {			
			showLoginForm();
		});
		$("#noUser_show_myPlan").click(function() {			
			showLoginForm();
		});		
	});	
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
				<a href="${ pageContext.request.contextPath }/m/main.do"><img src="${ pageContext.request.contextPath }/resources/images/mobile/logo.png" alt="로고"
					class="logo" style="height: 60px;" /></a>
			</h2>



		</header>
		<!--header_end-->

		<aside id="side_menu">

			<!-- 로그인 안되었을 때 -->
			<c:if test="${ empty sessionScope.user }">
				<div class="user_info">
					<div class="user_img" id="user_img">
						<a href="${pageContext.request.contextPath }/m/login.do"> <img src="${pageContext.request.contextPath }/resources/images/mobile/user_no_img.png"
							alt="유저이미지" />
						</a>
					</div>
					<div class="user_txt" style="vertical-align: middle;">
						<a href="${pageContext.request.contextPath }/m/login.do"><strong class="login_txt01">로그인을
								해주세요.</strong></a>
	
					</div>
				</div>
			</c:if>
			
			<!-- 로그인 되어있을 때 -->
			<c:if test="${ not empty sessionScope.user }">
				<div class="user_info">
					<div class="user_img" id="user_img">
            			<label>ID : ${ sessionScope.user } </label>
            			<br/>
            			<a href="${ pageContext.request.contextPath }/m/logout.do">로그아웃</a>
					</div>
				</div>
			</c:if>


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
						onclick=
							<c:if test='${ empty sessionScope.user }'>  "showLoginForm();" </c:if>
							<c:if test='${ not empty sessionScope.user }'>  "goSearch();" </c:if>
							/></li>

					<!-- 즐겨찾기한 지도 목록 보기 -->
					<li id=
							<c:if test='${ empty sessionScope.user }'>  "noUser_show_favMap" </c:if>
							<c:if test='${ not empty sessionScope.user }'>  "show_favMap" </c:if>
							>					

					<a href="#!"> <img
							src="${pageContext.request.contextPath }/resources/images/mobile/icon_menu2.png" alt="즐찾지도" /> <span>Map</span>
					</a> <span class="menu_te">▼</span></li>
					<li id="hidden_favMap">
						<div id="favMapList" style="width: 100%; max-height: 200px; overflow: hidden; overflow-y: auto;">
							<ul class="sub_depth01 clearfix">
								<c:forEach items="${ favMapList }" var="favMap">
									<li onclick="displayFavMap(${ favMap.idx });"><a><span style="text-align: left">⊙  ${ favMap.title }</span></a></li>
								</c:forEach> 
							</ul>
						</div>
					</li>

					<!-- 즐겨찾기한 장소 목록 보기 -->
					<li id=
							<c:if test='${ empty sessionScope.user }'>  "noUser_show_favPlace" </c:if>
							<c:if test='${ not empty sessionScope.user }'>  "show_favPlace" </c:if>
					>
					<a href="#!"> <img
							src="${pageContext.request.contextPath }/resources/images/mobile/icon_menu3.png" alt="즐찾장소" /> <span>Place</span>
					</a> <span class="menu_te">▼</span></li>
					<li id="hidden_favPlace">
						<div id="favPlaceList"
							style="width: 100%; max-height: 200px; overflow: hidden; overflow-y: auto;">
							<ul class="sub_depth01 clearfix">
								<c:forEach items="${ favPlaceList }" var="favPlace">
									<li onclick="displayFavPlace(${ favPlace.checkpointidx });"><a><span style="text-align: left">⊙  ${ favPlace.placename }</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</li>

					<!-- 내 여행계획 보기 -->
					<li id=
							<c:if test='${ empty sessionScope.user }'>  "noUser_show_myPlan" </c:if>
							<c:if test='${ not empty sessionScope.user }'>  "show_myPlan" </c:if>
					>
					<a href="#!"> <img src="${pageContext.request.contextPath }/resources/images/mobile/icon_menu1.png" alt="내계획" /> <span>My Plan</span>
					</a> <span class="menu_te">▼</span></li>
					<li id="hidden_myPlan">
						<div id="myPlanList"
							style="width: 100%; max-height: 200px; overflow: hidden; overflow-y: auto;">
							<ul class="sub_depth01 clearfix">
								<c:forEach items="${ myPlanList }" var="myPlan">
									<li onclick="displayMyPlan(${ myPlan.idx });"><a><span style="text-align: left">⊙  ${ myPlan.title }</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</li>





				</ul>
				<c:if test="${ not empty sessionScope.user }">
					<div class="register_btn">
						<label for="agree01" class="ios_check"><input
							type="checkbox" id="agree01" class="ios-switch green  bigswitch"><span><span></span></span>
							<span class="t_xt">실시간 기록</span> </label>
					</div>
				</c:if>

			</nav>
			<a href="#!" class="btn_slide_close"><img
				src="${pageContext.request.contextPath }/resources/images/mobile/btn_slide_close.png" alt="메뉴 닫기" /></a>
		</aside>


		<div style="" id="navDiv">
			<div id="closeNavi" class="btnNavi"
				style="width: 100%; height: 10px; font-weight: bold; background-color: white; padding-top: 3px;">
				<div style="width: 100%; display: inline-block; text-align: center">▼
				</div>
			</div>
			<div class="coupon_tab_btn">
				<span class="tab_btn tab01 active" id="tab1"> <a href="javascript:findLoadAgain()">
					<img src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap01.png"/>자가용</a>
				</span> 
				<span class="tab_btn tab02" id="tab2"> <a href="javascript:calculateAndDisplayRoute()">
					<img src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap02.png"/>대중교통</a>
				</span> 
				<span class="tab_btn tab03" id="tab3"> <a href="javascript:forWalk()">
					<img src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap03.png"/>도보</a>
				</span>


			</div>

			<div style="width: 100%; overflow: hidden; overflow-y: auto; height: 83%;">

				<ul class="foot_depth01 clearfix" id="addinfo"></ul>

			</div>


		</div>




		<section id="container" style="height: 89%; padding: 0;">
			<div id="map" style="width: 100%; height: 100%; position:absolute;"></div>
				<div id=location><a href="javascript:getCurPorition()"><img src="${pageContext.request.contextPath }/resources/images/location.png"/></a></div>
				<div id=camera><a href="javascript:takepicture()"><img src="${pageContext.request.contextPath }/resources/images/camera.png"/></a></div>




			<div id="bottomDiv" class="btnNavi"
				style="width: 100%; height: 20px; bottom: 0px; font-size: 20px; font-weight: bold; display: block; position: fixed; background-color: white; opacity: 0.8;">

				<div style="width: 100%; display: inline-block; text-align: center" id="openNavi">▲</div>
			</div>



			<!-- footer -->


		</section>
		<!-- //container End -->



	</div>
	<!--wrap_end-->
	<div id="map_div"></div>
	
	<form name="lpopform">
	<div class="lpop" id="lpop" style="background: white; border: 1px solid">
		<div class="btnx" style="text-align: right">×&nbsp;&nbsp;</div>
			<input type="text" name="title" id="checktitle" placeholder="여행제목" /><br/>
			<textarea rows="7" cols="24" name="content" id="checkcontent" placeholder="여행내용"></textarea><br/>
			<div style="text-align: right;">
				<input type="reset" value="다시쓰기"/>
				<input type="button" id="reg" onclick="javascript:regCheckpoint()" value="등록하기"/>
			</div>
		</div>
	</form>
</body>
</html>