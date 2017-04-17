<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
</head>
<body data-spy="scroll" data-target="#scroll-menu" data-offset="65">
	<!-- Header Section -->
	<header>
		<jsp:include page="/top.do" />
	</header>
	<!-- Hero Section -->
	<div class="hero-area" id="home">
		<div id="hero-slider-screen"
			class="owl-carousel owl-theme hero-slider-inner">
			<div class="item">
				<img
					src="${pageContext.request.contextPath }/resources/img/banner-1.png"
					alt="responsive img">
				<div class="hero-caption">
					<div class="hero-caption-inner">
						<h3>당신의 추억을 공유하세요</h3>
						<h1>어쩌구 저쩌구</h1>
						<p>하하호호히히헤헤</p>
						<a href="#" class="btn btn-default btn-sm-outline" role="button">DISCOVER
							MORE</a>
					</div>
				</div>
			</div>
			<div class="item">
				<img
					src="${pageContext.request.contextPath }/resources/img/banner-2.png"
					alt="responsive img">
				<div class="hero-caption">
					<div class="hero-caption-inner">
						<h3>WE PROVIDE BEST SOLUTIONS</h3>
						<h1>FOR YOUR BUSINESS</h1>
						<p>Lorem consectetur adipiscing elit, sed do eiusmod tempor
							dolor sit amet contetur adipiscing elit, sed do eiusmod tempor
							incididunt</p>
						<a href="#" class="btn btn-default btn-sm-outline" role="button">DISCOVER
							MORE</a>
					</div>
				</div>
			</div>
			<div class="item">
				<img
					src="${pageContext.request.contextPath }/resources/img/banner-3.png"
					alt="responsive img">
				<div class="hero-caption">
					<div class="hero-caption-inner">
						<h3>WE PROVIDE BEST SOLUTIONS</h3>
						<h1>FOR YOUR BUSINESS</h1>
						<p>Lorem consectetur adipiscing elit, sed do eiusmod tempor
							dolor sit amet contetur adipiscing elit, sed do eiusmod tempor
							incididunt</p>
						<a href="#" class="btn btn-default btn-sm-outline" role="button">DISCOVER
							MORE</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Hero Section -->
	<!-- Service Section -->
	<div class="service-area inner-padding5">
		<div class="container">
			<h2 class="text-center">Create your next adventure</h2>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-3 foo" data-sr='enter'>
					<div class="service-item">
						<i class="fa fa-map-marker fa-4x" aria-hidden="true"></i>
						<h4>Add Places</h4>
						<p>당신이 다닌 장소를 추가하세요.</p>
						<a href="#" class="btn btn-default btn-readmore-2" role="button">READ
							MORE</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-3 foo" data-sr='enter'>
					<div class="service-item">
						<i class="fa fa-star-o fa-4x" aria-hidden="true"></i>
						<h4>Add Favorites</h4>
						<p>가고싶은 여행지를 추가하세요.</p>
						<a href="#" class="btn btn-default btn-readmore-2" role="button">READ
							MORE</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-3 foo" data-sr='enter'>
					<div class="service-item">
						<i class="fa fa-picture-o fa-4x" aria-hidden="true"></i>
						<h4>Add Photos</h4>
						<p>사진을 추가해보세요.</p>
						<a href="#" class="btn btn-default btn-readmore-2" role="button">READ
							MORE</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-3 foo" data-sr='enter'>
					<div class="service-item">
						<i class="fa fa-share-alt fa-4x" aria-hidden="true"></i>
						<h4>Share</h4>
						<p>당신의 발자취를 공유해 보세요.</p>
						<a href="#" class="btn btn-default btn-readmore-2" role="button">READ
							MORE</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Service Section -->

	<!-- Blog Section -->
	<div class="blog-area inner-padding2">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-title-area-4 foo" data-sr='enter'>
						<h2 class="section-title">Featured</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<a href="#">
					<div class="col-sm-12 col-md-4">
						<div class="post-row foo" data-sr='enter'>
							<div class="post-header">
								<div class="post-feature">
									<img
										src="${pageContext.request.contextPath }/resources/img/post-feature-1.png"
										alt="responsive img">
								</div>
							</div>
							<div class="post-body">
								<div class="post-caption">
									<h2 class="post-heading">
										<a href="#">Business Trend Consultancy</a>
									</h2>
									<div class="post-Mega">Ricardo / Business, at 3 pm</div>
									<div class="post-sticker">
										<small>05</small>
										<p class="month">JUN</p>
									</div>
								</div>
								<p class="post-text">Lorem must explain to you how all this
									mistakenea of denouncing pleasure and praising pain was rnad I
									will give you a complete pain was praising</p>
							</div>
							<div class="post-footer">
								<a href="#" class="btn btn-default btn-post" role="button">READ
									MORE<i class="fa fa-angle-double-right"></i>
								</a>
							</div>
						</div>
					</div>
				</a> <a href="#">
					<div class="col-sm-12 col-md-4">
						<div class="post-row foo" data-sr='enter'>
							<div class="post-header">
								<div class="post-feature">
									<img
										src="${pageContext.request.contextPath }/resources/img/post-feature-2.png"
										alt="responsive img">
								</div>
							</div>
							<div class="post-body">
								<div class="post-caption">
									<h2 class="post-heading">
										<a href="#">Brand Designing Tips</a>
									</h2>
									<div class="post-Mega">Martino / Design, at 5 pm</div>
									<div class="post-sticker">
										<small>02</small>
										<p class="month">JUN</p>
									</div>
								</div>
								<p class="post-text">Lorem must explain to you how all this
									mistakenea of denouncing pleasure and praising pain was rnad I
									will give you a complete pain was praising</p>
							</div>
							<div class="post-footer">
								<a href="#" class="btn btn-default btn-post" role="button">READ
									MORE<i class="fa fa-angle-double-right"></i>
								</a>
							</div>
						</div>
					</div>
				</a> <a href="#">
					<div class="col-sm-12 col-md-4">
						<div class="post-row foo" data-sr='enter'>
							<div class="post-header">
								<div class="post-feature">
									<img
										src="${pageContext.request.contextPath }/resources/img/post-feature-3.png"
										alt="responsive img">
								</div>
							</div>
							<div class="post-body">
								<div class="post-caption">
									<h2 class="post-heading">
										<a href="#">Marketign Problem Solving</a>
									</h2>
									<div class="post-Mega">Zasica / Cororate, at 10 am</div>
									<div class="post-sticker">
										<small>02</small>
										<p class="month">JUN</p>
									</div>
								</div>
								<p class="post-text">Lorem must explain to you how all this
									mistakenea of denouncing pleasure and praising pain was rnad I
									will give you a complete pain was praising</p>
							</div>
							<div class="post-footer">
								<a href="#" class="btn btn-default btn-post" role="button">READ
									MORE<i class="fa fa-angle-double-right"></i>
								</a>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- End Blog Section -->
	<!-- Clients Section -->
	<div class="client-area inner-padding foo" data-sr='enter'>
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div id="clients-slider"
						class="owl-carousel owl-theme clients-carousel">
						<div class="item">
							<img
								src="${pageContext.request.contextPath }/resources/img/client-logo-1.png"
								alt="responsive img">
						</div>
						<div class="item">
							<img
								src="${pageContext.request.contextPath }/resources/img/client-logo-2.png"
								alt="responsive img">
						</div>
						<div class="item">
							<img
								src="${pageContext.request.contextPath }/resources/img/client-logo-3.png"
								alt="responsive img">
						</div>
						<div class="item">
							<img
								src="${pageContext.request.contextPath }/resources/img/client-logo-4.png"
								alt="responsive img">
						</div>
						<div class="item">
							<img
								src="${pageContext.request.contextPath }/resources/img/client-logo-5.png"
								alt="responsive img">
						</div>
						<div class="item">
							<img
								src="${pageContext.request.contextPath }/resources/img/client-logo-6.png"
								alt="responsive img">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Clients Section -->
	<!-- Footer Section -->
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>