<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/share.jsp" %>
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
      var sortIndex;   // 선택된 div index의 listLonLat 좌표값
      var sortNum;      // 타임라인 div index 번호
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
#leftmenu{
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

<script type="text/javascript">
 
    // 시간별 좌표 불러오기
    var listLonLat = new Array();
   var change = true;
    var zoom = 13;
    
   var routeLayer, routeLayerWalk, tmap, map;
   var startX, startY, endX, endY;
   var first, second;               // 길찾기 첫번째, 두번째 좌표
   var startMarker, endMarker;         // 길찾기 시작마커, 도착마커
   var startMarkers = [];
   var endMarkers = [];            // 도착 좌표
   var startLocation, endLocation;      // 길찾기 시작좌표, 도착좌표
   var flightPaths = [];
   var flightPathsWalk = [];
   var extraMarker;
   var f = 0;
   var extraflag = 0;               // 마커 직접 추가 flag
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
            
            if(checkMarker.length != 0){   // 라인 마커가 있으면
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
//      $('#draggablePanelList').children().remove();
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
      $('#addinfo').children().remove();         // 길찾기 정보 리셋
      for(var i=0; i<flightPaths.length; i++)      // 자동차 라인 리셋
           flightPaths[i].setMap(null);
      if(directionsDisplay!=null)               // 교통수단 라인 리셋
         directionsDisplay.setMap(null);
       for(var i=0; i<flightPathsWalk.length; i++)   // 도보 라인 리셋
         flightPathsWalk[i].setMap(null);
/*       for(var i=0; i<startMarkers.length; i++)   // 출발 마커 리셋
         startMarkers[i].setMap(null); 
      for(var i=0; i<endMarkers.length; i++)      // 도착 마커 리셋
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
/*출발*/          $('#addinfo').append('<div class="InfoAppend">'+((routeLayer.features[i].attributes.totalDistance)/1000).toFixed(1)+'km. 약 '+((routeLayer.features[i].attributes.totalTime)/60).toFixed(0)+'분</div>');
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/start.png" /> '+routeLayer.features[i].attributes.description+'<br/></div>');
/*도착*/      } else if(routeLayer.features[i].attributes.turnType == "201"){
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/arrival.png"/> '+routeLayer.features[i].attributes.description+'<br/></div>');            
/*좌회전*/   } else if(routeLayer.features[i].attributes.turnType == "12" || routeLayer.features[i].attributes.turnType == "16" || routeLayer.features[i].attributes.turnType == "17"){
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/left.PNG" /><br/></div>');            
/*우회전*/   } else if(routeLayer.features[i].attributes.turnType == "13" || routeLayer.features[i].attributes.turnType == "18" || routeLayer.features[i].attributes.turnType == "19"){
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/right.PNG" /><br/></div>');            
/*유턴*/      } else if(routeLayer.features[i].attributes.turnType == "14"){
            $('#addinfo').append('<div class="InfoAppend" style="border:"1px solid"; float:left; height:60px; text-decoration: underline;"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/uturn.PNG"/><br/></div>');            
/*직진*/      } else if(routeLayer.features[i].attributes.turnType == "11" || routeLayer.features[i].attributes.turnType == "51"){
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayer.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/go.PNG"/<br/></div>');            
/*그외*/      } else {
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
/*출발*/          $('#addinfo').append('<div class="InfoAppend">'+((routeLayerWalk.features[i].attributes.totalDistance)/1000).toFixed(1)+'km. 약 '+((routeLayerWalk.features[i].attributes.totalTime)/60).toFixed(0)+'분</div>');
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/start.png" /> '+routeLayerWalk.features[i].attributes.description+'<br/></div>');
/*도착*/      } else if(routeLayerWalk.features[i].attributes.turnType == "201"){
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/arrival.png"/> '+routeLayerWalk.features[i].attributes.description+'<br/></div>');            
/*좌회전*/   } else if(routeLayerWalk.features[i].attributes.turnType == "12" || routeLayerWalk.features[i].attributes.turnType == "16" || routeLayerWalk.features[i].attributes.turnType == "17"){
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/left.PNG" /><br/></div>');            
/*우회전*/   } else if(routeLayerWalk.features[i].attributes.turnType == "13" || routeLayerWalk.features[i].attributes.turnType == "18" || routeLayerWalk.features[i].attributes.turnType == "19"){
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/right.PNG" /><br/></div>');            
/*유턴*/      } else if(routeLayerWalk.features[i].attributes.turnType == "14"){
            $('#addinfo').append('<div class="InfoAppend" style="border:"1px solid"; float:left; height:60px; text-decoration: underline;"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/uturn.PNG"/><br/></div>');            
/*직진*/      } else if(routeLayerWalk.features[i].attributes.turnType == "11"){
            $('#addinfo').append('<div class="InfoAppend"><img src="http://openmap2.tmap.co.kr/point.png"/>'+routeLayerWalk.features[i].attributes.description+'<img src="${ pageContext.request.contextPath }/resources/images/go.PNG"/<br/></div>');            
/*그외*/      } else {
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
      $('#addinfo').children().remove();         // 길찾기 정보 리셋
      for(var i=0; i<flightPaths.length; i++)      // 자동차 라인 리셋
           flightPaths[i].setMap(null);
      if(directionsDisplay!=null)               // 교통수단 라인 리셋
         directionsDisplay.setMap(null);
       for(var i=0; i<flightPathsWalk.length; i++)   // 도보 라인 리셋
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
         travelMode : google.