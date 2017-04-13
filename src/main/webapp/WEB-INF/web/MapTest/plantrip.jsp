<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/share.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY MAP ^_^</title>
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=bac4f916-3297-3be4-93ff-e37ae88b8f42"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6x6lwLmHlSpovbF0nM-fPIPpjfv4D9IM&libraries=places"></script>
<!-- 판넬 드래그에 필요함 -->
<script type='text/javascript'
	src="https://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

<script type="text/javascript">
   $(function() {
      var sortIndex;	// 선택된 div index의 listLonLat 좌표값
      var sortNum;		// 타임라인 div index 번호
	      /* 타임라인 판넬 드래그 */
		jQuery(function($) {
			var panelList = $('#draggablePanelList');
			panelList.sortable({
        		start: function(event, ui) { 
        		      sortIndex = listLonLat[ui.item.index()];
        		      sortNum = ui.item.index();
       			},
       			stop: function(event, ui) { 
       			    if(sortNum != ui.item.index()){
			      		   for(var i=0; i<listLonLat.length; i++){
								if(listLonLat[i].lat == sortIndex.lat && listLonLat[i].lng == sortIndex.lng){
								    sortNum = i;
								}
							}
	      		     	    listLonLat.splice(sortNum, 1);
	      		     	    sortNum = ui.item.index();
	      		     		listLonLat.splice(sortNum,0,sortIndex);
	      		     		change = false;
	      		     	initialize();
       			    }
     			},
				handle : '.panel-heading',
				update : function() {
					$('.panel', panelList).each(function(index, elem) {
						var $listItem = $(elem), newIndex = $listItem.index();
						//판넬 리스트 번호 관련
						// Persist the new indices.
					});
				}
			});
		});
     
      //leftmenu 토글
		$('.navbar-toggler').on('click', function(event) {
			event.preventDefault();
			$(this).closest('.navbar-minimal').toggleClass('open');
		})
   });
   
 
</script>

<style>
#rightside {
	float: none;
}

#bottomside {
	position: static;
	width: 300px;
	height: 500px;
	font-size: 10pt;
}

.controls {
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 300px;
}

#type-selector label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

.infoAppend {
	border: solid;
}

#addTimeInfo {
	border: solid;
}
/* 판넬헤더 클릭 드래그 */
#draggablePanelList .panel-heading {
	cursor: move;
}
/* 검색바 네비바에서 가운데 정렬을 위한 css */
.navbar .navbar-nav {
	display: inline-block;
	float: none;
}

.navbar .navbar-collapse {
	text-align: center;
}

.glyphicon {
	font-size: 50px;
}

#popular { /*  */
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
/* 판넬헤더 클릭 드래그 */
#draggablePanelList .panel-heading {
	cursor: move;
}

/* 좌 메뉴 */
#leftmenu {
	float: left;
}

.animate {
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.navbar-minimal {
	width: 60px;
	min-height: 60px;
	max-height: 100%;
	background-color: rgb(51, 51, 51);
	background-color: rgba(51, 51, 51, 0.8);
	border-width: 0px;
	z-index: 1000;
}

.navbar-minimal>.navbar-toggler {
	position: relative;
	min-height: 60px;
	border-bottom: 1px solid rgb(81, 81, 81);
	z-index: 100;
	cursor: pointer;
}

.navbar-minimal.open>.navbar-toggler, .navbar-minimal>.navbar-toggler:hover
	{
	background-color: rgb(158, 202, 59);
}

.navbar-minimal>.navbar-toggler>span {
	position: absolute;
	top: 50%;
	right: 50%;
	margin: -8px -8px 0 0;
	width: 16px;
	height: 16px;
	background-image:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjIuMSwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPgo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IgoJIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjMycHgiIHZpZXdCb3g9IjAgMCAxNiAzMiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMzIiIHhtbDpzcGFjZT0icHJlc2VydmUiPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZmlsbD0iI0ZGRkZGRiIgZD0iTTEsN2gxNGMwLjU1MiwwLDEsMC40NDgsMSwxcy0wLjQ0OCwxLTEsMUgxQzAuNDQ4LDksMCw4LjU1MiwwLDgKCVMwLjQ0OCw3LDEsN3oiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGw9IiNGRkZGRkYiIGQ9Ik0xLDEyaDE0YzAuNTUyLDAsMSwwLjQ0OCwxLDFzLTAuNDQ4LDEtMSwxSDFjLTAuNTUyLDAtMS0wLjQ0OC0xLTEKCVMwLjQ0OCwxMiwxLDEyeiIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZmlsbD0iI0ZGRkZGRiIgZD0iTTEsMmgxNGMwLjU1MiwwLDEsMC40NDgsMSwxcy0wLjQ0OCwxLTEsMUgxQzAuNDQ4LDQsMCwzLjU1MiwwLDMKCVMwLjQ0OCwyLDEsMnoiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGw9IiNGRkZGRkYiIGQ9Ik0xLjMzLDI4Ljk3bDExLjY0LTExLjY0YzAuNDU5LTAuNDU5LDEuMjA0LTAuNDU5LDEuNjYzLDAKCWMwLjQ1OSwwLjQ1OSwwLjQ1OSwxLjIwNCwwLDEuNjYzTDIuOTkzLDMwLjYzM2MtMC40NTksMC40NTktMS4yMDQsMC40NTktMS42NjMsMEMwLjg3MSwzMC4xNzQsMC44NzEsMjkuNDMsMS4zMywyOC45N3oiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGw9IiNGRkZGRkYiIGQ9Ik0yLjk5MywxNy4zM2wxMS42NDEsMTEuNjRjMC40NTksMC40NTksMC40NTksMS4yMDQsMCwxLjY2MwoJcy0xLjIwNCwwLjQ1OS0xLjY2MywwTDEuMzMsMTguOTkzYy0wLjQ1OS0wLjQ1OS0wLjQ1OS0xLjIwNCwwLTEuNjYzQzEuNzg5LDE2Ljg3MSwyLjUzNCwxNi44NzEsMi45OTMsMTcuMzN6Ii8+Cjwvc3ZnPgo=);
	background-repeat: no-repeat;
	background-position: 0 0;
	-webkit-transition: -webkit-transform .3s ease-out 0s;
	-moz-transition: -moz-transform .3s ease-out 0s;
	-o-transition: -moz-transform .3s ease-out 0s;
	-ms-transition: -ms-transform .3s ease-out 0s;
	transition: transform .3s ease-out 0s;
	-webkit-transform: rotate(0deg);
	-moz-transform: rotate(0deg);
	-o-transform: rotate(0deg);
	-ms-transform: rotate(0deg);
	transform: rotate(0deg);
}

.navbar-minimal>.navbar-menu {
	position: absolute;
	top: -1000px;
	left: 0px;
	margin: 0px;
	padding: 0px;
	list-style: none;
	z-index: 50;
	background-color: rgb(51, 51, 51);
	background-color: rgba(51, 51, 51, 0.8);
}

.navbar-minimal>.navbar-menu>li {
	margin: 0px;
	padding: 0px;
	border-width: 0px;
	height: 54px;
}

.navbar-minimal>.navbar-menu>li>div {
	position: relative;
	display: inline-block;
	color: rgb(255, 255, 255);
	padding: 20px 23px;
	text-align: left;
	cursor: pointer;
	border-bottom: 1px solid rgb(81, 81, 81);
	width: 100%;
	text-decoration: none;
	margin: 0px;
}

.navbar-minimal>.navbar-menu>li>div:last-child {
	border-bottom-width: 0px;
}

.navbar-minimal>.navbar-menu>li>div:hover {
	background-color: rgb(158, 202, 59);
}

.navbar-minimal>.navbar-menu>li>div>.glyphicon {
	float: right;
}

.navbar-minimal.open {
	width: 320px;
}

.navbar-minimal.open>.navbar-toggler>span {
	background-position: 0 -16px;
	-webkit-transform: rotate(-180deg);
	-moz-transform: rotate(-180deg);
	-o-transform: rotate(-180deg);
	-ms-transform: rotate(-180deg);
	transform: rotate(-180deg);
}

.navbar-minimal.open>.navbar-menu {
	top: 60px;
	width: 100%;
	min-height: 100%;
}

@media ( min-width : 768px) {
	.navbar-minimal.open {
		width: 60px;
	}
	.navbar-minimal.open>.navbar-menu {
		overflow: visible;
	}
	.navbar-minimal>.navbar-menu>li>div>.desc {
		position: absolute;
		display: inline-block;
		top: 50%;
		left: 130px;
		margin-top: -20px;
		/* ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss마진 */
		margin-left: 2px;
		text-align: left;
		white-space: nowrap;
		padding: 10px 13px;
		border-width: 0px !important;
		background-color: rgb(51, 51, 51);
		background-color: rgba(51, 51, 51, 0.8);
		opacity: 0;
	}
	.navbar-minimal>.navbar-menu>li>div>.desc:after {
		z-index: -1;
		position: absolute;
		top: 50%;
		left: -10px;
		margin-top: -10px;
		content: '';
		width: 0;
		height: 0;
		border-top: 10px solid transparent;
		border-bottom: 10px solid transparent;
		border-right: 10px solid rgb(51, 51, 51);
		border-right-color: rgba(51, 51, 51, 0.8);
	}
	.navbar-minimal>.navbar-menu>li>div:hover>.desc {
		left: 60px;
		opacity: 1;
	}
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/test.js"></script>


<script>
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
					var Fplace = {lat:Number(data.lat),lng:Number(data.lon)};
					if(favoritePlaceLonLat != null){
						favoritePlaceLonLat.setMap(null);
						if(favoritePlaceLonLat.position.lat().toFixed(7) == Fplace.lat && favoritePlaceLonLat.position.lng().toFixed(7) == Fplace.lng){
							return;
						}
					}
					goZoomIn(data.lat, data.lon);
					favoritePlaceLonLat = new google.maps.Marker({
						map : map,
						position : Fplace,
						icon : "https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png"
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
		
		// 타임라인 div 클릭시 센터좌표 이동
		function goZoomIn(lat, lng){
			var center = new google.maps.LatLng(lat, lng);
			map.setCenter(center);
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
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<form name="inputform"
			action="${ pageContext.request.contextPath }/map/planMymap.do">
			<br />
			<br />

			<div class="row">
				<div id="map" class="col-md-10"
					style="height: 850px; position: absolute;"
					ondragenter="return dragEnter(event)"
					ondrop="return dragDrop(event)" ondragover="return dragOver(event)">
				</div>

				<nav id="leftmenu" class="navbar navbar-minimal animate"
					role="navigation">
					<div class="navbar-toggler animate">
						<span class="menu-icon"></span>
					</div>
					<ul class="navbar-menu animate">
						<li><div class="animate">
								<div class="desc animate" style="overflow: auto; height: 600px; width: 300px;">
									<c:forEach var="mymapListPlanAndReg" items="${ mymapListPlanAndReg }">
										<c:if test="${ mymapListPlanAndReg.type == 1 }">
											<a href="javascript:mymapListPlanAndReg('${ mymapListPlanAndReg.idx }')"
											style="text-decoration: none; color: white;">${ mymapListPlanAndReg.title }</a><br/>
										</c:if>
									</c:forEach>
								</div> 
								<i class="fa fa-road" aria-hidden="true"></i>
							</div></li>
						<li><div class="animate">
								<div class="desc animate" style="overflow: auto; height: 600px; width: 300px;">
									<c:forEach var="mymapListPlanAndReg" items="${ mymapListPlanAndReg }">
										<c:if test="${ mymapListPlanAndReg.type == 2 }">
											<a href="javascript:mymapListPlanAndReg('${ mymapListPlanAndReg.idx }')"
											style="text-decoration: none; color: white;">${ mymapListPlanAndReg.title }</a><br/>
										</c:if>
									</c:forEach>
								</div> 
								<i class="fa fa-calendar" aria-hidden="true"></i>
							</div></li>
						<li><div class="animate">
								<div class="desc animate"
									style="overflow: auto; height: 600px; width: 300px;">
									<c:forEach var="mymapList" items="${ mymapList }">
										<a href="javascript:getMymap('${ mymapList.idx }')"
											style="text-decoration: none; color: white;">${ mymapList.title }</a>
										<br />
									</c:forEach>
								</div>
								<i class="fa fa-star-o" aria-hidden="true"></i>
							</div></li>
						<li><div class="animate">
								<div class="desc animate"
									style="overflow: auto; height: 600px; width: 300px;">
									<c:forEach var="favoriteplaceList"
										items="${ favoriteplaceList }">
										<a href="javascript:getMyplace('${ favoriteplaceList.checkpointidx }')"
											style="text-decoration: none; color: white;">${ favoriteplaceList.placename }</a>
										<br />
									</c:forEach>
								</div>
								<i class="fa fa-map-marker" aria-hidden="true"></i>
							</div></li>
					</ul>
				</nav>

				<div class="col-md-2"
					style="border: solid; float: right; margin-left: 0">
					<div>
						<input type="text" name="title" placeholder="제목"
							class="form-control" />
					</div>
					<div>
						<input type="text" name="content" placeholder="내용"
							class="form-control" />
					</div>
					<span class="col-md-2" draggable="true"
						ondragstart="return dragStart(event)"
						ondragend="return dragextramarker(event)"><img
						src="https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png" /></span>
					<div class="col-md-10">
						<input id="pac-input" class="form-control title-text" type="text"
							placeholder="Search Box">
					</div>
					<br /> <br />
					<div class="col-md-12"
						style="height: 696px; overflow: auto; border: solid;">
						<div id="draggablePanelList" class="list-unstyled"></div>
					</div>

					<div class="col-md-12">
						<button type="button" class="btn btn-secondary col-md-6"
							onclick="goSubmit()">등록</button>
						<button type="button" class="btn btn-secondary col-md-6">취소</button>
					</div>
				</div>

			</div>
			<br />
			<div class="row">
				<div class="col-md-10" style="border: solid; overflow: auto;">
					<h3>길찾기</h3>
					<span id="dragStart" draggable="true"
						ondragstart="return dragStart(event)"
						ondragend="return startDragEnd(event)"> <img
						src="https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png" />출발
					</span> <span id="dragEnd" draggable="true"
						ondragstart="return dragStart(event)"
						ondragend="return endDragEnd(event)"> <img
						src="https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png" />도착
					</span> <span><input type="button" value="자가용"
						onclick="findLoadAgain()" /></span> <span><input type="button"
						value="대중교통" onclick="calculateAndDisplayRoute()" /></span> <span><input
						type="button" value="도보" onclick="forWalk()" /></span> <input
						type="button" value=" 길찾기 종료 " onclick="closeSearch()"
						class="btn btn-secondary col-md-2" />
					<div id="addinfo"></div>
					<br />
				</div>
				<br />
			</div>
			<br /> <br /> <br />
			<div id="map_div"></div>
		</form>

	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>