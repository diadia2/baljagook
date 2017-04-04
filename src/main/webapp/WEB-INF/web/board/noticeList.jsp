<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/share.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sub.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.datetimepicker.js"
	charset="UTF-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/jquery.datetimepicker.css" />
</head>
<body>
	<header>
		<jsp:include page="/top.do" />
	</header>
	<section>
		<div class="container">
			<div class="div_main">
				<div class="div_list">
					<!-- 여기에 ajax를 통한 데이터 넣으면 됨 -->
					<table class="tbl_list">
						<caption>공지사항 리스트</caption>
						<colgroup>
							<col width="10%" />
							<col />
							<col width="10%" />
						</colgroup>
						<thead>
							<th>번 호</th>
							<th>제 목</th>
							<th>날 짜</th>
						</thead>
						<tbody>
							<tr>
								<td class="centers">1</td>
								<td><a href="noticeView.do">제목입니다.</a></td>
								<td class="centers">2016-01-01</td>
							</tr>
							<tr>
								<td class="centers">1</td>
								<td>제목입니다.</td>
								<td class="centers">2016-01-01</td>
							</tr>
							<tr>
								<td class="centers">1</td>
								<td>제목입니다.</td>
								<td class="centers">2016-01-01</td>
							</tr>
							<tr>
								<td class="centers">1</td>
								<td>제목입니다.</td>
								<td class="centers">2016-01-01</td>
							</tr>
						</tbody>
					</table>
					<div class="searchbox">
						<form name="" method="post" action="#!">
							<select name="">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> <input type="text" name="" id="" value="" />
							<button type="button">검색</button>
						</form>
					</div>
					<div class="paging">
						<span>〈</span><span class="on">1</span><span>2</span><span>3</span><span>4</span><span>5</span><span>〉</span>
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