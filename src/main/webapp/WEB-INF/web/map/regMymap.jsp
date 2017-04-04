<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Map Registration</title>
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
					<input type="text" class="form-control title-text" placeholder="제목">
				</div>
				<br /> <br />
				<div class='col-md-6'>
					<div class="form-group">
						<div class='input-group date' id='datetimepicker1'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <i class="fa fa-calendar"
								aria-hidden="true"></i>
							</span>
						</div>
					</div>
				</div>
				<div class='col-md-6'>
					<div class="form-group">
						<div class='input-group date' id='datetimepicker2'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <i class="fa fa-calendar"
								aria-hidden="true"></i>
							</span>
						</div>
					</div>
				</div>

				<div class="col-md-12">
					<input type="text" class="form-control title-text"
						placeholder="#해쉬태그">
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
					<button type="button" class="btn btn-secondary col-md-6">등록</button>
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


	</section>
	<footer>
		<jsp:include page="/bottom.do" />
	</footer>
</body>
</html>