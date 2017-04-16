/**
 * 
 */

// 시간별 좌표 불러오기
    var listLonLat = new Array();
	var change = true;
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
							strokeColor : '#FF0000',
							strokeOpacity : 1.0,
							strokeWeight : 3
						});
						mymapPath.setMap(null);
						mymapPath.setMap(map);
				}
			}
			
			 /////////////////////		    
			if(mymapCheckpointList.length != 0){
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
		center = new google.maps.LatLng(lat, lng);
		map.setCenter(center);
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
			label : "출발",
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
			label : "도착",
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