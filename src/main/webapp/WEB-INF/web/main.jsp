<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/share.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>

		<!-- 메인 사진 -->
		<img src="${pageContext.request.contextPath }/resources/images/background.PNG" class="img-responsive center-block"
			alt="Responsive image" style="width: 100%;">

		<!-- 사이트 소개 -->
		<div class="features-clean">
			<div class="container">
				<div class="intro">
					<h2 class="text-center">Create your next adventure</h2>
				</div>
				<div class="row  features">
					<div class="col-lg-3 col-md-4 col-sm-6 item">
						<h2 class="text-center">
							<a href="#"><i class="fa fa-map-marker fa-2x"
								aria-hidden="true"></i></a>
						</h2>
						<h3 class="name text-center">Add Places</h3>
						<p class="description text-center">당신이 다닌 장소를 추가하세요.</p>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6 item">
						<h2 class="text-center">
							<a href="#"><i class="fa fa-star-o fa-2x" aria-hidden="true"></i></a>
						</h2>
						<h3 class="name text-center">Add Favorites</h3>
						<p class="description text-center">가고싶은 여행이나 장소를 추가하세요.</p>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6 item">
						<h2 class="text-center">
							<a href="#"><i class="fa fa-picture-o fa-2x"
								aria-hidden="true"></i></a>
						</h2>
						<h3 class="name text-center">Add Photos</h3>
						<p class="description text-center">사진 추가가능.</p>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 item">
						<h2 class="text-center">
							<a href="#"><i class="fa fa-share-alt fa-2x"
								aria-hidden="true"></i></a>
						</h2>
						<h3 class="name text-center">Share</h3>
						<p class="description text-center">당신의 발자취를 공유해 보세요.</p>
					</div>

				</div>
			</div>
		</div>

		<!-- 인기글 4개 노출 -->
		<div class="projects-clean">
			<div class="container">
				<div class="intro">
					<h2 class="text-center">Featured</h2>
				</div>
				<div class="row projects">
					<div class="col-lg-3 col-sm-6 item">
					<a href="${pageContext.request.contextPath }/mapDetail.do">
						<div class="card">
							<img class="img-reponsive" alt="사진1" src="<c:url value="/resources/images/1.png"/>">
							<h3 class="name">플젝이름</h3>
							<p class="description">설명</p>
						</div></a>
					</div>
					<div class="col-lg-3 col-sm-6 item">
						<div class="card">
							<img class="img-reponsive" alt="사진1" src="<c:url value="/resources/images/2.png"/>">
							<h3 class="name">플젝이름</h3>
							<p class="description">설명</p>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6 item">
						<div class="card">
							<img class="img-reponsive" alt="사진1" src="<c:url value="/resources/images/3.png"/>">
							<h3 class="name">플젝이름</h3>
							<p class="description">설명</p>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6 item">
						<div class="card">
							<img class="img-reponsive" alt="사진1" src="<c:url value="/resources/images/4.png"/>">
							<h3 class="name">플젝이름</h3>
							<p class="description">설명</p>
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-secondary">more</button>
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