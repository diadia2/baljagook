<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<style>
/* 로딩 */
#loading .svg-icon-loader {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -50px 0 0 -50px;
}
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
/* 네비바 투명 */
#page-header {
	background: rgba(255, 255, 255, 0) !important;
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title>Reg Trip</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath }/resources/assets/images/icons/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath }/resources/assets/images/icons/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath }/resources/assets/images/icons/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath }/resources/assets/images/icons/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/icons/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/boilerplate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/border-radius.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/grid.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/page-transitions.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/spacing.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/typography.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/utils.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/colors.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/material/ripple.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/badges.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/buttons.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/content-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/dashboard-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/forms.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/images.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/info-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/invoice.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/loading-indicators.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/menus.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/panel-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/response-messages.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/responsive-tables.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/ribbon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/social-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/tables.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/tile-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/elements/timeline.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/icons/fontawesome/fontawesome.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/icons/linecons/linecons.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/icons/spinnericon/spinnericon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/accordion-ui/accordion.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/calendar/calendar.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/carousel/carousel.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/charts/justgage/justgage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/charts/morris/morris.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/charts/piegage/piegage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/charts/xcharts/xcharts.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/chosen/chosen.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/colorpicker/colorpicker.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/datatable/datatable.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/datepicker/datepicker.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/datepicker-ui/datepicker.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/dialog/dialog.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/dropdown/dropdown.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/dropzone/dropzone.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/file-input/fileinput.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/input-switch/inputswitch.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/input-switch/inputswitch-alt.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/ionrangeslider/ionrangeslider.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/jcrop/jcrop.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/jgrowl-notifications/jgrowl.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/loading-bar/loadingbar.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/maps/vector-maps/vectormaps.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/markdown/markdown.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/modal/modal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/multi-select/multiselect.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/multi-upload/fileupload.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/nestable/nestable.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/noty-notifications/noty.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/popover/popover.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/pretty-photo/prettyphoto.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/progressbar/progressbar.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/range-slider/rangeslider.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/slidebars/slidebars.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/slider-ui/slider.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/summernote-wysiwyg/summernote-wysiwyg.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/tabs-ui/tabs.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/timepicker/timepicker.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/tocify/tocify.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/tooltip/tooltip.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/touchspin/touchspin.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/uniform/uniform.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/wizard/wizard.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/widgets/xeditable/xeditable.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/snippets/chat.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/snippets/files-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/snippets/login-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/snippets/notification-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/snippets/progress-box.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/snippets/todo.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/snippets/user-profile.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/snippets/mobile-navigation.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/applications/mailbox.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/themes/admin/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/themes/admin/color-schemes/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/themes/components/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/themes/components/border-radius.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/responsive-elements.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/helpers/admin-responsive.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-core.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-ui-core.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-ui-widget.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-ui-mouse.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-ui-position.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/transition.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/modernizr.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-cookie.js"></script>

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
	form.title.value = "${title}";
	form.content.value = "${content}";
	form.hashtag.value = "${hashtag}";
	form.daterangepickertime.value = "${start}"+"~"+"${end}";
	
});
    // 시간별 좌표 불러오기
    var listLonLat = new Array();
    <c:forEach items="${list}" var="list">
    	listLonLat.push({lat:${list.lat},lng:${list.lon},idk:${list.idk}, accuracy:${list.accuracy}});
    </c:forEach>
    var checkpointList = new Array();
    <c:forEach items="${checkpointList}" var="checkpointList">
    	checkpointList.push({idx:${checkpointList.idx}, coordinatesidx:${checkpointList.coordinatesidx}, title:'${checkpointList.title}', content:'${checkpointList.content}'});
    </c:forEach>
    var photoList = new Array();
    <c:forEach items="${photoList}" var="photoList">
    	photoList.push({checkpointidx:${photoList.checkpointidx}, oriname:'${photoList.oriname}', newname:'${photoList.newname}'});
    </c:forEach>
    console.log(listLonLat);
    console.log(checkpointList);
    console.log(photoList);

    var initLonLat = listLonLat[listLonLat.length-1];
    var zoom = 13;
    
	var routeLayer, routeLayerWalk, tmap, map;
	var startX, startY, endX, endY;
	var first, second;					// 길찾기 첫번째, 두번째 좌표
	var startMarker, endMarker;			// 길찾기 시작마커, 도착마커
	var startMarkers = [];
	var endMarkers = [];				// 도착 좌표
	var startLocation, endLocation;		// 길찾기 시작좌표, 도착좌표
	var flightPaths = [];
	var flightPathsWalk = [];
	var extraMarker;
	var f = 0;
	var extraflag = 0;					// 마커 직접 추가 flag
	var lineLocation = new Array();
	var lineLocationWalk = new Array();
	
	var directionsDisplay;
	var directionsService;
	
	function initialize() {
		// 좌표 등록
		tmap = new Tmap.Map({div:'map_div', width:'0px', height:'0px'});
		var center = initLonLat;
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : zoom,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			center : center
		});
		
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
			
			addLineMarker();
			
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
			
			addTimeLine();	
			
			if(listLonLat.length == 0){
				alert("날짜가 잘못되었거나 해당기간에 데이터가 없습니다.");	
			}
	}
	 
	// 타임라인 div 클릭시 센터좌표 이동
	function goZoomIn(lat, lng){
		var center = new google.maps.LatLng(lat, lng);
		map.setCenter(center);
	}

	//타임라인에 내용 추가 
	function addTimeLine(){
		$('#draggablePanelList').children().remove();
		var n=1;
		for(var i=0; i<checkMarker.length; i++){
		    if(checkMarker[i].title != ""){
				$('#draggablePanelList').append('<li class="dd-item" data-id="'+n+'" onClick="goZoomIn('+checkMarker[i].position.lat()+", "+checkMarker[i].position.lng()+')"><div class="dd-handle"><div class="circleNum">'+n+'</div>'+checkMarker[i].title+'</div></li>');
		   		n++;
		    }
		} 
	}    
	var checkMarker = new Array();
	var num;
	var infowindow;
	var filename;
	function addLineMarker(){
		
		if(checkMarker != null){
			for(var i=0; i<checkMarker.length; i++){
				checkMarker[i].setMap(map);
			}
		} 
		for(var i=0; i<listLonLat.length; i++){
			var flagNum=0;
			num = i;
			
				for(var j=0; j<checkpointList.length; j++){
				    
					
				    if(listLonLat[i].idk == checkpointList[j].coordinatesidx){
						filename = null;
					
						for(var k=0; k<photoList.length; k++){
							if(checkpointList[j].idx == photoList[k].checkpointidx){
							    filename = photoList[k].newname;
							} 
						}
					
				    	if(filename != null){
						    	checkMarker.push(new google.maps.Marker({
							    position: listLonLat[i],
							    map: map,
							    num :i,
							    title:checkpointList[j].title,
							    content:checkpointList[j].content,
							    filename:filename,
							    checkpointList:checkpointList[j].idx,
							    accuracy:listLonLat[i].accuracy
							}));
					 		   
							  var listener2 = google.maps.event.addListener(map, 'click', function(){
								if(infowindow != null){
									  infowindow.close();
								  }
							  });
							  var listener4 = google.maps.event.addListener(checkMarker[num], 'click', function(){
								  if(infowindow != null){
									  infowindow.close();
								  }
								  infowindow = new google.maps.InfoWindow({
									    content: '<img src="${ pageContext.request.contextPath }/resources/photo/'+this.filename+'" width="200px" height="200px"/><br/>'+
											    (this.num+1)+". "+this.title+'<br/>'+this.content+this.accuracy+'<br/>'+
											    '<br/><input type="button" value="출발설정" onClick="startCheck('+
									    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="도착설정" onClick="endCheck('+
									    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="위치삭제" onClick="removeSpot('+
									    		(this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+')"/>'
									  }); 
								  infowindow.open(map, this);
							  });
				    	    
				    	} else {
									checkMarker.push(new google.maps.Marker({
									    position: listLonLat[i],
									    map: map,
									    num :i,
									    title:checkpointList[j].title,
									    content:checkpointList[j].content,
									    checkpointList:checkpointList[j].idx,
									    accuracy:listLonLat[i].accuracy
									}));
						 		   
								  var listener3 = google.maps.event.addListener(map, 'click', function(){
									if(infowindow != null){
										  infowindow.close();
									  }
								  });
								  var listener1 = google.maps.event.addListener(checkMarker[num], 'click', function(){
									  if(infowindow != null){
										  infowindow.close();
									  }
									  infowindow = new google.maps.InfoWindow({
										    content: (this.num+1)+". "+this.title+'<br/>'+this.content+this.accuracy+
										    '<br/><input type="button" value="출발설정" onClick="startCheck('+
										    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="도착설정" onClick="endCheck('+
										    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="위치삭제" onClick="removeSpot('+
										    		(this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+')"/>'
										  }); 
									  console.log(infowindow);
									  infowindow.open(map, this);
								  });	
				    		}
				    break;
			 	  } else {
			 	      flagNum++;
			 	  }
				}
					
					if(flagNum == checkpointList.length){
					    
						    checkMarker.push(new google.maps.Marker({
							    position: listLonLat[i],
							    map: map,
							    num :i,
							    icon : {
								    url: 'http://openmap2.tmap.co.kr/point.png'
								  },
							    title:"",
							    accuracy:listLonLat[i].accuracy
							}));
				 		   
						  var listener3 = google.maps.event.addListener(map, 'click', function(){
							if(infowindow != null){
								  infowindow.close();
							  }
						  });
						  var listener1 = google.maps.event.addListener(checkMarker[num], 'click', function(){
							  if(infowindow != null){
								  infowindow.close();
							  }
							  infowindow = new google.maps.InfoWindow({
								    content: (this.num+1)+". "+(this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+'<br/>'+this.accuracy+
								    '<br/><input type="button" value="출발설정" onClick="startCheck('+
								    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="도착설정" onClick="endCheck('+
								    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="위치삭제" onClick="removeSpot('+
								    		(this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+')"/>'
								  }); 
							  infowindow.open(map, this);
						  });	
			 	 	 }
			    
			}
		}
	 
	
	// 마커 선택하여 위치삭제
	function removeSpot(lat, lng){
		var index;
		
		for(var i=0; i<listLonLat.length; i++){
			if(listLonLat[i].lat == lat && listLonLat[i].lng == lng){
				index = i;
			}
		}
		listLonLat.splice(index,1);
		initLonLat = {lat:lat,lng:lng};
		zoom = map.getZoom();
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
	 
	// 자동차 길찾기 좌표 포맷
	function getLoad(e){
		$('#addinfo').children().remove();
		for(var i=0; i<routeLayer.features.length; i++){
			if(routeLayer.features[i].attributes.turnType == "200"){
/*출발*/		    $('#addinfo').append('<div class="InfoAppend">'+((routeLayer.features[i].attributes.totalDistance)/1000).toFixed(1)+'km. 약 '+((routeLayer.features[i].attributes.totalTime)/60).toFixed(0)+'분</div>');
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/start.png" /> '+routeLayer.features[i].attributes.description+'<br/></div>');
/*도착*/		} else if(routeLayer.features[i].attributes.turnType == "201"){
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/arrival.png"/> '+routeLayer.features[i].attributes.description+'<br/></div>');				
/*좌회전*/	} else if(routeLayer.features[i].attributes.turnType == "12" || routeLayer.features[i].attributes.turnType == "16" || routeLayer.features[i].attributes.turnType == "17"){
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/left.PNG" /><br/></div>');				
/*우회전*/	} else if(routeLayer.features[i].attributes.turnType == "13" || routeLayer.features[i].attributes.turnType == "18" || routeLayer.features[i].attributes.turnType == "19"){
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/right.PNG" /><br/></div>');				
/*유턴*/		} else if(routeLayer.features[i].attributes.turnType == "14"){
				$('#addinfo').append('<div class="InfoAppend" style="border:"1px solid"; float:left; height:60px; text-decoration: underline;"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/uturn.PNG"/><br/></div>');				
/*직진*/		} else if(routeLayer.features[i].attributes.turnType == "11" || routeLayer.features[i].attributes.turnType == "51"){
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/go.PNG"/<br/></div>');				
/*그외*/		} else {
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<br/></div>');
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
/*출발*/		    $('#addinfo').append('<div class="InfoAppend">'+((routeLayerWalk.features[i].attributes.totalDistance)/1000).toFixed(1)+'km. 약 '+((routeLayerWalk.features[i].attributes.totalTime)/60).toFixed(0)+'분</div>');
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/start.png" /> '+routeLayerWalk.features[i].attributes.description+'<br/></div>');
/*도착*/		} else if(routeLayerWalk.features[i].attributes.turnType == "201"){
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/arrival.png"/> '+routeLayerWalk.features[i].attributes.description+'<br/></div>');				
/*좌회전*/	} else if(routeLayerWalk.features[i].attributes.turnType == "12" || routeLayerWalk.features[i].attributes.turnType == "16" || routeLayerWalk.features[i].attributes.turnType == "17"){
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/left.PNG" /><br/></div>');				
/*우회전*/	} else if(routeLayerWalk.features[i].attributes.turnType == "13" || routeLayerWalk.features[i].attributes.turnType == "18" || routeLayerWalk.features[i].attributes.turnType == "19"){
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/right.PNG" /><br/></div>');				
/*유턴*/		} else if(routeLayerWalk.features[i].attributes.turnType == "14"){
				$('#addinfo').append('<div class="InfoAppend" style="border:"1px solid"; float:left; height:60px; text-decoration: underline;"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/uturn.PNG"/><br/></div>');				
/*직진*/		} else if(routeLayerWalk.features[i].attributes.turnType == "11"){
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/go.PNG"/<br/></div>');				
/*그외*/		} else {
				$('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<br/></div>');
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
		if(startLocation != null && endLocation != null){
			searchRoute(startLocation, endLocation);
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
		if(startLocation != null && endLocation != null){
			searchRoute(startLocation, endLocation);
		}
	}
		
	// 마커 추가 설정
	function addExtraMarker(lat, lng){
		var index = $('#extra').val();
		var insertMarker = {lat:lat,lng:lng};
		listLonLat.splice(index-1,0,insertMarker);
		initLonLat = {lat:lat,lng:lng};
		zoom = map.getZoom();
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
		
		var listener1 = google.maps.event.addListener(extraMarker, 'click', function(){
			if(infowindow != null){
				  infowindow.close();
			  }
			  infowindow = new google.maps.InfoWindow({
				    content: '<br/>번호입력<input type="text" id="extra" size="3"/><input type="button" value="완료" onclick="addExtraMarker('+
				    (this.position.lat()).toFixed(7).toString()+", "+(this.position.lng()).toFixed(7).toString()+')"/>'
				  }); 
			  infowindow.open(map, this);
		});
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
	
	function goAgain(){
		var form = document.inputform;
		
		form.action = "${ pageContext.request.contextPath }/map/mapcheck.do";
		form.method = "POST";
		form.submit();
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
	    // listLonLat 좌표
	    var lonlat1 = "";
	    var lonlat2 = "";
	    var lonlat3 = "";
	    for(var i=0; i<listLonLat.length; i++){
			lonlat1 += listLonLat[i].lat.toFixed(7);
			lonlat1 += "/";
			lonlat2 += listLonLat[i].lng.toFixed(7);
			lonlat2 += "/";
			lonlat3 += listLonLat[i].idk;
			lonlat3 += "/"; 
	    }
	    tag1 = "<input type='hidden' value='"+lonlat1+"' name='lat'/>";
	    tag2 = "<input type='hidden' value='"+lonlat2+"' name='lng'/>";
	    tag3 = "<input type='hidden' value='"+lonlat3+"' name='idk'/>";
	    $('#map_div').append(tag1);
		$('#map_div').append(tag2);
		$('#map_div').append(tag3);
		
		// checkMarker 좌표
	    var markerlonlat1 = "";
	    var markerlonlat2 = "";
	    var markerlonlat3 = "";
	    for(var i=0; i<checkMarker.length; i++){
			if(checkMarker[i].title != "" && checkMarker[i].content != ""){
				markerlonlat1 += checkMarker[i].position.lat().toFixed(7);
				markerlonlat1 += "/";
				markerlonlat2 += checkMarker[i].position.lng().toFixed(7);
				markerlonlat2 += "/";
				markerlonlat3 += checkMarker[i].checkpointList;
				markerlonlat3 += "/";
			}
	    }
		checkpoint1 = "<input type='hidden' value='"+markerlonlat1+"' name='markerlat'/>";
		checkpoint2 = "<input type='hidden' value='"+markerlonlat2+"' name='markerlng'/>";
		checkpoint3 = "<input type='hidden' value='"+markerlonlat3+"' name='markeridx'/>";
		$('#map_div').append(checkpoint1);
		$('#map_div').append(checkpoint2);
		$('#map_div').append(checkpoint3);
	    
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
		
	    $('#map_div').append("<input type='hidden' value='${city}' name='city'/>");
	    $('#map_div').append("<input type='hidden' value='${theme}' name='theme'/>");
	    
	    var photoCheckPointIdx = "";
	    var photoOriName = "";
	    var photoNewName = "";
	    for(var i=0; i<photoList.length; i++){
			photoCheckPointIdx += photoList[i].checkpointidx;
			photoCheckPointIdx += "/";
			photoOriName += photoList[i].oriname;
			photoOriName += "/";
			photoNewName += photoList[i].newname;
			photoNewName += "/";
	    }
	    $('#map_div').append("<input type='hidden' value='"+photoCheckPointIdx+"' name='photoCheckPointIdx'/>");
	    $('#map_div').append("<input type='hidden' value='"+photoOriName+"' name='photoOriName'/>");
	    $('#map_div').append("<input type='hidden' value='"+photoNewName+"' name='photoNewName'/>");
	    
	    console.log(checkMarker);
	    console.log(photoList);
	    document.inputform.submit(); 
	}
	
	
	function goSearch(){
	    location.href = "${ pageContext.request.contextPath }/map/search.do?searchtext="+$('#searchtext').val();
	}
</script>
</head>
<body>
	<div id="sb-site">
		<div id="loading">
			<div class="svg-icon-loader">
				<img
					src="${pageContext.request.contextPath }/resources/assets/images/svg-loaders/bars.svg"
					width="40" alt="">
			</div>
		</div>
		<div id="page-wrapper">
			<div id="mobile-navigation">
				<button id="nav-toggle" class="collapsed" data-toggle="collapse"
					data-target="#page-sidebar">
					<span></span>
				</button>
			</div>

			<div id="page-content-wrapper">
				<div id="page-content">
					<div id="page-header">
						<div id="header-nav-left">
							<a class="header-btn" id="logout-btn" href="lockscreen-3.html"
								title="Lockscreen page example"><i
								class="glyph-icon icon-linecons-lock"></i></a>
							<div class="user-account-btn dropdown">
								<a href="#" title="My Account" class="user-profile clearfix"
									data-toggle="dropdown"><img width="28"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg"
									alt="Profile image"> <span>${sessionScope.user}</span> <i
									class="glyph-icon icon-angle-down"></i></a>
								<div class="dropdown-menu float-right">
									<div class="box-sm">
										<div class="login-box clearfix">
											<div class="user-img">
												<a href="#" title="" class="change-img">Change photo</a> <img
													src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg"
													alt="">
											</div>
											<div class="user-info">
												<span>${sessionScope.user}<i>UX/UI developer</i></span> <a
													href="#" title="Edit profile">Edit profile</a> <a href="#"
													title="View notifications">View notifications</a>
											</div>
										</div>
										<div class="divider"></div>
										<ul class="reset-ul mrg5B">
											<li><a href="#">View login page example <i
													class="glyph-icon float-right icon-caret-right"></i></a></li>
											<li><a href="#">View lockscreen example <i
													class="glyph-icon float-right icon-caret-right"></i></a></li>
											<li><a href="#">View account details <i
													class="glyph-icon float-right icon-caret-right"></i></a></li>
										</ul>
										<div
											class="button-pane button-pane-alt pad5L pad5R text-center">
											<a href="#"
												class="btn btn-flat display-block font-normal btn-danger"><i
												class="glyph-icon icon-power-off"></i> Logout</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="header-nav-right" class="row">
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search"
										style="margin-top: 13px;"> <span
										class="input-group-btn"><a href="#"
										class="hdr-btn popover-button" title="Search"
										data-placement="bottom" data-id="#popover-search"><i
											class="glyph-icon icon-search"></i></a></span>
								</div>
							</div>
							<div class="hide" id="popover-search">
								<div class="pad5A box-md">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="Search terms here ..."> <span
											class="input-group-btn"><a class="btn btn-primary"
											href="#">Search</a></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <script type="text/javascript"
						src="https://maps.googleapis.com/maps/api/js?v=3&amp;sensor=true"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/maps/gmaps/gmaps.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/maps/gmaps/gmaps-demo.js"></script> -->
					<!-- 					<div id="page-title">
						<h2>gMaps</h2>
						<p>Create maps using the Google Maps API</p>
					</div> -->
					<form name="inputform"
						action="${ pageContext.request.contextPath }/map/regMymap.do"
						style="height: 100%">
						<div class="row" style="height: 100%">
							<div id="map" class="col-md-9" style="height: 100%"
								ondragenter="return dragEnter(event)"
								ondrop="return dragDrop(event)"
								ondragover="return dragOver(event)"></div>
							<div class="col-md-3" style="padding-top: 60px;">
								<div class="panel">
									<div class="panel-body">
										<!-- <h3 class="title-hero">ddd</h3> -->
										<div class="example-box-wrapper">
											<div class="content-box tabs">
												<h3 class="content-box-header bg-default">
													<ul>
														<li><a href="#tabs-example-1" title="Tab 1">place</a></li>
														<li><a href="#tabs-example-2" title="Tab 2">settings</a></li>
														<li><a href="#tabs-example-3" title="Tab 3">favorites</a></li>
													</ul>
												</h3>
												<div id="tabs-example-1">
													<div class="row">
														<span class="col-md-1" draggable="true"
															ondragstart="return dragStart(event)"
															ondragend="return dragextramarker(event)"><img
															src="https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png" /></span>
														<div class="col-md-11">
															<input id="pac-input" class="form-control" type="text"
																placeholder="Search Box">
														</div>
													</div>
													<!-- pannel -->
													<div class="cf clearfix nestable-lists">
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
													<input name="title" type="text" class="form-control"
														placeholder="제목"> <br /> <input name="content"
														type="text" class="form-control" placeholder="설명"><br />

													<div class="form-group">
														<div class="input-prepend input-group">
															<span class="add-on input-group-addon"><i
																class="glyph-icon icon-calendar"></i></span> <input type="text"
																name="daterangepickertime" id="daterangepicker-time"
																class="form-control" value=""> <input
																type="hidden" id="start" name="start" value="${start}">
															<input type="hidden" id="end" name="end" value="${end }">
															<script type="text/javascript">
															/* daterangepicker-time에서 apply 누르면 실행(daterangepicker.js에 추가함) */
															function changeDP() {
																var date = document.inputform.daterangepickertime.value;
																var time1 = date.substring(11,13);
																var time2 = date.substring(33,35);
																if((date.substring(17,19))==("PM")){
																	time1=Number(time1)+12;
																}
																if((date.substring(39,41))==("PM")){
																	time2=Number(time2)+12;
																}
																	document.inputform.start.value=date.substring(0,11)+time1+date.substring(13,16);
																	document.inputform.end.value=date.substring(22,33)+time2+date.substring(35,38);
																	mapAgain();
															}
															function mapAgain(){
																$.ajax({
																    type: 'POST' , 
																    url: '${ pageContext.request.contextPath }/map/mapAgain.do',
																    dataType : 'json',
																    data : {
																		start : $('#start').val(),
																		end : $('#end').val()
																    },
																    success: function(data) {
																		listLonLat = new Array();
																		for(var i=0; i<data[0].length; i++){
																		    listLonLat.push({lat:Number(data[0][i].lat),lng:Number(data[0][i].lon),idk:data[0][i].idk});
																		}
																		initLonLat = listLonLat[listLonLat.length-1];
																		
																		checkpointList = new Array();
																		for(var i=0; i<data[1].length; i++){
																		    checkpointList.push({idx:data[1][i].idx, coordinatesidx:data[1][i].coordinatesidx, title:data[1][i].title, content:data[1][i].content});
																		}
																		
																		photoList = new Array();
																		for(var i=0; i<data[2].length; i++){
																		    photoList.push({checkpointidx:data[2][i].checkpointidx, oriname:data[2][i].oriname, newname:data[2][i].newname});
																		}
																		initialize();
															        }
																});	
															}
																
																</script>
														</div>
													</div>
													<input name="hashtag" type="text"
														class="form-control title-text" placeholder="#해쉬태그">
												</div>
												<div id="tabs-example-3">
													<div class="example-box-wrapper">
														<div class="panel-group" id="accordion">
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseOne">my map</a>
																	</h4>
																</div>
																<div id="collapseOne" class="panel-collapse collapse in">
																	<div class="panel-body">my map</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseTwo">my plan</a>
																	</h4>
																</div>
																<div id="collapseTwo" class="panel-collapse collapse">
																	<div class="panel-body">my plan</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseThree">favorites</a>
																	</h4>
																</div>
																<div id="collapseThree" class="panel-collapse collapse">
																	<div class="panel-body">favorites</div>
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
						<div id="map_div"></div>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/dropdown/dropdown.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/tooltip/tooltip.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/popover/popover.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/progressbar/progressbar.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/button/button.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/collapse/collapse.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/superclick/superclick.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/input-switch/inputswitch-alt.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/slimscroll/slimscroll.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/slidebars/slidebars.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/slidebars/slidebars-demo.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/charts/piegage/piegage.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/charts/piegage/piegage-demo.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/screenfull/screenfull.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/content-box/contentbox.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/material/material.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/material/ripples.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/widgets/overlay/overlay.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/js-init/widgets-init.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/assets/themes/admin/layout.js"></script>
	</div>
</body>
</html>