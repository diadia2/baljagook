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
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/icons/favicon.png">
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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-core.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-ui-core.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-ui-widget.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-ui-mouse.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-ui-position.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js-core/transition.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js-core/modernizr.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/assets/js-core/jquery-cookie.js"></script>
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
		<div class="sb-slidebar bg-black sb-left sb-style-overlay">
			<div class="scrollable-content scrollable-slim-sidebar">
				<div class="pad10A">
					<div class="divider-header">Online</div>
					<ul class="chat-box">
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial1.jpg"
									alt="">
								<div class="small-badge bg-green"></div>
							</div>
							<b>Grace Padilla</b>
						<p>On the other hand, we denounce...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial2.jpg"
									alt="">
								<div class="small-badge bg-green"></div>
							</div>
							<b>Carl Gamble</b>
						<p>Dislike men who are so beguiled...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial3.jpg"
									alt="">
								<div class="small-badge bg-green"></div>
							</div>
							<b>Michael Poole</b>
						<p>Of pleasure of the moment, so...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial4.jpg"
									alt="">
								<div class="small-badge bg-green"></div>
							</div>
							<b>Bill Green</b>
						<p>That they cannot foresee the...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial5.jpg"
									alt="">
								<div class="small-badge bg-green"></div>
							</div>
							<b>Cheryl Soucy</b>
						<p>Pain and trouble that are bound...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
					</ul>
					<div class="divider-header">Idle</div>
					<ul class="chat-box">
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial6.jpg"
									alt="">
								<div class="small-badge bg-orange"></div>
							</div>
							<b>Jose Kramer</b>
						<p>Equal blame belongs to those...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial7.jpg"
									alt="">
								<div class="small-badge bg-orange"></div>
							</div>
							<b>Dan Garcia</b>
						<p>Weakness of will, which is same...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial8.jpg"
									alt="">
								<div class="small-badge bg-orange"></div>
							</div>
							<b>Edward Bridges</b>
						<p>These cases are perfectly simple...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
					</ul>
					<div class="divider-header">Offline</div>
					<ul class="chat-box">
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial1.jpg"
									alt="">
								<div class="small-badge bg-red"></div>
							</div>
							<b>Randy Herod</b>
						<p>In a free hour, when our power...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
						<li><div class="status-badge">
								<img class="img-circle" width="40"
									src="${pageContext.request.contextPath }/resources/assets/image-resources/people/testimonial2.jpg"
									alt="">
								<div class="small-badge bg-red"></div>
							</div>
							<b>Patricia Bagley</b>
						<p>when nothing prevents our being...</p>
							<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i
								class="glyph-icon icon-comments-o"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="sb-slidebar bg-black sb-right sb-style-overlay">
			<div class="scrollable-content scrollable-slim-sidebar">
				<div class="pad15A">
					<a href="#" title="" data-toggle="collapse"
						data-target="#sidebar-toggle-1" class="popover-title">Cloud
						status <span class="caret"></span>
					</a>
					<div id="sidebar-toggle-1" class="collapse in">
						<div class="pad15A">
							<div class="row">
								<div class="col-md-4">
									<div
										class="text-center font-gray pad5B text-transform-upr font-size-12">New
										visits</div>
									<div class="chart-alt-3 font-gray-dark" data-percent="55">
										<span>55</span>%
									</div>
								</div>
								<div class="col-md-4">
									<div
										class="text-center font-gray pad5B text-transform-upr font-size-12">Bounce
										rate</div>
									<div class="chart-alt-3 font-gray-dark" data-percent="46">
										<span>46</span>%
									</div>
								</div>
								<div class="col-md-4">
									<div
										class="text-center font-gray pad5B text-transform-upr font-size-12">Server
										load</div>
									<div class="chart-alt-3 font-gray-dark" data-percent="92">
										<span>92</span>%
									</div>
								</div>
							</div>
							<div class="divider mrg15T mrg15B"></div>
							<div class="text-center">
								<a href="#"
									class="btn center-div btn-info mrg5T btn-sm text-transform-upr updateEasyPieChart"><i
									class="glyph-icon icon-refresh"></i> Update charts</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<a href="#" title="" data-toggle="collapse"
						data-target="#sidebar-toggle-6" class="popover-title">Latest
						transfers <span class="caret"></span>
					</a>
					<div id="sidebar-toggle-6" class="collapse in">
						<ul class="files-box">
							<li><i
								class="files-icon glyph-icon font-red icon-file-archive-o"></i>
							<div class="files-content">
									<b>blog_export.zip</b>
									<div class="files-date">
										<i class="glyph-icon icon-clock-o"></i> added on <b>22.10.2014</b>
									</div>
								</div>
								<div class="files-buttons">
									<a href="#" class="btn btn-xs hover-info tooltip-button"
										data-placement="left" title="Download"><i
										class="glyph-icon icon-cloud-download"></i></a> <a href="#"
										class="btn btn-xs hover-danger tooltip-button"
										data-placement="left" title="Delete"><i
										class="glyph-icon icon-times"></i></a>
								</div></li>
							<li class="divider"></li>
							<li><i class="files-icon glyph-icon icon-file-code-o"></i>
							<div class="files-content">
									<b>homepage-test.html</b>
									<div class="files-date">
										<i class="glyph-icon icon-clock-o"></i> added <b>19.10.2014</b>
									</div>
								</div>
								<div class="files-buttons">
									<a href="#" class="btn btn-xs hover-info tooltip-button"
										data-placement="left" title="Download"><i
										class="glyph-icon icon-cloud-download"></i></a> <a href="#"
										class="btn btn-xs hover-danger tooltip-button"
										data-placement="left" title="Delete"><i
										class="glyph-icon icon-times"></i></a>
								</div></li>
							<li class="divider"></li>
							<li><i
								class="files-icon glyph-icon font-yellow icon-file-image-o"></i>
							<div class="files-content">
									<b>monthlyReport.jpg</b>
									<div class="files-date">
										<i class="glyph-icon icon-clock-o"></i> added on <b>10.9.2014</b>
									</div>
								</div>
								<div class="files-buttons">
									<a href="#" class="btn btn-xs hover-info tooltip-button"
										data-placement="left" title="Download"><i
										class="glyph-icon icon-cloud-download"></i></a> <a href="#"
										class="btn btn-xs hover-danger tooltip-button"
										data-placement="left" title="Delete"><i
										class="glyph-icon icon-times"></i></a>
								</div></li>
							<li class="divider"></li>
							<li><i
								class="files-icon glyph-icon font-green icon-file-word-o"></i>
							<div class="files-content">
									<b>new_presentation.doc</b>
									<div class="files-date">
										<i class="glyph-icon icon-clock-o"></i> added on <b>5.9.2014</b>
									</div>
								</div>
								<div class="files-buttons">
									<a href="#" class="btn btn-xs hover-info tooltip-button"
										data-placement="left" title="Download"><i
										class="glyph-icon icon-cloud-download"></i></a> <a href="#"
										class="btn btn-xs hover-danger tooltip-button"
										data-placement="left" title="Delete"><i
										class="glyph-icon icon-times"></i></a>
								</div></li>
						</ul>
					</div>
					<div class="clear"></div>
					<a href="#" title="" data-toggle="collapse"
						data-target="#sidebar-toggle-3" class="popover-title">Tasks
						for today <span class="caret"></span>
					</a>
					<div id="sidebar-toggle-3" class="collapse in">
						<ul class="progress-box">
							<li><div class="progress-title">
									New features development <b>87%</b>
								</div>
								<div class="progressbar-smaller progressbar" data-value="87">
									<div class="progressbar-value bg-azure">
										<div class="progressbar-overlay"></div>
									</div>
								</div></li>
							<li><div class="progress-title">
									Finishing uploading files <b>66%</b>
								</div>
								<div class="progressbar-smaller progressbar" data-value="66">
									<div class="progressbar-value bg-red">
										<div class="progressbar-overlay"></div>
									</div>
								</div></li>
							<li><div class="progress-title">
									Creating tutorials <b>58%</b>
								</div>
								<div class="progressbar-smaller progressbar" data-value="58">
									<div class="progressbar-value bg-blue-alt"></div>
								</div></li>
							<li><div class="progress-title">
									Frontend bonus theme <b>74%</b>
								</div>
								<div class="progressbar-smaller progressbar" data-value="74">
									<div class="progressbar-value bg-purple"></div>
								</div></li>
						</ul>
					</div>
					<div class="clear"></div>
					<a href="#" title="" data-toggle="collapse"
						data-target="#sidebar-toggle-4" class="popover-title">Pending
						notifications <span class="bs-label bg-orange tooltip-button"
						title="Label example">New</span> <span class="caret"></span>
					</a>
					<div id="sidebar-toggle-4" class="collapse in">
						<ul class="notifications-box notifications-box-alt">
							<li><span
								class="bg-purple icon-notification glyph-icon icon-users"></span>
								<span class="notification-text">This is an error
									notification</span>
							<div class="notification-time">
									a few seconds ago <span class="glyph-icon icon-clock-o"></span>
								</div>
								<a href="#"
								class="notification-btn btn btn-xs btn-black tooltip-button"
								data-placement="left" title="View details"><i
									class="glyph-icon icon-arrow-right"></i></a></li>
							<li><span
								class="bg-warning icon-notification glyph-icon icon-ticket"></span>
								<span class="notification-text">This is a warning
									notification</span>
							<div class="notification-time">
									<b>15</b> minutes ago <span class="glyph-icon icon-clock-o"></span>
								</div>
								<a href="#"
								class="notification-btn btn btn-xs btn-black tooltip-button"
								data-placement="left" title="View details"><i
									class="glyph-icon icon-arrow-right"></i></a></li>
							<li><span
								class="bg-green icon-notification glyph-icon icon-random"></span>
								<span class="notification-text font-green">A success
									message example.</span>
							<div class="notification-time">
									<b>2 hours</b> ago <span class="glyph-icon icon-clock-o"></span>
								</div>
								<a href="#"
								class="notification-btn btn btn-xs btn-black tooltip-button"
								data-placement="left" title="View details"><i
									class="glyph-icon icon-arrow-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="loading">
			<div class="svg-icon-loader">
				<img src="${pageContext.request.contextPath }/resources/assets/images/svg-loaders/bars.svg" width="40"
					alt="">
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
													src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg" alt="">
											</div>
											<div class="user-info">
												<span>admin</span> <a href="#"
													title="my page"><span>my page</span></a> <br/><a href="#"
													title="message "><span>message</span></a>
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
									<input type="text" class="form-control"
										placeholder="Search" style="margin-top: 13px;"> <span
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
									<div class="panel-content image-box">
										<div class="ribbon">
											<div class="bg-primary">Ribbon</div>
										</div>
										<div class="image-content font-white">
											<div class="meta-box meta-box-bottom">
												<img src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg" alt=""
													class="meta-image img-bordered img-circle">
												<h3 class="meta-heading">Alex Rosenberg</h3>
												<h4 class="meta-subheading">Ultimate backend programmer</h4>
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
							<div class="content-box">
							</div>
							<div class="example-box-wrapper">
								<ul class="list-group row list-group-icons">
									<li class="col-md-3 active"><a href="#tab-example-4"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-red icon-bullhorn"></i> Personal
											Information</a></li>
									<li class="col-md-3"><a href="#tab-example-1"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon icon-dashboard"></i> Account Settings</a></li>
									<li class="col-md-3"><a href="#tab-example-2"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-primary icon-camera"></i> Messages
											Inbox</a></li>
									<li class="col-md-3"><a href="#tab-example-3"
										data-toggle="tab" class="list-group-item"><i
											class="glyph-icon font-blue-alt icon-globe"></i> FAQ Section</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade" id="tab-example-1">
										<div class="alert alert-close alert-success">
											<a href="#" title="Close"
												class="glyph-icon alert-close-btn icon-remove"></a>
											<div class="bg-green alert-icon">
												<i class="glyph-icon icon-check"></i>
											</div>
											<div class="alert-content">
												<h4 class="alert-title">Example Infobox</h4>
												<p>Lorem ipsum dolor sic amet dixit tu...</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="content-box">
													<form
														class="form-horizontal clearfix pad15L pad15R pad20B bordered-row">
														<div class="form-group remove-border">
															<label class="col-sm-7 control-label">Enable
																account:</label>
															<div class="col-sm-3">
																<input type="checkbox" class="input-switch-alt">
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-7 control-label">Visible
																Profile</label>
															<div class="col-sm-3">
																<input type="checkbox" checked="checked"
																	class="input-switch-alt">
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-7 control-label">Hide
																timeline</label>
															<div class="col-sm-3">
																<input type="checkbox" data-on-color="danger"
																	data-size="small" name="checkbox-example-1"
																	class="input-switch" data-on-text="On"
																	data-off-text="Off">
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-7 control-label">Is it
																active?</label>
															<div class="col-sm-3">
																<input type="checkbox" data-on-color="info"
																	data-size="small" name="checkbox-example-2"
																	class="input-switch" data-on-text="On"
																	data-off-text="Off">
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-7 control-label">Radio
																example</label>
															<div class="col-sm-3">
																<input type="checkbox" data-on-color="success"
																	data-size="small" name="checkbox-example-3"
																	class="input-switch" checked="checked"
																	data-on-text="On" data-off-text="Off">
															</div>
														</div>
													</form>
												</div>
											</div>
											<div class="col-md-6">
												<div class="content-box mrg15B">
													<h3 class="content-box-header clearfix">
														Change Password
														<div class="font-size-11 float-right">
															<a href="#" title=""><i
																class="glyph-icon mrg5R opacity-hover icon-plus"></i></a> <a
																href="#" title=""><i
																class="glyph-icon opacity-hover icon-cog"></i></a>
														</div>
													</h3>
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
										</div>
									</div>
									<div class="tab-pane fade" id="tab-example-2">
										<div class="content-box pad25A">
											<ul class="chat-box">
												<li><div class="chat-author">
														<img width="36"
															src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg" alt="">
													</div>
													<div class="popover left no-shadow">
														<div class="arrow"></div>
														<div class="popover-content">
															Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
															Donec odio. Quisque volutpat mattis eros. Nullam
															malesuada erat ut turpis. Suspendisse urna nibh, viverra
															non, semper suscipit, posuere a, pede.
															<div class="chat-time">
																<i class="glyph-icon icon-clock-o"></i> a few seconds
																ago
															</div>
														</div>
													</div></li>
												<li class="float-left"><div class="chat-author">
														<img width="36"
															src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg" alt="">
													</div>
													<div class="popover right no-shadow">
														<div class="arrow"></div>
														<div class="popover-content">
															<h3>
																<a href="#" title="Horia Simon">Horia Simon</a>
																<div class="float-right">
																	<a href="#"
																		class="btn glyph-icon icon-inbox font-gray tooltip-button"
																		data-placement="bottom"
																		title="This chat line was received in the mail."></a>
																</div>
															</h3>
															This comment line has a title (author name) and a right
															button panel.
															<div class="chat-time">
																<i class="glyph-icon icon-clock-o"></i> a few seconds
																ago
															</div>
														</div>
													</div></li>
												<li><div class="chat-author">
														<img width="36"
															src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg" alt="">
													</div>
													<div class="popover left no-shadow">
														<div class="arrow"></div>
														<div class="popover-content">
															This comment line has a bottom button panel, box shadow
															and title.
															<div class="chat-time">
																<i class="glyph-icon icon-clock-o"></i> a few seconds
																ago
															</div>
															<div class="divider"></div>
															<a href="#"
																class="btn btn-sm btn-default font-bold text-transform-upr"
																title=""><span class="button-content">Reply</span></a> <a
																href="#"
																class="btn btn-sm btn-danger float-right tooltip-button"
																data-placement="left" title="Remove comment"><i
																class="glyph-icon icon-remove"></i></a>
														</div>
													</div></li>
												<li><div class="chat-author">
														<img width="36"
															src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg" alt="">
													</div>
													<div class="popover left no-shadow">
														<div class="arrow"></div>
														<div class="popover-content">
															Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
															Donec odio. Quisque volutpat mattis eros. Nullam
															malesuada erat ut turpis. Suspendisse urna nibh, viverra
															non, semper suscipit, posuere a, pede.
															<div class="chat-time">
																<i class="glyph-icon icon-clock-o"></i> a few seconds
																ago
															</div>
														</div>
													</div></li>
												<li class="float-left"><div class="chat-author">
														<img width="36"
															src="${pageContext.request.contextPath }/resources/assets/image-resources/gravatar.jpg" alt="">
													</div>
													<div class="popover right no-shadow">
														<div class="arrow"></div>
														<div class="popover-content">
															Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
															Donec odio. Quisque volutpat mattis eros. Nullam
															malesuada erat ut turpis. Suspendisse urna nibh, viverra
															non, semper suscipit, posuere a, pede.
															<div class="chat-time">
																<i class="glyph-icon icon-clock-o"></i> a few seconds
																ago
															</div>
														</div>
													</div></li>
											</ul>
										</div>
									</div>
									<div class="tab-pane fade" id="tab-example-3">
										<div class="row">
											<div class="col-md-3">
												<ul class="list-group">
													<li class="mrg10B"><a href="#faq-tab-1"
														data-toggle="tab" class="list-group-item">How to get
															paid <i class="glyph-icon icon-angle-right mrg0A"></i>
													</a></li>
													<li class="mrg10B"><a href="#faq-tab-2"
														data-toggle="tab" class="list-group-item">ThemeForest
															related <i
															class="glyph-icon font-green icon-angle-right mrg0A"></i>
													</a></li>
													<li class="mrg10B"><a href="#faq-tab-3"
														data-toggle="tab" class="list-group-item">Common
															questions <i class="glyph-icon icon-angle-right mrg0A"></i>
													</a></li>
													<li class="mrg10B"><a href="#faq-tab-4"
														data-toggle="tab" class="list-group-item">Terms of
															service <i class="glyph-icon icon-angle-right mrg0A"></i>
													</a></li>
												</ul>
											</div>
											<div class="col-md-9">
												<div class="tab-content">
													<div class="tab-pane fade active in pad0A" id="faq-tab-1">
														<div class="panel-group" id="accordion5">
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion5"
																			href="#collapseOne">Collapsible Group Item #1</a>
																	</h4>
																</div>
																<div id="collapseOne" class="panel-collapse collapse in">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion5"
																			href="#collapseTwo">Collapsible Group Item #2</a>
																	</h4>
																</div>
																<div id="collapseTwo" class="panel-collapse collapse">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion5"
																			href="#collapseThree">Collapsible Group Item #3</a>
																	</h4>
																</div>
																<div id="collapseThree" class="panel-collapse collapse">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
														</div>
													</div>
													<div class="tab-pane fade pad0A" id="faq-tab-2">
														<div class="panel-group" id="accordion1">
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion1"
																			href="#collapseOne1">Collapsible Group Item #1</a>
																	</h4>
																</div>
																<div id="collapseOne1"
																	class="panel-collapse collapse in">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion1"
																			href="#collapseTwo1">Collapsible Group Item #2</a>
																	</h4>
																</div>
																<div id="collapseTwo1" class="panel-collapse collapse">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion1"
																			href="#collapseThree1">Collapsible Group Item #3</a>
																	</h4>
																</div>
																<div id="collapseThree1" class="panel-collapse collapse">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
														</div>
													</div>
													<div class="tab-pane fade pad0A" id="faq-tab-3">
														<div class="panel-group" id="accordion2">
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion2"
																			href="#collapseOne2">Collapsible Group Item #1</a>
																	</h4>
																</div>
																<div id="collapseOne2"
																	class="panel-collapse collapse in">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion2"
																			href="#collapseTwo2">Collapsible Group Item #2</a>
																	</h4>
																</div>
																<div id="collapseTwo2" class="panel-collapse collapse">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion2"
																			href="#collapseThree2">Collapsible Group Item #3</a>
																	</h4>
																</div>
																<div id="collapseThree2" class="panel-collapse collapse">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
														</div>
													</div>
													<div class="tab-pane fade pad0A" id="faq-tab-4">
														<div class="panel-group" id="accordion3">
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseOne4">Collapsible Group Item #1</a>
																	</h4>
																</div>
																<div id="collapseOne4"
																	class="panel-collapse collapse in">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseTwo4">Collapsible Group Item #2</a>
																	</h4>
																</div>
																<div id="collapseTwo4" class="panel-collapse collapse">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
															<div class="panel">
																<div class="panel-heading">
																	<h4 class="panel-title">
																		<a data-toggle="collapse" data-parent="#accordion"
																			href="#collapseThree4">Collapsible Group Item #3</a>
																	</h4>
																</div>
																<div id="collapseThree4" class="panel-collapse collapse">
																	<div class="panel-body">Anim pariatur cliche
																		reprehenderit, enim eiusmod high life accusamus terry
																		richardson ad squid. 3 wolf moon officia aute, non
																		cupidatat skateboard dolor brunch. Food truck quinoa
																		nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
																		sunt aliqua put a bird on it squid single-origin
																		coffee nulla assumenda shoreditch et. Nihil anim
																		keffiyeh helvetica, craft beer labore wes anderson
																		cred nesciunt sapiente ea proident. Ad vegan excepteur
																		butcher vice lomo. Leggings occaecat craft beer
																		farm-to-table, raw denim aesthetic synth nesciunt you
																		probably haven't heard of them accusamus labore
																		sustainable VHS.</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane pad0A fade active in" id="tab-example-4">
										<div class="content-box">
											<form class="form-horizontal pad15L pad15R bordered-row">
												<div class="form-group remove-border">
													<label class="col-sm-3 control-label">First Name:</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" id=""
															placeholder="First name...">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">Last Name:</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" id=""
															placeholder="Last name...">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">Email:</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" id=""
															placeholder="Email address...">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">Website:</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" id=""
															placeholder="Website...">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">About me:</label>
													<div class="col-sm-6">
														<textarea name="" rows="3"
															class="form-control textarea-autosize"></textarea>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">Profile
														Picture:</label>
													<div class="col-sm-6">
														<div class="fileinput fileinput-new"
															data-provides="fileinput">
															<div class="fileinput-preview thumbnail"
																data-trigger="fileinput"
																style="width: 200px; height: 150px"></div>
															<div>
																<span class="btn btn-default btn-file"><span
																	class="fileinput-new">Select image</span> <span
																	class="fileinput-exists">Change</span> <input
																	type="file" name="..."></span> <a href="#"
																	class="btn btn-default fileinput-exists"
																	data-dismiss="fileinput">Remove</a>
															</div>
														</div>
													</div>
												</div>
											</form>
											<div class="button-pane mrg20T">
												<button class="btn btn-info">Save</button>
												<button class="btn btn-link font-gray-dark">Cancel</button>
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