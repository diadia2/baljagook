<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/resources/admin/assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/admin/assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Material Dashboard by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath }/resources/admin/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="${pageContext.request.contextPath }/resources/admin/assets/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath }/resources/admin/assets/css/demo.css" rel="stylesheet" />

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sub.css">
	
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */

      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
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
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 300px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #target {
        width: 345px;
      }
</style>    

</head>

<body>

	<div class="wrapper">
	    <div class="sidebar" data-color="purple" data-image="${pageContext.request.contextPath }/resources/admin/assets/img/sidebar-1.jpg">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo">
				<a href="${pageContext.request.contextPath }" class="simple-text">
					발자국
				</a>
			</div>

	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/dashboard.do">
	                        <i class="material-icons">dashboard</i>
	                        <p>대시보드</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/memberlist.do">
	                        <i class="material-icons">content_paste</i>
	                        <p>회원 관리</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/boardlist.do">
	                        <i class="material-icons">library_books</i>
	                        <p>게시글 관리</p>
	                    </a>
	                </li>
	               	<li class="active">
	                    <a href="${pageContext.request.contextPath }/admin/adv.do">
	                        <i class="material-icons">location_on</i>
	                        <p>광고 관리</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/faq.do">
	                        <i class="material-icons">bubble_chart</i>
	                        <p>FAQ</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
		</div>

	    <div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button> 
						<a class="navbar-brand" href="#">Add advertisement</a>
					</div>
				</div>
			</nav>
			
			<input id="pac-input" class="controls" type="text" placeholder="Search Box">
			<div id="map" style="position:absolute;"></div>

		<div class="container">
				<div class="lpop">
					<span class="btnx"><a>×</a></span>
					<div class="contentview">
						<form action="${ pageContext.request.contextPath }/admin/regAdv.do" method="POST" name="inputform" enctype="multipart/form-data">
							<div class="row">	
								<div class='col-md-1'></div>
									<div class='col-md-10'>
										<input type="text" name="name" id="name" class="form-control" placeholder="업체명" />
									</div>
								<div class='col-md-1'></div>
							</div>	
							<div class="row">	 
								<div class='col-md-1'></div>
									<div class='col-md-10'>
										<input type="text" name="detail" id="detail" class="form-control" placeholder="업체소개" />
									</div>
								<div class='col-md-1'></div>
							</div>
							<div class="row">
								<div class='col-md-1'></div>
									<div class='col-md-10'>
										<input type="file" name="photo"/>
									</div>
								<div class='col-md-1'></div>
							</div>
							<button id="reg" class="btn btn-primary">등록하기</button>
							<input type="hidden" name="lat"/>
							<input type="hidden" name="lon"/>
						</form>
					</div>
				</div>
		    </div>
	  	</div>  
	</div>

</body>

	<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6x6lwLmHlSpovbF0nM-fPIPpjfv4D9IM&libraries=places"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/material-dashboard.js"></script>
	
	<script type="text/javascript">
		var listLonLat = new Array();
		var advMarkers = new Array();
		
	    <c:forEach items="${AdvertisementList}" var="AdvertisementList">
	    	listLonLat.push({lat:${AdvertisementList.lat},
				    	    lng:${AdvertisementList.lon},
				    	    oriname:'${AdvertisementList.oriname}',
				    	    newname:'${AdvertisementList.newname}',
				    	    name:'${AdvertisementList.name}',
				    	    detail:'${AdvertisementList.detail}'
				    	    });
	    </c:forEach>
	 
	</script> 
    <script>
        $().ready(function(){
            initialize();
        });
        
        $(".lpop").hide();
        
        $(".btnx").click(function() {
	  		$(".lpop").hide();
		});
        
        var center = {lat : 37.56461982743129, lng : 126.9823439963945};
        var markers = [];
        var infowindow;
        
        function initialize() {
            var map = new google.maps.Map(document.getElementById('map'), {
              center: center,
              zoom: 13,
              mapTypeId: 'roadmap',
              mapTypeControl: false,
			  zoomControl: false,
			  streetViewControl: false
            });
            if(listLonLat.length != 0){
	            
        		for(var i=0; i<listLonLat.length; i++){
		        	advMarkers.push(new google.maps.Marker({
	                    map: map,
	                    icon : 'http://maps.google.com/mapfiles/kml/paddle/blu-circle.png',
	                    position: listLonLat[i],
	                    oriname: listLonLat[i].oriname,
	                    newname: listLonLat[i].newname,
	                    name: listLonLat[i].name,
	                    detail: listLonLat[i].detail
	                }));
		        	var listener3 = google.maps.event.addListener(advMarkers[i], 'click', function(){
			        	    if(infowindow != null){
						 		infowindow.close();
					  		}
				  			infowindow = new google.maps.InfoWindow({
					    		content: '<img src="${ pageContext.request.contextPath }/resources/advphoto/'+this.newname+'" width="200px" height="200px"/><br/>'+
					    			'업체명 : '+this.name+'<br/>'+'소개 : '+this.detail
					  }); 
				  			infowindow.open(map, this);
			 		}); 
	            }
        		
            }            
            var listener2 = google.maps.event.addListener(map, 'click', function(){
        		$(".lpop").hide();
            });
            
            // Create the search box and link it to the UI element.
            var input = document.getElementById('pac-input');
            var searchBox = new google.maps.places.SearchBox(input);
            map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

            // Bias the SearchBox results towards current map's viewport.
            map.addListener('bounds_changed', function() {
              searchBox.setBounds(map.getBounds());
            });

            // Listen for the event fired when the user selects a prediction and retrieve
            // more details for that place.
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
                if (!place.geometry) {
                  console.log("Returned place contains no geometry");
                  return;
                }

                // Create a marker for each place.
                markers.push(new google.maps.Marker({
                  map: map,
                  title: place.name,
                  position: place.geometry.location
                }));

                markers.forEach(function(marker){
                    var listener6 = google.maps.event.addListener(marker, 'click', function(mouseEvent){
					
						  document.inputform.lat.value = mouseEvent.latLng.lat().toFixed(7);
						  document.inputform.lon.value = mouseEvent.latLng.lng().toFixed(7);
						  $(".lpop").show();
						  
				 	 }); 
                });
                
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
    </script> 

</html>
