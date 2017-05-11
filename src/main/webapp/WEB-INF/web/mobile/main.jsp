<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
}

nav {
	/* 색 */
	background-color: white !important;
	/* 위치 */
	margin: 20px !important;
	margin-right: 10% !important;
	margin-left: 10% !important;
	width: 80% !important;
	/* 지도위로 */
	position: absolute;
	z-index: 4000;
}

nav .input-field label i {
	color: rgba(0, 0, 0, 0.7) !important;
}

.input-field input[type=search] ~ .mdi-navigation-close, .input-field input[type=search] 
	 ~ .material-icons {
	color: rgba(0, 0, 0, 0.7) !important;
}

i.material-icons {
	
}

.zeroMargin {
	margin: 0px !important;
}
</style>
<title>Baljagook Main</title>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
<!-- icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- cookie -->
<script
	src="${pageContext.request.contextPath}/resources/js/js.cookie.js"></script>
<!-- google map API -->
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=bac4f916-3297-3be4-93ff-e37ae88b8f42"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6x6lwLmHlSpovbF0nM-fPIPpjfv4D9IM&libraries=places"></script>
<!-- <script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAF05JCFoefu9jROxjM8TcHc8GIR6YDhuU
      &callback=initMap">
</script> -->

<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/test.js"></script>
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
		


		$("#openNavi").click(function() {
		    if(infowindow != null){
				infowindow.close();
		  	}
		    $('#modal2').modal('open');
			$("#header").fadeOut("fast");
			$("#bottomDiv").hide();
		});

		$("#closeNavi").click(function() {
		    if(infowindow != null){
				infowindow.close();
	  		}
		    $('#modal2').modal('close');
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
		
		
		Android.sessionId('${id}');
		
	});

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
 		
 		var input = document.getElementById('pac-input');
		var searchBox = new google.maps.places.SearchBox(input);
		map.addListener('bounds_changed', function() {
			searchBox.setBounds(map.getBounds());
		});
		var markers = [];
		searchBox.addListener('places_changed', function() {
			var places = searchBox.getPlaces();

			if (places.length == 0) {
				return;
			}

			// Clear out the old markers.
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			markers = [];

			// For each place, get the icon, name and location.
			var bounds = new google.maps.LatLngBounds();
			places.forEach(function(place) {
				var icon = {
					url : "https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_1.png",
					size : new google.maps.Size(71, 71),
					origin : new google.maps.Point(0, 0),
					anchor : new google.maps.Point(17, 34)
				};

				// Create a marker for each place.
				markers.push(new google.maps.Marker({
					map : map,
					icon : icon,
					title : place.name,
					position : place.geometry.location
				}));
				
				if (place.geometry.viewport) {
					// Only geocodes have viewport.
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
			});
			map.fitBounds(bounds);
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
    var msg;
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
	 	 $('#modal2').modal('close');
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
			}
		    addLineMarker();
		 // 주소로 검색해서 마커 표시
		 initflightPath.setMap(map);
		 
			
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
    if('${id}' == null || '${id}' == ""){
		alert("로그인후 이용가능합니다.");
		return;
    }
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
function regCheck(){
	if(confirm("체크 포인트로 저장하시겠습니까?")){
		/* 			    var setTitle = prompt("제목을 입력하세요");
					    var setContent = prompt("내용을 입력하세요"); */
					    document.lpopform.title.value="";
						document.lpopform.content.value="";
					    $('#modal1').modal('open');
					    checkLat = this.position.lat().toFixed(7);
					    checkLon = this.position.lng().toFixed(7);
					    checkaccuracy = this.accuracy;  
					}
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
			 $('#modal2').modal('open');
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
			 $('#modal2').modal('open');
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
		if(routeLayer.features[i].geometry.components == null){
			var xy = tmapToGoogle(new Tmap.LonLat(routeLayer.features[i].geometry.x, routeLayer.features[i].geometry.y));
			var x = xy.lat;
			var y = xy.lon;
		}
		if(routeLayer.features[i].attributes.turnType == "200"){ 
/*출발*/		$('#addinfo').append('<div class="InfoAppend"><mark style="background:yellow">'+((routeLayer.features[i].attributes.totalDistance)/1000).toFixed(1)+'km. 약 '+((routeLayer.features[i].attributes.totalTime)/60).toFixed(0)+'분</mark></div>');
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:22px;text-align:center;position:absolute;"><img src="http://openmap2.tmap.co.kr/start.png" /></div><div style="margin-left:35px"> '+routeLayer.features[i].attributes.description+'</div></div><br>');
/*도착*/		} else if(routeLayer.features[i].attributes.turnType == "201"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:22px;text-align:center;position:absolute;"><img src="http://openmap2.tmap.co.kr/arrival.png"/></div><div style="margin-left:35px"> '+routeLayer.features[i].attributes.description+'</div></div><br>');				
/*좌회전*/	} else if(routeLayer.features[i].attributes.turnType == "12" || routeLayer.features[i].attributes.turnType == "16" || routeLayer.features[i].attributes.turnType == "17"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/left1.png"/></div><div style="margin-left:35px">'+routeLayer.features[i].attributes.description+'</div></div><br>');				
/*우회전*/	} else if(routeLayer.features[i].attributes.turnType == "13" || routeLayer.features[i].attributes.turnType == "18" || routeLayer.features[i].attributes.turnType == "19"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/right1.png"/></div><div style="margin-left:35px">'+routeLayer.features[i].attributes.description+'</div></div><br>');				
/*유턴*/		} else if(routeLayer.features[i].attributes.turnType == "14"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/uturn1.png"/></div><div style="margin-left:35px">'+routeLayer.features[i].attributes.description+'</div></div><br>');				
/*직진*/		} else if(routeLayer.features[i].attributes.turnType == "11" || routeLayer.features[i].attributes.turnType == "51"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/go1.png"/></div><div style="margin-left:35px">'+routeLayer.features[i].attributes.description+'</div></div><br>');				
/*그외*/		} /* else {
			$('#addinfo').append('<div class="InfoAppend"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${pageContext.request.contextPath }/resources/images/tap1.png"/></div><div style="margin-left:35px">'+routeLayer.features[i].attributes.description+'</div></div><br>');
		} */
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
		if(routeLayerWalk.features[i].geometry.components == null){
			var xy = tmapToGoogle(new Tmap.LonLat(routeLayerWalk.features[i].geometry.x, routeLayerWalk.features[i].geometry.y));
			var x = xy.lat;
			var y = xy.lon;
		}
		if(routeLayerWalk.features[i].attributes.turnType == "200"){
/*출발*/		$('#addinfo').append('<div class="InfoAppend"><mark style="background:yellow">'+((routeLayerWalk.features[i].attributes.totalDistance)/1000).toFixed(1)+'km. 약 '+((routeLayerWalk.features[i].attributes.totalTime)/60).toFixed(0)+'분</mark></div>');
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:22px;text-align:center;position:absolute;"><img src="http://openmap2.tmap.co.kr/start.png" /></div><div style="margin-left:35px"> '+routeLayerWalk.features[i].attributes.description+'</div></div><br>');
/*도착*/		} else if(routeLayerWalk.features[i].attributes.turnType == "201"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:22px;text-align:center;position:absolute;"><img src="http://openmap2.tmap.co.kr/arrival.png"/></div><div style="margin-left:35px"> '+routeLayerWalk.features[i].attributes.description+'</div></div><br>');				
/*좌회전*/	} else if(routeLayerWalk.features[i].attributes.turnType == "12" || routeLayerWalk.features[i].attributes.turnType == "16" || routeLayerWalk.features[i].attributes.turnType == "17"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/left1.png" /></div><div style="margin-left:35px">'+routeLayerWalk.features[i].attributes.description+'</div></div><br>');				
/*우회전*/	} else if(routeLayerWalk.features[i].attributes.turnType == "13" || routeLayerWalk.features[i].attributes.turnType == "18" || routeLayerWalk.features[i].attributes.turnType == "19"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/right1.png" /></div><div style="margin-left:35px">'+routeLayerWalk.features[i].attributes.description+'</div></div><br>');				
/*유턴*/		} else if(routeLayerWalk.features[i].attributes.turnType == "14"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/uturn1.png"/></div><div style="margin-left:35px">'+routeLayerWalk.features[i].attributes.description+'</div></div><br>');				
/*직진*/		} else if(routeLayerWalk.features[i].attributes.turnType == "11"){
			$('#addinfo').append('<div class="InfoAppend" onclick="javascript:loadpointspot('+Number(x.toFixed(7).toString())+','+Number(y.toFixed(7).toString())+')"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${ pageContext.request.contextPath }/resources/images/go1.png"/></div><div style="margin-left:35px">'+routeLayerWalk.features[i].attributes.description+'</div></div><br>');				
/*그외*/		} /* else {
			$('#addinfo').append('<div class="InfoAppend"><div style="float:right;margin-right:25px;width:30px;text-align:center;position:absolute;"><img src="${pageContext.request.contextPath }/resources/images/tap3.png"/></div><div style="margin-left:35px">'+routeLayerWalk.features[i].attributes.description+'</div></div><br>');
		} */
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
		location.href = "${ pageContext.request.contextPath }/map/search.do?searchtext="+$('#searchtext').val();
	}
	function showLoginForm() {
		location.href="${ pageContext.request.contextPath }/m/login.do";
	}
</script>

<!--  -->
<script type="text/javascript">
	var map;

	$(function() {
		$(".button-collapse").sideNav();
	});

	$(function() {
		$('.collapsible').collapsible();
	});

	$(function() {
		// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
		$('.modal').modal();
	});
	 $(function() {
		    $('input#checktitle, textarea#checkcontent').characterCounter();
		  });
</script>
</head>
<body>
	<nav>
		<div class="nav-wrapper">
			<form name="inputform">
				<div class="input-field">
					<input id="pac-input" type="search" placeholder="Search Box"
						required> <label class="label-icon" for="search"><a
						href="#" data-activates="mobile-demo" class="button-collapse"><i
							class="material-icons">menu</i></a></label> <i class="material-icons">search</i>
				</div>
			</form>
		</div>
	</nav>

	<ul id="mobile-demo" class="side-nav collapsible"
		data-collapsible="accordion" style="width: 80%; z-index: 9999;">
		<li><div class="userView">
				<div class="background">
					<!-- <img src="https://chart.apis.google.com/chart?cht=it&chs=42x42&chco=FC0000%2c000000ff%2cffffff01&chl=101&chx=FFFFFF,20&chf=bg,s,00000000&ext=.png">-->
				</div>

				<!-- 로그인 안되었을 때 -->
				<c:if test="${ empty sessionScope.user }">
					<a href="${pageContext.request.contextPath }/m/login.do"><img
						class="circle" style="border: solid; background-color: #e1e1e1;"
						src="${pageContext.request.contextPath }/resources/images/mobile/user_no_img.png"></a>
					<a href="#!name"><span class="name" style="color: black;">로그인
							해주세요</span></a>
				</c:if>
				<!-- 로그인 되어있을 때 -->
				<c:if test="${ not empty sessionScope.user }">
					<a href="#!user"><img class="circle"
						style="border: solid; background-color: #e1e1e1;"
						src="${pageContext.request.contextPath}/resources/photo/profileImage/defaultImage.png"></a>
					<a href="#!name"><span class="name" style="color: black;">${ sessionScope.user }</span></a>
					<a href="${ pageContext.request.contextPath }/m/logout.do">로그아웃</a>
				</c:if>
			</div></li>
		<li><div class="divider"></div></li>
		<li>
			<form action="${pageContext.request.contextPath }/map/search.do"
				method="get">
				<input type="text" class="form-control" placeholder="          Map Search"
					id="searchtext" style="margin-top: 13px; margin-bottom: 2px;"
					onKeyPress="if (event.keyCode==13){ goSearch();event.returnValue=false}"><i
					class="material-icons"
					style="position: absolute; right: 13px; top: 136px; font-size: 42px;">search</i>
			</form>
		</li>
		<li><div class="divider"></div></li>
		<li>
			<div class="collapsible-header">
				<i class="material-icons">view_quilt</i>My Map
			</div>
			<div class="collapsible-body">
				<c:forEach items="${ myMapList }" var="myMap">
					<a onclick="displayMyPlan(${ myMap.idx });"><span
						style="text-align: left">⊙ ${ myMap.title }</span></a>
					<br />
				</c:forEach>
			</div>
		</li>
		<li><div class="divider zeroMargin"></div></li>
		<li>
			<div class="collapsible-header">
				<i class="material-icons">today</i>My Plan
			</div>
			<div class="collapsible-body">
				<c:forEach items="${ myPlanList }" var="myPlan">
					<a onclick="displayMyPlan(${ myPlan.idx });"><span
						style="text-align: left">⊙ ${ myPlan.title }</span></a>
					<br />
				</c:forEach>
			</div>
		</li>
		<li><div class="divider zeroMargin"></div></li>
		<li>
			<div class="collapsible-header">
				<i class="material-icons">star</i>Favorites
			</div>
			<div class="collapsible-body">
				<c:forEach items="${ favMapList }" var="favMap">
					<a onclick="displayFavMap(${ favMap.idx });"><span
						style="text-align: left">⊙ ${ favMap.title }</span></a>
					<br />
				</c:forEach>
			</div>
		</li>
		<li><div class="divider zeroMargin"></div></li>
		<li>
			<div class="collapsible-header">
				<i class="material-icons">location_on</i>Place
			</div>
			<div class="collapsible-body">
				<c:forEach items="${ favPlaceList }" var="favPlace">
					<a onclick="displayFavPlace(${ favPlace.checkpointidx });"><span
						style="text-align: left">⊙ ${ favPlace.placename }</span></a>
					<br />
				</c:forEach>
			</div>
		</li>
		<li><div class="divider zeroMargin"></div></li>

		<!-- Switch -->
		<c:if test="${ not empty sessionScope.user }">
			<div>
				실시간 기록
				<li class="switch"><label> Off <input type="checkbox"
						id="agree01"> <span class="lever"></span> On
				</label></li>
			</div>
		</c:if>
	</ul>

	<div id="map"></div>
	<div id="map_div"></div>

	<div class="fixed-action-btn horizontal click-to-toggle">
		<a class="btn-floating btn-large white"
			href="javascript:getCurPorition()"> <i class="material-icons"
			style="color: #0480da;">my_location</i>
		</a>
		<ul>
			<li><a class="btn-floating blue" href="javascript:regCheck()"><i
					class="material-icons">done</i></a></li>
			<li><a class="btn-floating gray" href="javascript:takepicture()"><i
					class="material-icons">perm_camera_mic</i></a></li>
		</ul>
	</div>

	<!-- Modal Structure1 -->
	<div id="modal1" class="modal" style="z-index: 9999">
		<form name="lpopform">
			<div class="modal-content">
				<div class="row">
					<div class="input-field">
						<input name="title" id="checktitle" type="text" data-length="20">
						<label for="input_text">여행제목</label>
					</div>
					<div class="row">
						<div class="input-field">
							<textarea name="content" id="checkcontent"
								class="materialize-textarea" data-length="120"></textarea>
							<label for="textarea1">여행내용</label>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#!" onclick="javascript:regCheckpoint()"
					class="modal-action modal-close waves-effect waves-green btn-flat">등록하기</a>
				<a href="#!"
					class="modal-action modal-close waves-effect waves-green btn-flat">취소</a>
			</div>

		</form>
	</div>

	<!-- Modal Structure2 -->
	<div id="modal2" class="modal bottom-sheet">
		<div class="modal-content row">
			<br /> <a class="waves-effect waves-light col-sm-4"
				href="javascript:findLoadAgain()"><img
				src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap01.png" /></a>
			<a class="waves-effect waves-light col-sm-4"
				href="javascript:calculateAndDisplayRoute()"><img
				src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap02.png" /></a>
			<a class="waves-effect waves-light col-sm-4"
				href="javascript:forWalk()"><img
				src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap03.png" /></a>
		</div>
		<div class="modal-footer"
			style="width: 100%; overflow: hidden; overflow-y: auto; height: 83%;">
			<ul class="foot_depth01 clearfix" id="addinfo"></ul>
		</div>
	</div>
</body>
</html>