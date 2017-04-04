<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Map Detail</title>
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>

		<!-- 제목 부분 -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-12">
					<label>제목</label>
				</div>
				<br /> <br />
				<div class='col-md-6'>
					<div class="form-group">
						<label>시작 날짜</label>
					</div>
				</div>
				<div class='col-md-6'>
					<label>끝 날짜</label>
				</div>
				<div class="col-md-12">
					해쉬태그 출력될곳<br /> <br />
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>


		<!-- 맵부분 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-8" id="map" style="height: 756px;"></div>
			<div class="col-md-2">
				<div class="col-md-2">
					<i class="fa fa-map-marker fa-2x" aria-hidden="true"></i>
				</div>
				<div class="col-md-10">
					<input type="text" class="form-control title-text"
						placeholder="주소 입력">
				</div>
				<br /> <br />

				<!-- 타임라인 부분 -->
				<div class="col-md-12"
					style="overflow-x: hidden; overflow-y: auto; height: 696px; border: solid;">
					타임라인 부분<br />
					<div id="draggablePanelList" class="list-unstyled">

						<div class="panel panel-info">
							<div class="panel-heading">번호, 제목</div>
							<div class="panel-body">사진, 내용</div>
						</div>

						<div class="panel panel-info">
							<div class="panel-heading">You can drag this panel too.</div>
							<div class="panel-body">Content</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<button type="button" class="btn btn-secondary col-md-6">수정</button>
					<button type="button" class="btn btn-secondary col-md-6">취소</button>
				</div>
			</div>
			<div class="col-md-1"></div>

		</div>
		<br /> <br /> <br />
		<!-- 길찾기 부분 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-8" style="border: solid;">길찾기부분</div>
			<div class="col-md-1"></div>
		</div>
		<br /> <br /> <br />


		<!-- 즐찾 조회수 추천 신고 위치 잡아야함-->
		<div class="container">
			<div class="row">
				<div class="text-center">
					<a href="#"><i class="fa fa-heart fa-2x" aria-hidden="true"></i></a>
					<a href="#"><i class="fa fa-star-o fa-2x" aria-hidden="true"></i></a>
					<a href="#"><i class="fa fa-eye fa-2x" aria-hidden="true"></i></a>
					<a href="#"><i class="fa fa-exclamation-triangle fa-2x"
						aria-hidden="true"></i></a> 수정하면서 위치 바꿀예정
				</div>
			</div>
		</div>

		<!-- 댓글 부분 -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h3>Comment</h3>
				</div>
			</div>
			<div class="row">
				<!-- 프로필사진 -->
				<div class="col-sm-1">
					<div class="thumbnail">
						<img class="img-responsive user-photo"
							src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>myusername</strong> <span class="text-muted">commented
								5 days ago</span>
						</div>
						<div class="panel-body">Panel contentssssssssssssssssss ssss</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 프로필사진 -->
				<div class="col-sm-1">
					<div class="thumbnail">
						<img class="img-responsive user-photo"
							src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>myusername</strong> <span class="text-muted">commented
								5 days ago</span>
						</div>
						<div class="panel-body">Panel contentssssssssssssssssss ssss</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 프로필사진 -->
				<div class="col-sm-1">
					<div class="thumbnail">
						<img class="img-responsive user-photo"
							src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>myusername</strong> <span class="text-muted">commented
								5 days ago</span>
						</div>
						<div class="panel-body">Panel contentssssssssssssssssss ssss</div>
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<input type="text" class="form-control title-text" placeholder="댓글">
			</div>
			<div class="col-sm-5">
				<a class="text-muted" href="#"><i class="fa fa-comment fa-2x"></i></a>
			</div>


		</div>
	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>