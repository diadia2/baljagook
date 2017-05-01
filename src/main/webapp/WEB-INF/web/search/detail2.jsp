<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<style>
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
/* redline */
.redline:BEFORE {
	height: 135px;
	border: solid;
	color: red;
	position: absolute;
	left: 15px;
}

.icon-toggle-on:BEFORE {
	content: none !important;
}

.icon-toggle-on {
	font-style: inherit !important;
	font-weight: bold;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title>gMaps</title>
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

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- map -->
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=bac4f916-3297-3be4-93ff-e37ae88b8f42"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6x6lwLmHlSpovbF0nM-fPIPpjfv4D9IM&libraries=places"></script>
<!-- scroll -->
<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/nicescroll/nicescroll.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/nicescroll/nicescroll-demo.js"></script>
<!-- map -->
<script type="text/javascript">
 
    // 시간별 좌표 불러오기
    var listLonLat = new Array();
	var checkpoint = new Array();
	<c:forEach items="${regcoordinatesList}" var="regcoordinatesList">
	  	listLonLat.push({lat:${regcoordinatesList.lat},lng:${regcoordinatesList.lon}, idx:${regcoordinatesList.idx}});
	  	<c:forEach items="${checkpointVO}" var="checkpointVO">
	  		<c:if test="${regcoordinatesList.idx == checkpointVO.regcoordinatesidx}">
	  			checkpoint.push({lat:${regcoordinatesList.lat},lng:${regcoordinatesList.lon},checkpointidx:${checkpointVO.idx}, title:'${checkpointVO.title}', content:'${checkpointVO.content}'});
	  		</c:if>
		</c:forEach>
	</c:forEach>
	var photoList = new Array();
    <c:forEach items="${photoList}" var="photoList">
    	photoList.push({checkpointidx:${photoList.checkpointidx}, oriname:'${photoList.oriname}', newname:'${photoList.newname}'});
    </c:forEach>
    
    var center = listLonLat[listLonLat.length-1];
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
	var f = 0;
	var lineLocation = new Array();
	var lineLocationWalk = new Array();
	
	var directionsDisplay;
	var directionsService;
	
	function initialize() {
		// 좌표 등록
		tmap = new Tmap.Map({div:'map_div', width:'0px', height:'0px'});
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : zoom,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			center : center,
			mapTypeControl: false
		});
		 
		if(listLonLat.length != 0){
			var initflightPlanCoordinates = listLonLat;
				var initflightPath = new google.maps.Polyline({
					path : initflightPlanCoordinates,
					geodesic : true,
					strokeColor : '#FF0000',
					strokeOpacity : 1.0,
					strokeWeight : 4
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
	
	
	// 타임라인 div 클릭시 센터좌표 이동
	function goZoomIn(i){
 		var center = new google.maps.LatLng(checkpoint[i].lat, checkpoint[i].lng);
		map.setCenter(center); 
	}
	
	var checkMarker = new Array();
	var num;
	var infowindow;
	var filename;
	function addLineMarker(){
		console.log(checkpoint);
	    if(listLonLat.length == 0){
			return;
	    }
	    
		if(checkpoint != null){
			for(var i=0; i<checkMarker.length; i++){
				checkMarker[i].setMap(map);
			}
		} 
		for(var i=0; i<checkpoint.length; i++){
			
			num = i;
		    filename = null;
			
			for(j=0; j<photoList.length; j++){
			    console.log(checkpoint[i]);
			    console.log(photoList[j]);
			    if(checkpoint[i].checkpointidx == photoList[j].checkpointidx){
					filename = photoList[j].newname;
					break;
			    }
			}
			
			if(filename != null){
				checkMarker.push(new google.maps.Marker({
				    position: checkpoint[i],
				    map: map,
				    num : i,
				    idx : checkpoint[i].checkpointidx,
				    filename : filename,
				    title : checkpoint[j].title,
				   	content : checkpoint[j].content
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
					  infowindow = new google.maps.InfoWindow({
						    content: '<img src="${ pageContext.request.contextPath }/resources/photo/'+this.filename+'" width="200px" height="200px"/><br/>'+
						    (this.num+1)+". "+this.title+'<br/>'+this.content+
						    '<br/><input type="button" value="출발설정" onClick="startCheck('+
						    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="도착설정" onClick="endCheck('+
						    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="즐겨찾기등록" onClick="getFavoritePlace('+this.idx+')"/>'
						  }); 
					  infowindow.open(map, this);
				  }); 
			} else {
			    checkMarker.push(new google.maps.Marker({
				    position: checkpoint[i],
				    map: map,
				    num : i,
				    idx : checkpoint[i].checkpointidx,
				    title : checkpoint[j].title,
				   	content : checkpoint[j].content
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
					  infowindow = new google.maps.InfoWindow({
						    content: (this.num+1)+". "+this.title+'<br/>'+this.content+
						    '<br/><input type="button" value="출발설정" onClick="startCheck('+
						    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="도착설정" onClick="endCheck('+
						    		this.position.lat().toString()+", "+this.position.lng().toString()+')"/><input type="button" value="즐겨찾기등록" onClick="getFavoritePlace('+this.idx+')"/>'
						  }); 
					  infowindow.open(map, this);
				  }); 
			}  
			 
		}
	} 
	
	//idx => t_checkpoint idx번호
	function getFavoritePlace(idx){
	    
	    var placename = prompt('장소를 입력하세요.');
	    if(placename==""){
			return;
	    } else if(!placename){
			return;
	    }
	    
		alert(idx);
		alert(placename);
	    $.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/map/getFavoritePlace.do',
		    dataType : 'text',
		    data : {
				idx : idx,
				placename : placename
		    },
		    success: function(data) {
				alert(data);
	        },
	        error : function(error){
	            console.log(error);
	        }
		});	
	    
	}
	
	function getFavoriteMap(){
	    $.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/map/getFavoriteMap.do',
		    dataType : 'text',
		    data : {
				mymapidx : '${mymapidx}'
		    },
		    success: function(data) {
				alert(data);
	        },
	        error : function(error){
	            console.log(error);
	        }
		});	
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
			draggable : true,
			map : map,
			icon : "http://openmap2.tmap.co.kr/start.png"
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
			draggable : true,
			map : map,
			icon : "http://openmap2.tmap.co.kr/arrival.png"
		}); 
		endMarker.addListener('dragend', endResetPlace);
		endLocation = location;
		endMarkers.push(endMarker);
		if(startLocation != null && endLocation != null){
			searchRoute(startLocation, endLocation);
		}
	}
		
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

	function toFollow(followedId) {
		console.log(followedId);
		var data = {"followedId" : followedId};
		
		$.ajax({
			url : "${ pageContext.request.contextPath }/toFollow.do",
			type : "POST",
			data : data,
			success : function(data) {
				console.log(this);
				$("#followBtn").attr("disabled","disabled");
				/* $("#likeCnt" + mymapidxRef).html(data[mymapidxRef]); */
			}
		});
	}
	
	function toMsg() {
		window.open('${ pageContext.request.contextPath }/message/message.do', '메세지창', 'width=200, heght=200, status=no, toolbar=no');
	}
	 
	$(function() {
		if("${isFollow}"){
			$("#followBtn").attr("disabled","disabled");
		}
		
		

		/* sock */
		var socket = new SockJS('/Baljagook/endpoint');
		var client = Stomp.over(socket);
		client.connect({}, function(frame) {
			console.log('connected stomp over sockjs');
			client.subscribe('/subscribe/echo', function(message) {
				console.log(message);
				$('#alarm').append(message.body + '<br>');
			});

		});
		$('#message').click(function() {
			var data = {
				name : "${sessionScope.user}"
			};
			client.send('/app/echo', {}, JSON.stringify(data));
		});
	
		
	});
	
</script>

<script type="text/javascript">
var flightNum = 0;
var flightListLonLat = [];
	function lineStart(){
	    
	    if(flightNum == 0){
		    tmap = new Tmap.Map({div:'map_div', width:'0px', height:'0px'});
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : zoom,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				center : center,
				mapTypeControl: false
			});
			zoom = 17;
			map.setZoom(zoom);
	    }
	   	
	    if(flightNum < listLonLat.length-1){
		
			flightListLonLat.push(listLonLat[flightNum++]);
			flightListLonLat.push(listLonLat[flightNum]);
	
	 		var center = new google.maps.LatLng(listLonLat[flightNum]);
			map.setCenter(center);
			
		    if(listLonLat.length != 0){
			var initflightPlanCoordinates = flightListLonLat;
				var initflightPath = new google.maps.Polyline({
					path : initflightPlanCoordinates,
					geodesic : true,
					strokeColor : '#FF0000',
					strokeOpacity : 1.0,
					strokeWeight : 4
				});
				
				initflightPath.setMap(map);
			}
	    } else{
			lineEnd();
	    }
	}
	
	function lineBack(){
	    if(flightNum == 0){
			lineEnd();
			return;
	    }
	    
	    tmap = new Tmap.Map({div:'map_div', width:'0px', height:'0px'});
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : zoom,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			center : center,
			mapTypeControl: false
		});
		zoom = 17;
		map.setZoom(zoom);
		
		
		var center = new google.maps.LatLng(listLonLat[--flightNum]);
		map.setCenter(center);
		flightListLonLat.splice(flightListLonLat.length-2,2);
	    console.log(flightListLonLat); 
		if(listLonLat.length != 0){
			var initflightPlanCoordinates = flightListLonLat;
				var initflightPath = new google.maps.Polyline({
					path : initflightPlanCoordinates,
					geodesic : true,
					strokeColor : '#FF0000',
					strokeOpacity : 1.0,
					strokeWeight : 4
				});
				
				initflightPath.setMap(map);
		}
		
		if(flightListLonLat.length == 0){
		    lineEnd(); 
		}
		
	}
	
	function lineEnd(){
	    flightNum=0;
	    flightListLonLat = [];
	    zoom = 13;
	    map.setZoom(zoom);
	    initialize();
	}
</script>
<!--  -->
<script type="text/javascript">
	$(window).load(function() {
		setTimeout(function() {
			$('#loading').fadeOut(400, "linear");
		}, 300);
	});
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
									alt="Profile image"> <span>Michael Lee</span> <i
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
												<span>Michael Lee <i>UX/UI developer</i></span> <a href="#"
													title="Edit profile">Edit profile</a> <a href="#"
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


					
					<div id="map" class="col-md-9" style="height: 100%;"
						ondragenter="return dragEnter(event)"
						ondrop="return dragDrop(event)"
						ondragover="return dragOver(event)">	
					</div>
						
					<div class="panel col-md-3"
						style="height: 100%; margin-bottom: 0px; padding-top: 60px; right: 0">
						<div class="panel-body" style="height: 100%">
							<!-- <h3 class="title-hero">Time Line</h3> -->
							<input type="button" value="start" onclick="javascript:lineStart()"/>
							<input type="button" value="end" onclick="javascript:lineEnd()"/>
							<div class="title">
								<h2>${ mymapVO.title }</h2>
								<p>by ${ mymapVO.userid }</p> 
								<p>${ mymapVO.content }</p>
								<p>
									<c:forEach var="hashtagList" items="${ hashtagList }">
										<strong>#${ hashtagList.name } </strong>
									</c:forEach>
								</p>
								<p>${ sdate }~${ edate }</p>
							</div>
							<div class="example-box-wrapper" style="height: 85%">
								<div class="timeline-box timeline-box-left scrollable-content scrollable-xs scrollable-nice"
									style="height: 100%">
									<c:forEach var="checkpointVO" items="${ checkpointVO }"
										varStatus="i">
										<!-- 타임라인 1개 -->
										<div class="tl-row" onClick="goZoomIn(${i.index})">
											<div class="tl-item float-right redline">
												<div class="tl-icon bg-red">
													<i class="icon-toggle-on">${i.index+1}</i>
												</div>
												<div class="popover right">
													<div class="arrow"></div>
													<div class="popover-content">
														<div class="tl-label bs-label label-info">${ checkpointVO.title }</div>
														<p class="tl-content">${ checkpointVO.content }</p>
														<div class="tl-time">
															<i class="glyph-icon icon-clock-o"></i> a few seconds ago
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>
					<div id="playIcon" style="background: white; left: 0; bottom:0; position: absolute; margin-left: 30%">   
						<i class="glyph-icon tooltip-button demo-icon icon-chevron-left" title="뒤로가기" onclick="javacscript:lineBack()"></i>
						<i class="glyph-icon tooltip-button demo-icon icon-repeat" title="취소" onclick="javascript:lineEnd()"></i>
						<i class="glyph-icon tooltip-button demo-icon icon-chevron-right" title="앞으로가기"  onclick="javascript:lineStart()"></i>
					</div>
					
					
					<div id="map_div"></div>  

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
		<!-- sockjs -->
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.min.js"></script>
		<!-- stomp -->
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	</div>
</body>
</html>