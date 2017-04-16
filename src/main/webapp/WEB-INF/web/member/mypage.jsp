<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<style type="text/css">
body {
	padding-top: 80px;
}

@media ( min-width : 1368px) {
	body {
		padding-top: 140px;
	}
}

.dlrj {
	border: 1px solid #ddd;
	border-radius: 20px;
	background-color: #fffdf3;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<br /> <br />
		<div class="container">

			<div class="row">
				<div class="col-xs-12 col-sm-3 col-md-2">
					<div style="text-align: center;">
						<img class="avatar"
							src="//tripline.global.ssl.fastly.net/media/image/tripuser.png">
					</div>
					<div style="text-align: center; margin: 15px 0px;">
						<div class="btn-group">
							<a class="btn btn-primary btn-sm" href="#"><i
								class="fa fa-plus"></i>&nbsp;&nbsp;Follow</a>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-9 col-md-10">
					<h1 style="margin-top: 0px; margin-bottom: 0px;">${sessionScope.user }</h1>
					<div class="text-muted" style="margin-bottom: 15px;">email</div>
					<div class="lead"></div>
					<div>
						<span style="cursor: pointer"
							onclick="Tripline.myUser.showTrips()"><strong><i
								class="fa fa-map"></i></strong>&nbsp;&nbsp;1&nbsp;Map</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="cursor: pointer"
							onclick="Tripline.myUser.showFollowers()"><strong><i
								class="fa fa-users"></i></strong>&nbsp;&nbsp;0&nbsp;Followers</span>
						<!--<strong>0</strong>&nbsp;Following-->
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-xs-12">
					<h4>
						<ul class="nav nav-tabs" style="margin-bottom: 15px;">
							<li class="active"><a href="#trips" data-toggle="tab"
								aria-expanded="true">Maps</a></li>
							<li class=""><a href="#users" data-toggle="tab"
								aria-expanded="false">People</a></li>
							<!--<li class=""><a href="#places" data-toggle="tab" aria-expanded="false">Places</a></li>-->
						</ul>
					</h4>
					<div class="tab-content">
						<div class="tab-pane fade active in" id="trips">
							<ul class="nav nav-pills pills-xs" style="margin-bottom: 15px;">
								<li class="active"><a href="#mytrips" data-toggle="tab"
									data-section="trips" data-query="mytrips" aria-expanded="true">My
										Maps</a></li>
								<li class=""><a href="#following" data-toggle="tab"
									data-section="trips" data-query="following"
									aria-expanded="true">Following</a></li>
							</ul>
							<div class="row">
								<div id="mytriplist" class="trip-list clearfix"></div>
								<div id="mytriplist-noresults" class="col-xs-12 lead cloak"
									style="display: block;">No results</div>
								<div class="col-xs-12 text-center">
									<div class="spinner" style="display: none;">
										<img
											src="//tripline.global.ssl.fastly.net/media/image/loading-big.gif">
									</div>
									<div id="mytriplist-loadmore" class="btn btn-default loadmore"
										style="display: none;">Load More</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="users">
							<ul class="nav nav-pills pills-xs" style="margin-bottom: 15px;">
								<li class="active"><a href="#friends" data-toggle="tab"
									data-section="users" data-query="friends" aria-expanded="false">Friends</a></li>
								<li class=""><a href="#following" data-toggle="tab"
									data-section="users" data-query="following"
									aria-expanded="false">Following</a></li>
								<li class=""><a href="#followers" data-toggle="tab"
									data-section="users" data-query="followers"
									aria-expanded="false">Followers</a></li>
							</ul>
							<div class="row">
								<div id="myuserlist" class="user-list clearfix"></div>
								<div id="myuserlist-noresults" class="col-xs-12 lead cloak"
									style="display: block;">No results</div>
								<div class="col-xs-12 text-center">
									<div class="spinner" style="display: none;">
										<img
											src="//tripline.global.ssl.fastly.net/media/image/loading-big.gif">
									</div>
									<div id="myuserlist-loadmore" class="btn btn-default loadmore"
										style="display: none;">Load More</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="places">
							<ul class="nav nav-pills pills-xs" style="margin-bottom: 15px;">
								<li class="active"><a href="#following" data-toggle="tab"
									data-section="places" data-query="following"
									aria-expanded="false">Following</a></li>
							</ul>
							<div class="row">
								<div id="myplacelist" class="trip-list clearfix"></div>
								<div id="myplacelist-noresults" class="col-xs-12 lead cloak">No
									results</div>
								<div class="col-xs-12 text-center">
									<div class="spinner" style="display: none;">
										<img
											src="//tripline.global.ssl.fastly.net/media/image/loading-big.gif">
									</div>
									<div id="myplacelist-loadmore" class="btn btn-default loadmore">Load
										More</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<iframe
  width="600"
  height="450"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAYUG3CyfQOX6EgmE0QO5hjH95ir0EDZm0
    &q=Space+Needle,Seattle+WA" allowfullscreen>
</iframe>
			<div class="portfolio-area inner-padding">
				<div class="container-fluid">
					<div class="row foo" data-sr="enter" data-sr-id="30"
						style="visibility: visible; -webkit-transform: translateY(0) scale(1); opacity: 1; transform: translateY(0) scale(1); opacity: 1; -webkit-transition: -webkit-transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; transition: transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s;">
						<div class="portfolio-masonry portfolio-items"
							style="position: relative; height: 542px;">
							<div class="portfolio-item isotope web-design"
								style="position: absolute; left: 1075px; top: 271px;">
								<div class="portfolio-item-inner">
									<img src="${pageContext.request.contextPath }/resources/img/work-14.png" alt="responsive img">
									<div class="portfolio-caption">
										<a class="portfolio-action-btn" href="${pageContext.request.contextPath }/resources/img/work-14.png"
											data-popup="prettyPhoto[img]"><img src="${pageContext.request.contextPath }/resources/img/zoom.png"
											alt="responsive img"></a>
										<div class="portfolio-caption-content">
											<h4>
												<a href="#">Project Name</a>
											</h4>
											<a href="#">Category</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>