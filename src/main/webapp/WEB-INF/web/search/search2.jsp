<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title>Portfolio gallery</title>
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
					<div id="page-title">
						<h2>Search List</h2>
						<p>search list</p>
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
					<div
						class="portfolio-controls mrg10L mrg10R radius-all-4 portfolio-nav-alt bg-blue clearfix controls">
						<div class="container text-center">
							<ul class="float-none">
								<li class="filter" data-filter="all">View all</li>
								<li class="filter" data-filter="hover_1">filter1</li>
								<li class="filter" data-filter="hover_2">filter2</li>
								<li class="filter" data-filter="hover_3">filter3</li>
								<li class="filter" data-filter="hover_4">filter4</li>
							</ul>
						</div>
					</div>
					<div class="clearfix">
						<ul id="portfolio-grid" class="reset-ul">
							<li class="col-lg-3 col-sm-6 col-md-4 mix hover_3" data-cat="3"><div
									class="thumbnail-box thumbnail-box-inverse">
									<a class="thumb-link" href="#" title=""></a>
									<div class="thumb-content">
										<div class="center-vertical">
											<div class="center-content">
												<i
													class="icon-helper icon-center animated rotateIn font-white glyph-icon icon-linecons-camera"></i>
											</div>
										</div>
									</div>
									<div class="thumb-overlay bg-blue-alt"></div>
									<img src="${pageContext.request.contextPath }/resources/assets/image-resources/stock-images/img-22.jpg"
										alt="">
								</div></li>
							<li class="col-lg-3 col-sm-6 col-md-4 mix hover_4" data-cat="4"><div
									class="thumbnail-box-wrapper">
									<div class="thumbnail-box">
										<a class="thumb-link" href="#" title=""></a>
										<div class="thumb-content">
											<div class="center-vertical">
												<div class="center-content">
													<i
														class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i>
												</div>
											</div>
										</div>
										<div class="thumb-overlay bg-black"></div>
										<img
											src="${pageContext.request.contextPath }/resources/assets/image-resources/stock-images/img-17.jpg"
											alt="">
									</div>
									<div class="thumb-pane">
										<h3 class="thumb-heading animated rollIn">
											<a href="#" title="">Working in the morning</a> <small>12
												March 2015</small>
										</h3>
									</div>
								</div></li>
							<li class="col-lg-3 col-sm-6 col-md-4 mix hover_4" data-cat="4"><div
									class="thumbnail-box-wrapper">
									<div class="thumbnail-box">
										<a class="thumb-link" href="#" title=""></a>
										<div class="thumb-content">
											<div class="center-vertical">
												<div class="center-content">
													<i
														class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i>
												</div>
											</div>
										</div>
										<div class="thumb-overlay bg-black"></div>
										<img
											src="${pageContext.request.contextPath }/resources/assets/image-resources/stock-images/img-18.jpg"
											alt="">
									</div>
									<div class="thumb-pane">
										<h3 class="thumb-heading animated rollIn">
											<a href="#" title="">Working in the morning</a> <small>12
												March 2015</small>
										</h3>
									</div>
								</div></li>
							<li class="col-lg-3 col-sm-6 col-md-4 mix hover_4" data-cat="4"><div
									class="thumbnail-box-wrapper">
									<div class="thumbnail-box">
										<a class="thumb-link" href="#" title=""></a>
										<div class="thumb-content">
											<div class="center-vertical">
												<div class="center-content">
													<i
														class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i>
												</div>
											</div>
										</div>
										<div class="thumb-overlay bg-black"></div>
										<img
											src="${pageContext.request.contextPath }/resources/assets/image-resources/stock-images/img-19.jpg"
											alt="">
									</div>
									<div class="thumb-pane">
										<h3 class="thumb-heading animated rollIn">
											<a href="#" title="">Working in the morning</a> <small>12
												March 2015</small>
										</h3>
									</div>
								</div></li>
							<li class="col-lg-3 col-sm-6 col-md-4 mix hover_4" data-cat="4"><div
									class="thumbnail-box-wrapper">
									<div class="thumbnail-box">
										<a class="thumb-link" href="#" title=""></a>
										<div class="thumb-content">
											<div class="center-vertical">
												<div class="center-content">
													<i
														class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i>
												</div>
											</div>
										</div>
										<div class="thumb-overlay bg-black"></div>
										<img
											src="${pageContext.request.contextPath }/resources/assets/image-resources/stock-images/img-20.jpg"
											alt="">
									</div>
									<div class="thumb-pane">
										<h3 class="thumb-heading animated rollIn">
											<a href="#" title="">Working in the morning</a> <small>12
												March 2015</small>
										</h3>
									</div>
								</div></li>
							<li class="col-lg-3 col-sm-6 col-md-4 mix hover_4" data-cat="4"><div
									class="thumbnail-box-wrapper">
									<div class="thumbnail-box">
										<a class="thumb-link" href="#" title=""></a>
										<div class="thumb-content">
											<div class="center-vertical">
												<div class="center-content">
													<i
														class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i>
												</div>
											</div>
										</div>
										<div class="thumb-overlay bg-black"></div>
										<img
											src="${pageContext.request.contextPath }/resources/assets/image-resources/stock-images/img-23.jpg"
											alt="">
									</div>
									<div class="thumb-pane">
										<h3 class="thumb-heading animated rollIn">
											<a href="#" title="">Working in the morning</a> <small>12
												March 2015</small>
										</h3>
									</div>
								</div></li>
							<li class="col-lg-3 col-sm-6 col-md-4 mix hover_4" data-cat="4"><div
									class="thumbnail-box-wrapper">
									<div class="thumbnail-box">
										<a class="thumb-link" href="#" title=""></a>
										<div class="thumb-content">
											<div class="center-vertical">
												<div class="center-content">
													<i
														class="icon-helper icon-center animated zoomInUp font-white glyph-icon icon-linecons-camera"></i>
												</div>
											</div>
										</div>
										<div class="thumb-overlay bg-black"></div>
										<img
											src="${pageContext.request.contextPath }/resources/assets/image-resources/stock-images/img-24.jpg"
											alt="">
									</div>
									<div class="thumb-pane">
										<h3 class="thumb-heading animated rollIn">
											<a href="#" title="">Working in the morning</a> <small>12
												March 2015</small>
										</h3>
									</div>
								</div></li>
						</ul>
					</div>
					<div class="divider"></div>
					<div class="text-center">
						<ul class="pagination pagination-lg">
							<li><a href="#">«</a></li>
							<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">»</a></li>
						</ul>
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