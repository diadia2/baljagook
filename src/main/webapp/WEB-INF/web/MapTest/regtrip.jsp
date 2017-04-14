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

	$(document).ready(function(){
		var form = document.inputform;
		form.title.value = "${title}";
		form.content.value = "${content}";
		form.hashtag.value = "${hashtag}";
		
		
		$("#mapAgain").click(function(){
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
		})	
	});
       
   $(function() {
      /* datetimepicker부분 */
      $('#datetimepicker1').datetimepicker({
         useCurrent : false,
         sideBySide : true,
         maxDate : moment(),
         defaultDate : '${start}',
         format : 'YYYY-MM-DD HH:mm'
      });
      $('#datetimepicker2').datetimepicker({
         useCurrent : false,
         sideBySide : true,
         maxDate : moment(),
         minDate : '${start}',
         defaultDate : '${end}',
         format : 'YYYY-MM-DD HH:mm'
      });
      $("#datetimepicker1").on("dp.show", function(e) {
         $('#datetimepicker1').data("DateTimePicker").maxDate($('#end').val());
      });
      $("#datetimepicker2").on("dp.show", function(e) {
         $('#datetimepicker2').data("DateTimePicker").minDate($('#start').val());
      });
      
   });
   

</script>
</head>
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

body {
	padding-top: 55px;
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

#draggablePanelList .panel-heading {
	cursor: move;
}
</style>

<script type="text/javascript">
 
    // 시간별 좌표 불러오기
    var listLonLat = new Array();
    <c:forEach items="${list}" var="list">
    	listLonLat.push({lat:${list.lat},lng:${list.lon},idk:${list.idk}});
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
		for(var i=0; i<checkMarker.length; i++){
		    if(checkMarker[i].title != ""){
				$('#draggablePanelList').append('<div id="addTimeInfo" class="panel panel-info" onClick="goZoomIn('+checkMarker[i].position.lat()+", "+checkMarker[i].position.lng()+')"><div class="panel-heading"><input class="form-control" type="text" value="'+checkMarker[i].title+'"/></div><div class="panel-body"><input type="text" class="form-control" value="'+checkMarker[i].content+'"/></div></div>');
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
							    checkpointList:checkpointList[j].idx
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
											    (this.num+1)+". "+this.title+'<br/>'+this.content+
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
									    checkpointList:checkpointList[j].idx
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
										    content: (this.num+1)+". "+this.title+'<br/>'+this.content+
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
							    title:""
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


<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<form name="inputform"
			action="${ pageContext.request.contextPath }/map/regMymap.do">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="col-md-12">
						<input name="title" type="text" class="form-control title-text"
							placeholder="제목">
					</div>
					<br /> <br />
					<div class="col-md-12">
						<input name="content" type="text" class="form-control title-text"
							placeholder="설명">
					</div>
					<br /> <br />
					<div class='col-md-5'>
						<div class="form-group">
							<div class='input-group date' id='datetimepicker1'>
								<input type='text' class="form-control" name="start" id="start" />
								<span class="input-group-addon"> <i
									class="fa fa-calendar" aria-hidden="true"></i>
								</span>
							</div>
						</div>
					</div>
					<div class='col-md-5'>
						<div class="form-group">
							<div class='input-group date' id='datetimepicker2'>
								<input type='text' class="form-control" name="end" id="end" />
								<span class="input-group-addon"> <i
									class="fa fa-calendar" aria-hidden="true"></i></span>
							</div>
						</div>
					</div>
					<div class='col-md-2'>
						<div class="form-group">
							<div class="col-md-12">
								<input id="mapAgain" type="button" value="재선택"
									class="btn btn-secondary col-md-12" />
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<input name="hashtag" type="text" class="form-control title-text"
							placeholder="#해쉬태그">
					</div>
					<div class="col-md-12">
						해쉬태그 출력될곳<br /> <br />
					</div>

				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row">
				<div id="map" class="col-md-10" style="height: 756px"
					ondragenter="return dragEnter(event)"
					ondrop="return dragDrop(event)" ondragover="return dragOver(event)"></div>
				<div class="col-md-2">
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
						<br />
						<div id="draggablePanelList" class="list-unstyled"></div>
					</div>

					<div class="col-md-12">
						<button type="button" class="btn btn-secondary col-md-6"
							onclick="goSubmit()">등록</button>
						<button type="button" class="btn btn-secondary col-md-6">취소</button>
					</div>
				</div>

			</div>
			<br /> <br /> <br />
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-8"
					style="border: solid; overflow: auto; width: 800px">
					<h3>길찾기</h3>
					<span id="dragStart" draggable="true"
						ondragstart="return dragStart(event)"
						ondragend="return startDragEnd(event)"> <img
						src="http://openmap2.tmap.co.kr/start.png" />출발
					</span> <span id="dragEnd" draggable="true"
						ondragstart="return dragStart(event)"
						ondragend="return endDragEnd(event)"> <img
						src="http://openmap2.tmap.co.kr/arrival.png" />도착
					</span> <span><input type="button" value="자가용"
						onclick="findLoadAgain()" /></span> <span><input type="button"
						value="대중교통" onclick="calculateAndDisplayRoute()" /></span> <span><input
						type="button" value="도보" onclick="forWalk()" /></span>
					<div class="col-md-12">
						<input type="button" value=" 길찾기 종료 " onclick="closeSearch()"
							class="btn btn-secondary col-md-6" />
					</div>
					<br />--------------------------------------------
					<div id="addinfo"></div>
				</div>
				<div class="col-md-1"></div>
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