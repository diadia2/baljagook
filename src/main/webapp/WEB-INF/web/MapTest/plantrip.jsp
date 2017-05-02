<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share2.jsp" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<style>
/* 화면 체우기 */
html, body {
	height: 100%;
}

#sb-site {
	height: 100% !important;
}

#page-content-wrapper {
	height: 100% !important;
	padding-top: 0px !important;
}

#page-wrapper {
	height: 100% !important;
}

#page-content {
	height: 100% !important;
	margin-left: 0px !important;
	margin-right: 0px !important;
	padding: 0px !important;
}
/* 판넬헤더 클릭 드래그 */
/* #draggablePanelList .panel-heading {
	cursor: move;
} */
/* 숫자 원 */
.circleNum {
	width: 20px;
	height: 20px;
	border-radius: 100%;
	-webkit-border-radius: 100%;
	-moz-border-radius: 100%;
	background: #FD2604;
	color: #FFF;
	text-align: center;
	font-size: 12px;
	line-height: 20px;
	-webkit-flex: none;
	flex: none;
	margin-right: 7px;
}
/* 판넬 내부 배치 */
.dd-handle {
	display: flex !important;
	margin-bottom: 15px !important;
}

.dd-handle:HOVER {
	box-shadow: 0 6px 10px rgba(0, 0, 0, .23), 0 10px 30px
		rgba(0, 0, 0, .19);
}

#addTimeInfo {
	margin: 0px;
	border: 0px;
}

/* 페이지 메뉴바 왼쪽으로 줄이기 */
#page-header {
	width: 25%;
	left: 75%;
	margin-left: 15px;
}
/* 검색바 숨기기 */
#header-nav-left {
	margin-right: 5%;
}
.input-group {
	display: none;
}
</style>
<style type="text/css">
/* 길찾기 부분 추가 */
/* 서브 메뉴 관련 추가 부분 */
.foot_depth01 {
	padding: 0 4%;
}
/*.sub_depth01 > li{ float: left; width: 33.33%; border-right:1px solid #36c4d4; border-bottom:1px solid #36c4d4; box-sizing: border-box;  }*/
.foot_depth01>li {
	float: left;
	width: 100%;
	border-bottom: 1px solid #36c4d4;
	box-sizing: border-box;
}

.foot_depth01>li.right_n {
	border-right: 1px solid #00b4c9;
}

.foot_depth01>li.bottom_n {
	border-bottom: 1px solid #00b4c9;
}

.foot_depth01>li:first-child {
	border-top: 0;
}

.foot_depth01>li>a {
	position: relative;
	display: inline-block;
	padding: 12% 0;
	width: 100%;
}

.foot_depth01>li>a img {
	width: 40px;
	position: absolute;
	top: 20%;
	left: 0px;
}

.foot_depth01>li>.menu_rg {
	width: 40px;
	position: absolute;
	top: 20%;
	left: 0px;
	position: relative;
	display: inline-block;
	padding: 6% 0 0 0;
	float: right;
}

.foot_depth01>li>.menu_te {
	width: 40px;
	position: absolute;
	top: 20%;
	left: 0px;
	position: relative;
	display: inline-block;
	padding: 6% 3% 0 0;
	float: right;
	font-size: 30px;
	text-align: right;
	color: #fff;
	cursor: pointer;
}

.foot_depth01>li>a span {
	position: absolute;
	top: 45%;
	left: 0;
	font-size: 1.0em;
	display: block;
	width: 100%;
	text-align: center;
	font-weight: bold;
}

.foot_depth01>li.under {
	border-top: 1px solid #36c4d4;
	border-bottom: 1px dashed #fff;
}

.foot_depth01>li.under>a img {
	width: 40px;
	top: 12%;
	left: 50%;
	margin-left: -20px;
}

.foot_depth01>li.under>a span {
	top: 70%;
	left: 0;
}

.foot_depth01>li>ul.depth02 {
	display: none;
}

.foot_depth01>li>ul.depth02>li {
	border-bottom: 1px solid #3b72bc;
	background-color: #295599;
}

.foot_depth01>li>ul.depth02>li>a {
	vertical-align: middle;
	display: block;
	line-height: 34px;
	color: #fff;
	padding: 0 18px;
}

.foot_depth01>li>ul.depth02>li>a img {
	width: 30px;
	vertical-align: middle;
}

.foot_depth01>div {
	float: left;
	border-bottom: 1px solid grey;
	box-sizing: border-box;
	position: relative;
	display: inline-block;
	padding: 7% 0;
	width: 100%;
}

.foot_depth01>div:first-child {
	padding: 3% 0;
}

/* float */
.clearfix {
	*zoom: 1;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title>Plan Trip</title>

<!-- datepicker -->
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
<!-- tab -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/tabs-ui/tabs.js"></script>
<script type="text/javascript">
	/* jQuery UI Tabs */
	$(function() {
		"use strict";
		$(".tabs").tabs();
	});
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/tabs/tabs.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/tabs/tabs-responsive.js"></script>

<!-- map API -->
<!-- <script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAF05JCFoefu9jROxjM8TcHc8GIR6YDhuU
      &callback=initMap"></script> -->
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=bac4f916-3297-3be4-93ff-e37ae88b8f42"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6x6lwLmHlSpovbF0nM-fPIPpjfv4D9IM&libraries=places"></script>
<!-- 판넬 드래그 API -->
<!-- <script type='text/javascript'
	src="https://code.jquery.com/ui/1.10.1/jquery-ui.js"></script> -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/interactions-ui/resizable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/interactions-ui/draggable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/interactions-ui/sortable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/interactions-ui/selectable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/nestable/nestable.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/widgets/nestable/nestable-demo.js"></script> --%>

<!--  -->
<script type="text/javascript">
	$(window).load(function() {
		setTimeout(function() {
			$('#loading').fadeOut(400, "linear");
		}, 300);
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var form = document.inputform;
	
	$(".coupon_tab_btn span").click(function() {
		$(".coupon_tab_btn span").each(function() {
			$(this).removeClass("active");
		});

		$(this).addClass("active");
	});
	
	$('#naviDiv').hide();
	
});

	var advlistLonLat = new Array();
	var advMarkers = new Array();
	
	<c:forEach items="${AdvertisementList}" var="AdvertisementList">
		advlistLonLat.push({lat:${AdvertisementList.lat},
				    	    lng:${AdvertisementList.lon},
				    	    oriname:'${AdvertisementList.oriname}',
				    	    newname:'${AdvertisementList.newname}',
				    	    name:'${AdvertisementList.name}',
				    	    detail:'${AdvertisementList.detail}'
				    	    });
	</c:forEach>
	var listLonLat = new Array();
    var initLonLat = listLonLat[listLonLat.length-1];
    var zoom = 13;
    
	var routeLayer, routeLayerWalk, tmap, map;
	var startX, startY, endX, endY;
	var first, second;					// 길찾기 첫번째, 두번째 좌표
	var startMarker, endMarker;			// 길찾기 시작마커, 도착마커
	var startMarkers = [];
	var endMarkers = [];				// 도착 좌표
	var startLocation = null; 
	var endLocation = null;		// 길찾기 시작좌표, 도착좌표
	var flightPaths = [];
	var flightPathsWalk = [];
	var extraMarker;
	var f = 0;
	var extraflag = 0;					// 마커 직접 추가 flag
	var divFlag = 0;
	var lineLocation = new Array();
	var lineLocationWalk = new Array();
	var change = true;
	
	var directionsDisplay;
	var directionsService;
	var center = {lat : 37.56461982743129, lng : 126.9823439963945};
	
	
	function initialize() {
		// 좌표 등록
		tmap = new Tmap.Map({div:'map_div', width:'0px', height:'0px'});
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : zoom,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			center : center,
			mapTypeControl: false,
			zoomControl: false,
			streetViewControl: false
		});
		
		openADV();
		
		if(listLonLat.length != 0){
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
			
			if(mymapLonLatList.length != 0){
				for(var i=0; i<mymapLonLatList.length; i++){    
					var mymapCoordinates = mymapLonLatList[i].mymapLonLat;
						var mymapPath = new google.maps.Polyline({
							path : mymapCoordinates,
							geodesic : true,
							strokeColor : '#0000FF',
							strokeOpacity : 1.0,
							strokeWeight : 3
						});
						mymapPath.setMap(null);
						mymapPath.setMap(map);
				}
			}
			
			var listener3 = google.maps.event.addListener(map, 'click', function(mouseEvent){
				  if(infowindow != null){
					  infowindow.close(); 
				  } 
				  if(divFlag == 1){
					  if(startLocation == null){
					      f=1;
					      var lat = mouseEvent.latLng.lat();
						  var lng = mouseEvent.latLng.lng();
						  var locationS = new Array();
					      locationS.push({lat:lat, lng:lng});
						  startSpot(locationS[0], map);
					  }  else if(endLocation == null){
					      f=2;
					      var lat = mouseEvent.latLng.lat();
						  var lng = mouseEvent.latLng.lng();
						  var locationE = new Array();
						  locationE.push({lat:lat, lng:lng});
						  endSpot(locationE[0], map);
						  divFlag = 0;
					  } else {
					      divFlag = 0;
					      $('#naviDiv').hide();
					  }
				  } else {
				  	  $('#naviDiv').hide();
				  }  
			}); 
			
			 /////////////////////		    
			if(mymapCheckpointList.length != 0){
				for(var i=0; i<mymapCheckpointList.length; i++){
				    for(var j=0; j<mymapCheckpointList[i].mymapCheckpoint.length; j++){
						console.log(mymapCheckpointList[i].mymapCheckpoint[j]);
							
						checkPointMarker.push(new google.maps.Marker({
					   	 	position: mymapCheckpointList[i].mymapCheckpoint[j],
					   	 	map: map,
							icon : "http://maps.google.com/mapfiles/kml/paddle/blu-circle-lv.png"
						}));

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
			}
			 
			var input = document.getElementById('pac-input');
			var searchBox = new google.maps.places.SearchBox(input);
			map.addListener('bounds_changed', function() {
				searchBox.setBounds(map.getBounds());
			});
			
			var listener3 = google.maps.event.addListener(map, 'click', function(){
				if(infowindow != null){
					  infowindow.close();
				  }
			  });
			
			 
			// 주소로 검색해서 마커 표시
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
			
			if(listLonLat.length != 0 && change == true){
				addTimeLine();	
			}
			change = true;
	}
	 
	// 타임라인 div 클릭시 센터좌표 이동
	function goZoomIn(lat, lng){
		var center = new google.maps.LatLng(lat, lng);
		map.setCenter(center);
	}
	
	function openADV(){
		if(advlistLonLat.length != 0){
		    advMarkers = [];    
    		for(var i=0; i<advlistLonLat.length; i++){
		        	advMarkers.push(new google.maps.Marker({
	                    map: map,
	                    icon : 'http://maps.google.com/mapfiles/kml/paddle/blu-circle.png',
	                    position: advlistLonLat[i],
	                    oriname: advlistLonLat[i].oriname,
	                    newname: advlistLonLat[i].newname,
	                    name: advlistLonLat[i].name,
	                    detail: advlistLonLat[i].detail
	                }));
		        	var listener0 = google.maps.event.addListener(advMarkers[i], 'click', function(){
			        	    if(infowindow != null){
						 		infowindow.close();
					  		}
			      			console.log(this);
				  			infowindow = new google.maps.InfoWindow({
					    		content: '<img src="${ pageContext.request.contextPath }/resources/advphoto/'+this.newname+'" width="200px" height="200px"/><br/>'+
					    			'업체명 : '+this.name+'<br/>'+'소개 : '+this.detail+'<br/><input type="button" onclick="javascript:hideAdv('+(this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+')" value=" 광고 숨기기 "/>'
					  }); 
				  			infowindow.open(map, this);
			 		}); 
	            }
        }
	}

	//타임라인에 내용 추가 
	var address;
	var count = 0;
	function addTimeLine(){
	    count = listLonLat.length-1;
//		$('#draggablePanelList').children().remove();
	    var geocoder = new google.maps.Geocoder;
		
		geocoder.geocode({'location': listLonLat[count]}, (function(count){return function(results, status) {
				if (status === google.maps.GeocoderStatus.OK) {
			        address = results[0].formatted_address;
			        address = address.substring(5, address.length);
					$('#draggablePanelList').append('<div id="addTimeInfo" class="panel panel-info" onClick="goZoomIn('+listLonLat[count].lat+", "+listLonLat[count].lng
						+')"><div class="panel-heading"><input class="form-control" type="text" style="font-size:8pt;" value="'+address
						+'"/></div><div class="panel-body"><textarea class="form-control" style="overflow:hidden" placeholder="내용"/></div></div>');
					
/* 					$('#draggablePanelList').append('<li class="dd-item" data-id="'+n+'" onClick="goZoomIn('+checkMarker[i].position.lat()+", "+checkMarker[i].position.lng()
						+')"><div class="dd-handle"><div class="circleNum">'+n+'</div>'+checkMarker[i].title+'</div></li>'); */
			    } 
			}
		})(count)
		);
	}    
	var checkMarker = new Array();
	var num;
	var infowindow;
	function addLineMarker(){
		
	    if(listLonLat.length == 0){
			return;
	    }
	    
		if(checkMarker != null){
			for(var i=0; i<checkMarker.length; i++){
				checkMarker[i].setMap(map);
			}
		} 
		for(var i=0; i<listLonLat.length; i++){
			
			num = i;
			
			checkMarker.push(new google.maps.Marker({
		    position: listLonLat[i],
		    map: map,
		    num :i
		
		}));
		  
		  var listener3 = google.maps.event.addListener(map, 'click', function(){
			if(infowindow != null){
				  infowindow.close();
			  }
		  });
		  var listener1 = google.maps.event.addListener(checkMarker[i], 'click', function(){
			  if(infowindow != null){
				  infowindow.close();
			  }
			 console.log($('#draggablePanelList').children());
			 $('#draggablePanelList').children().eq(this.num).children().eq(0).children().focus()
			  infowindow = new google.maps.InfoWindow({
				    content: (this.num+1)+". "+(this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+
				    '<br/><input type="button" value="출발설정" onClick="startCheck('+
				    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="도착설정" onClick="endCheck('+
				    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="위치삭제" onClick="removeSpot('+
				    		(this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+')"/>'
				  }); 
			  infowindow.open(map, this);
		  });  
		}
	}
	
	
	// 광고 마커 숨기기
	function hideAdv(lat, lng){
	    var index;
		
		for(var i=0; i<advlistLonLat.length; i++){
			if(advlistLonLat[i].lat == lat && advlistLonLat[i].lng == lng){
				index = i;
			}
		}
		advlistLonLat.splice(index,1);
		change = false;
		initialize();
	}
	
	// 마커 선택하여 위치삭제
	function removeSpot(lat, lng, timestamp){
		var index;
		
		for(var i=0; i<listLonLat.length; i++){
			if(listLonLat[i].lat == lat && listLonLat[i].lng == lng){
				index = i;
			}
		}
		listLonLat.splice(index,1);
		initLonLat = {lat:lat,lng:lng};
		zoom = map.getZoom();
 	  	$('.panel-heading').eq(index).parent().remove();
		change = false;
		initialize();	
	}
	
	function startCheck(lat, lng){
		var checkLonLat = new Array();
		checkLonLat.push({lat:lat, lng:lng});
		f=1;
		startSpot(checkLonLat[0],map);
		infowindow.close();
	}
	
	function endCheck(lat, lng){
		var checkLonLat = new Array();
		checkLonLat.push({lat:lat, lng:lng});
		f=2;
		endSpot(checkLonLat[0],map);
		infowindow.close();
	}
	
	// Tmap에서 자동차 길찾기 좌표 불러오기
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
	
	// 기존 길찾기 라인 삭제
	function lineReset(){
		$('#addinfo').children().remove();			// 길찾기 정보 리셋
		for(var i=0; i<flightPaths.length; i++)		// 자동차 라인 리셋
			  flightPaths[i].setMap(null);
		if(directionsDisplay!=null)					// 교통수단 라인 리셋
			directionsDisplay.setMap(null);
 		for(var i=0; i<flightPathsWalk.length; i++)	// 도보 라인 리셋
			flightPathsWalk[i].setMap(null);
/* 		for(var i=0; i<startMarkers.length; i++)	// 출발 마커 리셋
			startMarkers[i].setMap(null); 
		for(var i=0; i<endMarkers.length; i++)		// 도착 마커 리셋
			endMarkers[i].setMap(null); */
	}
	 
	// Tmap에서 도보로 길찾기 좌표 불러오기 
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
	
	// 구글 좌표를 Tmap좌표로
	function googleToTmap(lonlat){
		
		var pr_3857 = new Tmap.Projection("EPSG:3857"); //EPSG3857 좌표계 객체
		var pr_4326 = new Tmap.Projection("EPSG:4326"); //EPSG4326 좌표계 객체
		
		return lonlat.transform(pr_4326, pr_3857);
	}
	
	// Tmap 좌표를 구글좌표로
	function tmapToGoogle(lonlat){
		
		var pr_3857 = new Tmap.Projection("EPSG:3857"); //EPSG3857 좌표계 객체
		var pr_4326 = new Tmap.Projection("EPSG:4326"); //EPSG4326 좌표계 객체
		
		return lonlat.transform(pr_3857, pr_4326);
	}

	// 자동차 길찾기 선긋기
	function addLine(x,y,i) {
		first = {lat: x, lng: y};
		lineLocation.push(first);
		if(second != null){
			var flightPlanCoordinates = [ first, second ];
			var flightPath = new google.maps.Polyline({
				path : flightPlanCoordinates,
				geodesic : true,
				strokeColor : '#3F9FFF',
				strokeOpacity : 0.7,
				strokeWeight : 4
			});
			flightPaths.push(flightPath);
			flightPath.setMap(map);
		}
			second = first;
			if((routeLayer.features.length)-1 == i){
				first = null;
				second = null;
			}
	} 

	// 도보 길찾기 선긋기
	function addLineWalk(x,y,i) {
		first = {lat: x, lng: y};
		lineLocationWalk.push(first);
		if(second != null){
			var flightPlanCoordinates = [ first, second ];
			var flightPath = new google.maps.Polyline({
				path : flightPlanCoordinates,
				geodesic : true,
				strokeColor : '#3F9FFF',
				strokeOpacity : 0.7,
				strokeWeight : 4
			});
			flightPathsWalk.push(flightPath);
			flightPath.setMap(map);
		}
			second = first;
			if((routeLayerWalk.features.length)-1 == i){
				first = null;
				second = null;
			}
	} 
	
	window.onload = function(){
		initialize();
	}
	
	function startResetPlace(event){
		f=1;
		google.maps.event.addListener(map, 'mousemove', function(event) {
			if(f==1){
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();
				var locationS = new Array();
				locationS.push({lat:lat, lng:lng});
				startSpot(locationS[0], map);
			}
		});
	}
	
	function endResetPlace(event){
		f=2;
		google.maps.event.addListener(map, 'mousemove', function(event) {
			if(f==2){
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();
				var locationE = new Array();
				locationE.push({lat:lat, lng:lng});
				endSpot(locationE[0], map);
			}
		});
	}
	 
	// 길찾기 출발지점 설정
	function startSpot(location, map){
	    
	    if (f!=1) {
			return;
		}
		f = 0;
		for(var i=0; i<startMarkers.length; i++){
			startMarkers[i].setMap(null);
		}
		startMarkers = [];
		startMarker = new google.maps.Marker({
			position : location,
			icon : 'http://openmap2.tmap.co.kr/start.png',
			draggable : true,
			map : map
		});
		startMarker.addListener('dragend', startResetPlace);
		startLocation = location;
		startMarkers.push(startMarker);
		var listenerStartMarker = google.maps.event.addListener(startMarker, 'click', function(){
			if(confirm('길찾기를 종료하시겠습니까?')){
			    resetFindRoad();
			}
		});
		if(startLocation != null && endLocation != null){
		    $("#naviDiv").fadeIn("fast");
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
	
	// 길찾기 도착지점 설정
	function endSpot(location, map){
		if (f!=2) {
			return;
		} 
		f = 0;
		for(var i=0; i<endMarkers.length; i++){
			endMarkers[i].setMap(null);
		}
		endMarkers = [];
		endMarker = new google.maps.Marker({
			position : location,
			icon : 'http://openmap2.tmap.co.kr/arrival.png',
			draggable : true,
			map : map
		});
		endMarker.addListener('dragend', endResetPlace);
		endLocation = location;
		endMarkers.push(endMarker);
		var listenerEndMarker = google.maps.event.addListener(endMarker, 'click', function(){
			if(confirm('길찾기를 종료하시겠습니까?')){
			    resetFindRoad();
			}
		});
		if(startLocation != null && endLocation != null){
		    $("#naviDiv").fadeIn("fast");
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
		
	// 마커 추가 설정
	function addExtraMarker(lat, lng){
		var insertMarker = {lat:Number(lat),lng:Number(lng)};
		listLonLat.push(insertMarker);
		initLonLat = {lat:lat,lng:lng};
		zoom = map.getZoom();
		center = new google.maps.LatLng(lat, lng);
		map.setCenter(center);
		initialize();
	}
	
	// 직접 마커 설정
	function locationExtra(location, map){
		if(extraflag!=1){
			return;
		}
		extraflag=0;
		extraMarker = new google.maps.Marker({
			position : location,
			draggable : true,
			map : map
		});
		
		addExtraMarker((location.lat).toFixed(7).toString(),(location.lng).toFixed(7).toString());
		
		// 가까운 좌표 선잇기
		/* var lat1 = (location.lat).toFixed(7);
		lat1 *= 1;
		var lng1 = (location.lng).toFixed(7);
		lng1 *= 1;
		var insertLatLng = {lat:lat1,lng:lng1};
		var minDistance = 999;
		var minLat;
		var minLng;
		
		for(var i=0; i<listLonLat.length; i++){
			var lat2 = listLonLat[i].lat;
			lat2 *= 1;
			var lng2 = listLonLat[i].lng;
			lng1 *= 1;
			var distance = calculateDistance(lat1, lng1, lat2, lng2);
			if(minDistance > distance){
				minDistance = distance;
				minLat = lat2;
				minLng = lng2;
			}
		}
		
		for(var i=0; i<listLonLat.length; i++){
			if(listLonLat[i].lat == minLat && listLonLat[i].lng == minLng){
				index = i;
			}
		}
		listLonLat.splice(index-1,0,insertLatLng);
		initialize(); */
	}
	 
	/* function toRad(Value) {
	    return Value * Math.PI / 180;
	} */
	
	// 좌표 거리계산km
	/* function calculateDistance(lat1, lon1, lat2, lon2) {
	      var R = 6371;
	      var dLat = toRad(lat2-lat1);
	      var dLon = toRad(lon2-lon1); 
	      var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
	              Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * 
	              Math.sin(dLon/2) * Math.sin(dLon/2); 
	      var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
	      var d = R * c;
	      return d;
	} */
	 
	function dragStart(event) {
		event.dataTransfer.effectAllowed = 'move';
		event.dataTransfer.setData("Text", event.target.getAttribute('id'));
	}

	function dragEnter(event) {
		var idelt = event.dataTransfer.getData("Text");
		return true;
	}

	function dragOver(event) {
		var idelt = event.dataTransfer.getData("Text");
		var id = event.target.getAttribute('id');
		if (id == 'map' && idelt == drag) {
			return true;
		}
		return false;
	}

	function dragDrop(event) {
		return true;
	}

	function startDragEnd(event) {
		f=1;
		google.maps.event.addListener(map, 'mouseover', function(event) {
			if(f==1){
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();
				var locationS = new Array();
				locationS.push({lat:lat, lng:lng});
				startSpot(locationS[0], map);
			}
		});
		event.dataTransfer.clearData("Text");
		return true;
	} 
	 
	function endDragEnd(event) {
		f=2;
		google.maps.event.addListener(map, 'mouseover', function(event) {
			if(f==2){
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();
				var locationE = new Array();
				locationE.push({lat:lat, lng:lng});
				endSpot(locationE[0], map);
			}
		});
		event.dataTransfer.clearData("Text");
		return true;
	}
	
	function dragextramarker(event){
		extraflag=1;
		google.maps.event.addListener(map, 'mouseover', function(event) {
			if(extraflag==1){
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();
				var locationEx = {lat:lat, lng:lng};
				locationExtra(locationEx, map);
			}
		});
		event.dataTransfer.clearData("Text");
		return true;
	}
	
	// 길찾기 종료.
	function closeSearch(){
		$('#addinfo').children().remove();			// 길찾기 정보 리셋
		for(var i=0; i<flightPaths.length; i++)		// 자동차 라인 리셋
			  flightPaths[i].setMap(null);
		if(directionsDisplay!=null)					// 교통수단 라인 리셋
			directionsDisplay.setMap(null);
 		for(var i=0; i<flightPathsWalk.length; i++)	// 도보 라인 리셋
			flightPathsWalk[i].setMap(null);
		for(var i=0; i<startMarkers.length; i++)
			startMarkers[i].setMap(null);
		for(var i=0; i<endMarkers.length; i++)
			endMarkers[i].setMap(null);
		first = null;
		second = null;
		startLocation = null;
		endLocation = null;
		f=0;
	}

	// 대중교통 길찾기
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
		
	// 자가용 길찾기로 재선택 
	function findLoadAgain(){
		lineReset();
		searchRoute(startLocation, endLocation);
	}
	
	// 도보 버튼 클릭시
	function forWalk(){
		lineReset();
		searchRouteWalking(startLocation, endLocation);
	}
	
	// submit 할때 lonlat, marker lonlat, city, theme 값 controller로 전달
	function goSubmit(){
	    
	    if($('#title').val()==""){
			alert("제목을 입력하세요.");
			$('#title').focus();
			return;
	    } else if($('#content').val()==""){
			alert('내용을 입력하세요.');
			$('#content').focus();
			return;
	    }
	    
	 // listLonLat 좌표
	    var lonlat1 = "";
	    var lonlat2 = "";
	    for(var i=0; i<listLonLat.length; i++){
			lonlat1 += listLonLat[i].lat.toFixed(7);
			lonlat1 += "/";
			lonlat2 += listLonLat[i].lng.toFixed(7);
			lonlat2 += "/";
	    }
	    tag1 = "<input type='hidden' value='"+lonlat1+"' name='lat'/>";
	    tag2 = "<input type='hidden' value='"+lonlat2+"' name='lng'/>";
	    $('#map_div').append(tag1);
		$('#map_div').append(tag2);
		
		// checkMarker 좌표
	    var markerlonlat1 = "";
	    var markerlonlat2 = "";
	    for(var i=0; i<checkMarker.length; i++){
			markerlonlat1 += checkMarker[i].position.lat().toFixed(7);
			markerlonlat1 += "/";
			markerlonlat2 += checkMarker[i].position.lng().toFixed(7);
			markerlonlat2 += "/";
	    }
		checkpoint1 = "<input type='hidden' value='"+markerlonlat1+"' name='markerlat'/>";
		checkpoint2 = "<input type='hidden' value='"+markerlonlat2+"' name='markerlng'/>";
		$('#map_div').append(checkpoint1);
		$('#map_div').append(checkpoint2);
	    
		var rightTitle = "";
		var rightContent = "";		
		for(var i=0; i<checkMarker.length; i++){
			rightTitle += $('.panel-heading').eq(i).children().val();
			rightTitle += "/";
			rightContent += $('.panel-body').eq(i).children().val();
			rightContent += "/";
		}
		$('#map_div').append("<input type='hidden' value='"+rightTitle+"' name='paneltitle'/>");
		$('#map_div').append("<input type='hidden' value='"+rightContent+"' name='panelcontent'/>");

		console.log(tag1);
		console.log(tag2);
		console.log(checkpoint1);
		console.log(checkpoint2);
		console.log(rightTitle);
		console.log(rightContent);
	    document.inputform.submit();
	}
	
	
	function goSearch(){
	    location.href = "${ pageContext.request.contextPath }/map/search.do?searchtext="+$('#searchtext').val();
	}
	
	var favoritePlaceLonLat;
	var favoriteMapLonLat = new Array();
	
		function getMyplace(checkpointidx){
		    $.ajax({
			    type: 'POST' , 
			    url: '${ pageContext.request.contextPath }/map/getMyplace.do',
			    dataType : 'json',
			    data : {
					checkpointidx : checkpointidx
			    },
			    success: function(data) {
					favoritePlaceLonLat = null;
					var Fplace = {lat:Number(data.lat),lng:Number(data.lon)};
					if(favoritePlaceLonLat != null){
						if(favoritePlaceLonLat.position.lat().toFixed(7) == Fplace.lat && favoritePlaceLonLat.position.lng().toFixed(7) == Fplace.lng){
							return;
						}
					}
					goZoomIn(data.lat, data.lon);
					favoritePlaceLonLat = new google.maps.Marker({
						map : map,
						position : Fplace,
						icon : "http://maps.google.com/mapfiles/kml/paddle/red-circle-lv.png"
					});
					var listener3 = google.maps.event.addListener(map, 'click', function(){
						if(infowindow != null){
							  infowindow.close();
						  }
					  });
					  var listener1 = google.maps.event.addListener(favoritePlaceLonLat, 'click', function(){
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
function openNavi(){
    divFlag = 1;
    $('#naviDiv').animate({width:'toggle'},100);
}

function resetFindRoad(){
    if(startLocation != null || endLocation != null){
	     lineReset();
	     startLocation = null;
	     endLocation = null;
	     if(startMarker != null){
		     startMarker.setMap(null); 		 
	     }
	     if(endMarker != null){
	 	 	endMarker.setMap(null);
	     }
	 	 divFlag = 0;
	 	 $("#naviDiv").hide("fast");
	 	 if(infowindow != null){
			  infowindow.close();
		 }
    }
}
</script>
<script>
		var mymapLonLatList = new Array();
		var mymapCheckpointList = new Array();
		var mymapCoordinates;
		function getMymap(mymapidx){
		    
		    $.ajax({
			    type: 'POST' , 
			    url: '${ pageContext.request.contextPath }/map/getMymap.do',
			    dataType : 'json',
			    data : {
					mymapidx : mymapidx
			    },
			    success: function(data) {
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
		function drawFavoriteMap(){
		    
		    map = new google.maps.Map(document.getElementById('map'), {
				zoom : zoom,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				center : center,
				mapTypeControl: false,
				zoomControl: false,
				streetViewControl: false
			});
		    
		    openADV();
		    
		    for(var i=0; i<mymapLonLatList.length; i++){    
				var mymapCoordinates = mymapLonLatList[i].mymapLonLat;
					var mymapPath = new google.maps.Polyline({
						path : mymapCoordinates,
						geodesic : true,
						strokeColor : '#0000FF',
						strokeOpacity : 1.0,
						strokeWeight : 3
					});
					mymapPath.setMap(null);
					mymapPath.setMap(map);
			}
		    console.log(mymapCheckpointList.length);
			
		    checkPointMarker = [];
		    /////////////////////
			for(var i=0; i<mymapCheckpointList.length; i++){
			    for(var j=0; j<mymapCheckpointList[i].mymapCheckpoint.length; j++){
					console.log(mymapCheckpointList[i].mymapCheckpoint[j]);
						
					checkPointMarker.push(new google.maps.Marker({
				   	 	position: mymapCheckpointList[i].mymapCheckpoint[j],
				    	map: map,
						icon : "http://maps.google.com/mapfiles/kml/paddle/red-circle-lv.png"
					}));
				  
				  var listener6 = google.maps.event.addListener(map, 'click', function(){
					if(infowindow != null){
						  infowindow.close();
					  }
				  });
				  
				  console.log(checkPointMarker);
				  var listener7 = google.maps.event.addListener(checkPointMarker[j], 'click', function(){
					  if(infowindow != null){
						  infowindow.close();
					  }
					  infowindow = new google.maps.InfoWindow({
						    content: 'gogogo'
						  }); 
					  infowindow.open(map, this);
				  });  
			    }
			}
		    
		    
		    
		    if(listLonLat.length != 0){
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
<script>
		
	function mymapListPlanAndReg(mymapidx){
	    
	    $.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/map/getMymap.do',
		    dataType : 'json',
		    data : {
				mymapidx : mymapidx
		    },
		    success: function(data) {
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
</head>
<body>
	<div id="sb-site">
		<div id="page-wrapper">
			<div id="page-content-wrapper">
				<jsp:include page="/top2.do" />
				<div id="page-content">
					<form name="inputform"
						action="${ pageContext.request.contextPath }/map/planMymap.do"
						style="height: 100%">
						<div class="row" style="height: 100%;">
							<div id="map" class="col-md-9" style="height: 100%;"
								ondragenter="return dragEnter(event)"
								ondrop="return dragDrop(event)"
								ondragover="return dragOver(event)"></div>


							<div class="col-md-3" style="float: right; height: 90%">
								<div class="panel" style="padding-top: 60px; height: 100%;">
									<div class="panel-body" style="height: 100%">
										<!-- <h3 class="title-hero">ddd</h3> -->
										<div class="example-box-wrapper" style="height: 100%">
											<div class="content-box tabs" style="height: 80%">
												<h3 class="content-box-header bg-default">
													<ul>
														<li><a href="#tabs-example-1" title="Tab 1">place</a></li>
														<li><a href="#tabs-example-2" title="Tab 2">favorites</a></li>
													</ul>
												</h3>
												<div id="tabs-example-1" style="height: 100%">
													<br />
													<div class="row">
														<span class="col-md-1" draggable="true"
															ondragstart="return dragStart(event)"
															ondragend="return dragextramarker(event)"><img
															src="https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png"
															title="지도에 드래그하여 마커를 추가하세요" /></span>
														<div class="col-md-9">
															<input id="pac-input" class="form-control" type="text"
																placeholder="Search Box">
														</div>
														<div class="col-md-2">
															<a href="javascript:openNavi()"><img
																src="${ pageContext.request.contextPath }/resources/images/findload3.png"></a>
														</div>
													</div>
													<input id="title" name="title" type="text"
														class="form-control" placeholder="제목"> <br /> <input
														id="content" name="content" type="text"
														class="form-control" placeholder="설명">
													<!-- pannel -->
													<div class="cf clearfix nestable-lists"
														style="overflow: hidden; overflow-y: auto; height: 100%">
														<div class="dd" id="nestable">
															<ol class="dd-list" id="draggablePanelList">
															</ol>
														</div>
													</div>
													<br />
													<div style="text-align: center;">
														<button type="button" class="btn btn-secondary btn-lg"
															onclick="goSubmit()">등록</button>
														<button type="button" class="btn btn-secondary btn-lg">취소</button>

													</div>


												</div>

												<div id="tabs-example-2">
													<div class="example-box-wrapper">
														<div class="panel-group" id="accordion">
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseOne">내가 등록한 여행</a>
																	</h4>
																</div>
																<div id="collapseOne" class="panel-collapse collapse in">
																	<div class="panel-body">
																		<ul>
																			<c:forEach var="mymapListPlanAndReg"
																				items="${ mymapListPlanAndReg }">
																				<c:if test="${ mymapListPlanAndReg.type == 1 }">
																					<li><a
																						href="javascript:mymapListPlanAndReg('${ mymapListPlanAndReg.idx }')"
																						style="text-decoration: none;"><span
																							style="font-size: 13pt;">${ mymapListPlanAndReg.title }</span></a></li>
																				</c:if>
																			</c:forEach>
																		</ul>
																	</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseTwo">나의 여행 계획</a>
																	</h4>
																</div>
																<div id="collapseTwo" class="panel-collapse collapse">
																	<div class="panel-body">
																		<ul>
																			<c:forEach var="mymapListPlanAndReg"
																				items="${ mymapListPlanAndReg }">
																				<c:if test="${ mymapListPlanAndReg.type == 2 }">
																					<li><a
																						href="javascript:mymapListPlanAndReg('${ mymapListPlanAndReg.idx }')"
																						style="text-decoration: none;"><span
																							style="font-size: 13pt;">${ mymapListPlanAndReg.title }</span></a></li>
																				</c:if>
																			</c:forEach>
																		</ul>
																	</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseThree">즐겨찾기</a>
																	</h4>
																</div>
																<div id="collapseThree" class="panel-collapse collapse">
																	<div class="panel-body">
																		<ul>
																			<c:forEach var="mymapList" items="${ mymapList }">
																				<li><a
																					href="javascript:getMymap('${ mymapList.idx }')"
																					style="text-decoration: none;"><span
																						style="font-size: 13pt;">지도 : ${ mymapList.title }</span></a></li>
																			</c:forEach>
																			<c:forEach var="favoriteplaceList"
																				items="${ favoriteplaceList }">
																				<li><a
																					href="javascript:getMyplace('${ favoriteplaceList.checkpointidx }')"
																					style="text-decoration: none;"><span
																						style="font-size: 13pt;">장소 : ${ favoriteplaceList.placename }</span></a></li>
																			</c:forEach>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="col-md-3"
								style="float: right; position: absolute; right: 0; height: 80%"
								id="naviDiv">
								<div class="panel" style="height: 100%">
									<div class="panel-body" style="height: 100%">
										<div class="coupon_tab_btn">
											<span class="tab_btn tab01 active" id="tab1"> <a
												href="javascript:findLoadAgain()"> <img
													src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap01.png" />자가용
											</a>
											</span> <span class="tab_btn tab02" id="tab2"> <a
												href="javascript:calculateAndDisplayRoute()"> <img
													src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap02.png" />대중교통
											</a>
											</span> <span class="tab_btn tab03" id="tab3"> <a
												href="javascript:forWalk()"> <img
													src="${pageContext.request.contextPath }/resources/images/mobile/navi_tap03.png" />도보
											</a>
											</span>
										</div>
										<div class="example-box-wrapper" style="height: 90%;">
											<div
												style="width: 100%; overflow: hidden; overflow-y: auto; height: 100%;">
												<ul class="foot_depth01 clearfix" id="addinfo"></ul>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div id="map_div"></div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="/bottom2.do" />
	</div>
</body>
</html>