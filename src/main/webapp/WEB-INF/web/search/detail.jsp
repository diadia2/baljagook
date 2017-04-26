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

</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="col-md-12" style="text-align: center;">
					<strong>${ mymapVO.title }</strong> <span style="font-size: 6pt">by
						${ mymapVO.userid }</span>
					<button id="followBtn" onclick="toFollow('${ mymapVO.userid }')">follow</button>
					<!-- 팝업에 인자 넘겨주기- 귀찮당 -->

					<form
						action="${ pageContext.request.contextPath }/message/insertMessage.do"
						method="POST">
						<input type="text" name="contents"> <input type="hidden"
							name="toId" value="${ mymapVO.userid }"> <input
							type="hidden" name="fromId" value="${sessionScope.user }">
						<input type="submit" id="message">
					</form>
					<button id="msgBtn" onclick="toMsg()">message</button>
				</div>
				<br /> <br />
				<div class="col-md-12" style="text-align: center;">내용 : ${ mymapVO.content }
				</div>
				<br /> <br />
				<div class='col-md-12' style="text-align: center;">
					<c:forEach var="hashtagList" items="${ hashtagList }">
						<strong>#${ hashtagList.name } </strong>
					</c:forEach>
				</div>
				<br /> <br />
				<div class='col-md-12' style="text-align: center;">${ sdate }
					~ ${ edate }</div>
				<br /> <br />
			</div>
			<div class="col-md-1"></div>
		</div>

		<div class="row">
			<div id="map" class="col-md-10" style="height: 850px;"
				ondragenter="return dragEnter(event)"
				ondrop="return dragDrop(event)" ondragover="return dragOver(event)">
			</div>
			<div class="col-md-2"
				style="overflow: auto; border: solid; height: 850px;">
				<div id="draggablePanelList" class="list-unstyled">
					<c:forEach var="checkpointVO" items="${ checkpointVO }"
						varStatus="i">
						<div id="addTimeInfo" class="panel panel-info"
							onClick="goZoomIn(${i.index})">
							<div class="panel-heading">${ checkpointVO.title }</div>
							<div class="panel-body">${ checkpointVO.content }</div>
						</div>
					</c:forEach>
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

		<!-- 즐찾 조회수 추천 신고 위치 잡아야함-->
		<div class="container">
			<div class="row">
				<div class="text-center">
					<a href="javascript:getFavoriteMap()"><i
						class="fa fa-heart fa-2x" aria-hidden="true"></i></a> <a href="#"><i
						class="fa fa-star-o fa-2x" aria-hidden="true"></i></a> <a href="#"><i
						class="fa fa-eye fa-2x" aria-hidden="true"></i></a> <a href="#"><i
						class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i></a>
					수정하면서 위치 바꿀예정
				</div>
			</div>
		</div>

		<!-- 댓글 부분 -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h3>Comment</h3>
				</div>
			</div>
			<div class="row">
				<!-- 프로필사진 -->
				<div class="col-sm-1">
					<div class="thumbnail">
						<img class="img-responsive user-photo"
							src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>myusername</strong> <span class="text-muted">commented
								5 days ago</span>
						</div>
						<div class="panel-body">Panel contentssssssssssssssssss ssss</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 프로필사진 -->
				<div class="col-sm-1">
					<div class="thumbnail">
						<img class="img-responsive user-photo"
							src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>myusername</strong> <span class="text-muted">commented
								5 days ago</span>
						</div>
						<div class="panel-body">Panel contentssssssssssssssssss ssss</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 프로필사진 -->
				<div class="col-sm-1">
					<div class="thumbnail">
						<img class="img-responsive user-photo"
							src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>myusername</strong> <span class="text-muted">commented
								5 days ago</span>
						</div>
						<div class="panel-body">Panel contentssssssssssssssssss ssss</div>
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<input type="text" class="form-control title-text" placeholder="댓글">
			</div>
			<div class="col-sm-5">
				<a class="text-muted" href="#"><i class="fa fa-comment fa-2x"></i></a>
			</div>


		</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>