<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Simple markers</title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6x6lwLmHlSpovbF0nM-fPIPpjfv4D9IM"></script>
<script>
	window.onload = function(){
	    initMap();
	}

    function initMap() {
		var myLatLng = {
		    lat : ${ regcoordinatesVO.lat },
		    lng : ${ regcoordinatesVO.lon }
		};
	
		var map = new google.maps.Map(document.getElementById('map'), {
		    zoom : 13,
		    center : myLatLng
		});
	 
		var marker = new google.maps.Marker({
		    position : myLatLng,
		    map : map
		});
    } 
</script>
</head>
<body>
	<div id="map"></div>
</body>
</html>