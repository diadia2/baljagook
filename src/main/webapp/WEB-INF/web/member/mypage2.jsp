<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
#loading .svg-icon-loader {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -50px 0 0 -50px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title>View profile</title>
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
<script type="text/javascript">
	$(window).load(function() {
		setTimeout(function() {
			$('#loading').fadeOut(400, "linear");
		}, 300);
	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
	
	    // mymap
		$.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/member/getMymapList.do',
		    dataType : 'json',
		    success: function(data) {
			$('mymapInfo').children().remove();
				console.log(data);
				console.log(data[0].length);
				console.log(data[0][0].content); // mymap 0번째의 내용
				console.log(data[0][0].idx);	 // mymap 0번째 인덱스
				console.log(data[1]);			 // reglist들의 list
				console.log(data[1][data[0][0].idx]);	// reglist들의 list의 0번째 리스트
				console.log(data[1][data[0][0].idx][0].lat);	// reglist들의 list의 0번째 리스트의 0번째 lat
				var lonlat = "";
				for(i=0; i<data[0].length; i++){
				    for(j=0; j<data[1][data[0][i].idx].length; j++){
						lonlat += data[1][data[0][i].idx][j].lat;
						lonlat += ",";
						lonlat += data[1][data[0][i].idx][j].lon;
						if(j != (data[1][data[0][i].idx].length)-1){
						    lonlat += "|";
						}
				    }
					$('#mymapInfo').append('<div class="col-lg-3 col-md-4 col-sm-6"><div class="thumbnail-box-wrapper"><div class="thumbnail-box"><a class="thumb-link" href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[0][i].idx+'" title=""></a><div class="thumb-content"><div class="center-vertical"><div class="center-content">'+
						'<i class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i></div></div></div><div class="thumb-overlay bg-black"></div><img src="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|'+
							lonlat+'&size=400x400&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc" alt=""></div><div class="thumb-pane"><h3 class="thumb-heading animated rollIn"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[0][i].idx+'" title="">'+data[0][i].title+'</a> <small>'+data[0][i].regdate
							+'</small></h3></div></div></div>');
					lonlat = "";
				}
	        }
		});	
		
	    // myplan
		$.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/member/getMyPlanList.do',
		    dataType : 'json',
		    success: function(data) {
			$('myplanInfo').children().remove();
				console.log(data);
				console.log(data[0].length);
				console.log(data[0][0].content); // mymap 0번째의 내용
				console.log(data[0][0].idx);	 // mymap 0번째 인덱스
				console.log(data[1]);			 // reglist들의 list
				console.log(data[1][data[0][0].idx]);	// reglist들의 list의 0번째 리스트
				console.log(data[1][data[0][0].idx][0].lat);	// reglist들의 list의 0번째 리스트의 0번째 lat
				var lonlat = "";
				for(i=0; i<data[0].length; i++){
				    for(j=0; j<data[1][data[0][i].idx].length; j++){
						lonlat += data[1][data[0][i].idx][j].lat;
						lonlat += ",";
						lonlat += data[1][data[0][i].idx][j].lon;
						if(j != (data[1][data[0][i].idx].length)-1){
						    lonlat += "|";
						}
				    }
					$('#myplanInfo').append('<div class="col-lg-3 col-md-4 col-sm-6"><div class="thumbnail-box-wrapper"><div class="thumbnail-box"><a class="thumb-link" href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[0][i].idx+'" title=""></a><div class="thumb-content"><div class="center-vertical"><div class="center-content">'+
						'<i class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i></div></div></div><div class="thumb-overlay bg-black"></div><img src="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|'+
							lonlat+'&size=400x400&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc" alt=""></div><div class="thumb-pane"><h3 class="thumb-heading animated rollIn"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[0][i].idx+'" title="">'+data[0][i].title+'</a> <small>'+data[0][i].regdate
							+'</small></h3></div></div></div>');
					lonlat = "";
				}
	        }
		});	
	    
	    
		//favorite Map
		$.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/member/getFavoriteMapList.do',
		    dataType : 'json',
		    success: function(data) {
			$('favoritemap').children().remove();
				console.log(data);
				console.log(data[0].length);
				console.log(data[0][0].content); // mymap 0번째의 내용
				console.log(data[0][0].idx);	 // mymap 0번째 인덱스
				console.log(data[1]);			 // reglist들의 list
				console.log(data[1][data[0][0].idx]);	// reglist들의 list의 0번째 리스트
				console.log(data[1][data[0][0].idx][0].lat);	// reglist들의 list의 0번째 리스트의 0번째 lat
				var lonlat = "";
				for(i=0; i<data[0].length; i++){
				    for(j=0; j<data[1][data[0][i].idx].length; j++){
						lonlat += data[1][data[0][i].idx][j].lat;
						lonlat += ",";
						lonlat += data[1][data[0][i].idx][j].lon;
						if(j != (data[1][data[0][i].idx].length)-1){
						    lonlat += "|";
						}
				    }
					$('#favoritemap').append('<div class="col-lg-4 col-md-4 col-sm-6"><div class="thumbnail-box-wrapper"><div class="thumbnail-box"><a class="thumb-link" href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[0][i].idx+'" title=""></a><div class="thumb-content"><div class="center-vertical"><div class="center-content">'+
						'<i class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i></div></div></div><div class="thumb-overlay bg-black"></div><img src="https://maps.googleapis.com/maps/api/staticmap?path=color:0xff0000cc|weight:3|'+
							lonlat+'&size=400x400&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc&style=feature:water|color:0x1C91C4cc" alt=""></div><div class="thumb-pane"><h3 class="thumb-heading animated rollIn"><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx='+data[0][i].idx+'" title=""><small>'+data[0][i].title+'</small></a></h3></div></div></div>');
					lonlat = "";
				}
	        }
		});	
	
		//favorite Place
		$.ajax({
		    type: 'POST' , 
		    url: '${ pageContext.request.contextPath }/member/getFavoritePlaceList.do',
		    dataType : 'json',
		    success: function(data) {
			$('favoriteplace').children().remove();
				var lonlat = "";
				for(i=0; i<data[0].length; i++){
				    lonlat += data[1][i].lat;
				    lonlat += ",";
				    lonlat += data[1][i].lon;
					$('#favoriteplace').append('<div class="col-lg-4 col-md-4 col-sm-6"><div class="thumbnail-box-wrapper"><div class="thumbnail-box"><a class="thumb-link" href="javascript:myPlace('+data[0][i].checkpointidx+')" title=""></a><div class="thumb-content"><div class="center-vertical"><div class="center-content">'+
						'<i class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i></div></div></div><div class="thumb-overlay bg-black"></div><img src="https://maps.googleapis.com/maps/api/staticmap?center='+lonlat+'&zoom=19&size=400x400&markers=color:red|'+
							lonlat+'&key=AIzaSyDVbk7aW8HrEqozbZcMDZDBDP77uGJGduc" alt=""></div><div class="thumb-pane"><h3 class="thumb-heading animated rollIn"><a href="#" title=""><small>'+data[0][i].placename+'</small></a></h3></div></div></div>'); 
					lonlat = "";
				}
	        }
		});	
		
	});
	
	function myPlace(checkpointidx) {

		window.open("${ pageContext.request.contextPath }/member/favoritePlace.do?checkpointidx="
					+ checkpointidx, "FavoritePlace", "top=10, width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");

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
									alt="Profile image"> <span>admin</span> <i
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
												<span>admin</span> <a href="#" title="my page"><span>my
														page</span></a> <br /> <a href="#" title="message "><span>message</span></a>
											</div>
										</div>
										<div class="divider"></div>
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
										class="input-group-btn"><a href="#" class="hdr-btn"><i
											class="glyph-icon icon-search"></i></a></span>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/uniform/uniform.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/uniform/uniform-demo.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/tabs/tabs.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/chosen/chosen.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/chosen/chosen-demo.js"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/input-switch/inputswitch.js"></script>
					<script type="text/javascript">
						/* Input switch */

						$(function() {
							"use strict";
							$('.input-switch').bootstrapSwitch();
						});
					</script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/textarea/textarea.js"></script>
					<script type="text/javascript">
						/* Textarea autoresize */

						$(function() {
							"use strict";
							$('.textarea-autosize').autosize();
						});
					</script>
					<div class="row mailbox-wrapper">
						<div class="col-md-4">
							<div class="panel-layout">
								<div class="panel-box">
									<div class="panel-content image-box" style="max-height: 200px;">
										<div class="ribbon">
											<div class="bg-primary">Ribbon</div>
										</div>
										<div class="image-content font-white">
											<div class="meta-box meta-box-bottom">
												<img
													src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg"
													alt="" class="meta-image img-bordered img-circle">
												<h3 class="meta-heading">${sessionScope.user }</h3>
											</div>
										</div>
										<img
											src="${pageContext.request.contextPath }/resources/assets/image-resources/blurred-bg/blurred-bg-13.jpg"
											alt="">
									</div>
									<div class="panel-content pad15A bg-white radius-bottom-all-4">
										<div class="clear profile-box">
											<ul class="nav nav-pills nav-justified">
												<li><a href="#" class="btn btn-sm bg-google"><span
														class="glyph-icon icon-separator"><i
															class="glyph-icon icon-google-plus"></i></span> <span
														class="button-content">Google+</span></a></li>
												<li><a href="#" class="btn btn-sm bg-facebook"><span
														class="glyph-icon icon-separator"><i
															class="glyph-icon icon-facebook"></i></span> <span
														class="button-content">Facebook</span></a></li>
												<li><a href="#" class="btn btn-sm bg-twitter"><span
														class="glyph-icon icon-separator"><i
															class="glyph-icon icon-twitter"></i></span> <span
														class="button-content">Twitter</span></a></li>
											</ul>
										</div>
										<div class="mrg15T mrg15B"></div>
									</div>
								</div>
							</div>
							<div class="content-box mrg15B">
								<h3 class="content-box-header clearfix">
									Follow online
									<div class="font-size-11 float-right">
										<a href="#" title=""><i
											class="glyph-icon mrg5R opacity-hover icon-plus"></i></a> <a
											href="#" title=""><i
											class="glyph-icon opacity-hover icon-cog"></i></a>
									</div>
								</h3>
								<div class="content-box-wrapper text-center clearfix">
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial1.jpg"
											alt="">
										<div class="small-badge bg-red"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial2.jpg"
											alt="">
										<div class="small-badge bg-orange"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial3.jpg"
											alt="">
										<div class="small-badge bg-red"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial4.jpg"
											alt="">
										<div class="small-badge bg-green"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial5.jpg"
											alt="">
										<div class="small-badge bg-orange"></div>
									</div>
									<div class="status-badge mrg10A">
										<img class="img-circle" width="40"
											src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial6.jpg"
											alt="">
										<div class="small-badge bg-red"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="example-box-wrapper">
								<ul class="list-group row list-group-icons">
									<li class="col-md-3 active"><a href="#tab-example-1"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon icon-dashboard"></i> Account Settings</a></li>
									<li class="col-md-3"><a href="#tab-example-2"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-primary icon-camera"></i> My Map</a></li>
									<li class="col-md-3"><a href="#tab-example-3"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-blue-alt icon-globe"></i> My Plan</a></li>
									<li class="col-md-3"><a href="#tab-example-4"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-red icon-bullhorn"></i> Favorites </a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane pad0A fade active in" id="tab-example-1">
										<div class="row">
											<div class="col-md-6">
												<div class="content-box mrg15B">
													<h3 class="content-box-header clearfix text-center">
														Change Password</h3>
													<div class="content-box-wrapper pad0T clearfix">
														<form class="form-horizontal pad15L pad15R bordered-row">
															<div class="form-group">
																<label class="col-sm-6 control-label">Old
																	password:</label>
																<div class="col-sm-6">
																	<input type="text" class="form-control" id=""
																		placeholder="">
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-6 control-label">New
																	password:</label>
																<div class="col-sm-6">
																	<input type="text" class="form-control" id=""
																		placeholder="">
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-6 control-label">Repeat
																	password:</label>
																<div class="col-sm-6">
																	<input type="text" class="form-control" id=""
																		placeholder="">
																</div>
															</div>
														</form>
													</div>
													<div class="button-pane mrg20T">
														<button class="btn btn-success">Update Password</button>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="content-box">
													<h3 class="content-box-header clearfix text-center">
														Account Settings</h3>
													<form
														class="form-horizontal clearfix pad15L pad15R pad20B bordered-row">
														<div class="form-group">
															<label class="col-sm-7 control-label">Enable
																message:</label>
															<div class="col-sm-3">
																<input type="checkbox" data-on-color="danger"
																	data-size="small" name="checkbox-example-1"
																	class="input-switch" data-on-text="On"
																	data-off-text="Off">
															</div>
														</div>
														<div class="form-group col-sm-12 text-center">
															<div class="fileinput-preview thumbnail"
																data-trigger="fileinput"
																style="width: 200px; height: 150px"></div>
															<br /> <br />
															<button class="btn btn-success" onclick="uploadImage();">사진
																업로드</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<link rel="stylesheet" type="text/css"
										href="${pageContext.request.contextPath }/resources/assets/frontend-elements/portfolio-navigation.css">
									<script type="text/javascript"
										src="${pageContext.request.contextPath }/resources/assets/widgets/mixitup/mixitup.js"></script>
									<script type="text/javascript"
										src="${pageContext.request.contextPath }/resources/assets/widgets/mixitup/images-loaded.js"></script>
									<script type="text/javascript"
										src="${pageContext.request.contextPath }/resources/assets/widgets/mixitup/isotope.js"></script>
									<script type="text/javascript"
										src="${pageContext.request.contextPath }/resources/assets/widgets/mixitup/portfolio-demo.js"></script>
									
									<div class="tab-pane fade" id="tab-example-2">
										<div class="panel-body" style="background-color: white;">
											<div class="example-box-wrapper">
												<div id="mymapInfo" class="row">
 													<div class="col-lg-3 col-md-4 col-sm-6">
														<div class="thumbnail-box-wrapper">
															<div class="thumbnail-box">
																<a class="thumb-link" href="#" title="" style="border: 2px solid"></a>
																<div class="thumb-content">
																	<div class="center-vertical">
																		<div class="center-content">
																			<i class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i>
																		</div>
																	</div>
																</div>
																<div class="thumb-overlay bg-black"></div>
																<img src="${ pageContext.request.contextPath }/resources/images/click.jpg" alt="">
															</div>
															<div class="thumb-pane">
																<h3 class="thumb-heading animated rollIn">
																	<a href="#" title="">새로 등록하기</a> <small>Create Map</small>
																</h3>
															</div>
														</div>
													</div> 													
												</div>
											</div>
										</div>
									</div> 
									<div class="tab-pane fade" id="tab-example-3">
										<div class="panel-body" style="background-color: white;">
											<div class="example-box-wrapper">
												<div id="myplanInfo" class="row">
 													<div class="col-lg-3 col-md-4 col-sm-6">
														<div class="thumbnail-box-wrapper">
															<div class="thumbnail-box">
																<a class="thumb-link" href="${pageContext.request.contextPath}/map/plantrip.do" title="" style="border: 2px solid"></a>
																<div class="thumb-content">
																	<div class="center-vertical">
																		<div class="center-content">
																			<i class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i>
																		</div>
																	</div>
																</div>
																<div class="thumb-overlay bg-black"></div>
																<img src="${ pageContext.request.contextPath }/resources/images/click.jpg" alt="">
															</div>
															<div class="thumb-pane">
																<h3 class="thumb-heading animated rollIn">
																	<a href="${pageContext.request.contextPath}/map/plantrip.do" title="">새로 계획하기</a> <small>Create Plan</small>
																</h3>
															</div>
														</div>
													</div> 													
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab-example-4"> 
										<div class="col-md-6">
											<div class="content-box">
												<h3 class="content-box-header clearfix text-center">Favorite Map</h3>
												<div class="panel-body" style="background-color: white;">
													<div class="example-box-wrapper">
														<div id="favoritemap" class="row">
														 													
														</div>
													</div>
												</div>
											</div>
										</div>
											
										<div class="col-md-6">
											<div class="content-box">
												<h3 class="content-box-header clearfix text-center">Favorite Place</h3>
												<div class="panel-body" style="background-color: white;">
													<div class="example-box-wrapper">
														<div id="favoriteplace" class="row">
		 																									
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