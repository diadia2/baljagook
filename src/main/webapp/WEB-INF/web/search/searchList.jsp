<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search List</title>

</head>
<body>
	<div>


		<button class="btn btn-default h" id="btn">
			<i class="fa fa-heart h" aria-hidden="true"></i>
		</button>
		
		<button class="btn btn-default h" style="color: red;">
			<i class="fa fa-heart h" aria-hidden="true"></i>
		</button>

	</div>


	<!-- Blog Section -->
	<div class="blog-area inner-padding7">
		<div class="container">
			<div class="row foo" data-sr='enter'>
				<div class="blog-masonary">
					<c:forEach var="mymapList" items="${ mymapList }">
						<!-- One Post -->
						<a
							href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }"></a>
						<div class="post-grid">
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
											<a href="#">${ mymapList.title }</a>
										</h2>
										<div class="post-meta">${mymapList.userid }/
											${mymapList.regdate }</div>
										<div class="post-sticker">
											<small>05</small>
											<p class="month">JUN</p>
										</div>
									</div>
									<p class="post-text">${ mymapList.content }</p>
								</div>
								<div class="post-footer">
									<!-- Hash Tag -->
									<span class="tags"> <c:forEach var="hashtagList"
											items="${ hashtagList }">
											<c:if test="${ hashtagList.mymapidx == mymapList.idx }">
	                                    	#${ hashtagList.name }
	                                    	</c:if>
										</c:forEach>
									</span>
									<!-- Like -->
									<c:choose>
										<c:when test="${ likeAlreadyChecked[mymapList.idx] == true }">
											<i class="fa fa-heart" aria-hidden="true"></i>
											<input type="checkbox"
												onclick="handleLike(this, ${ mymapList.idx });"
												checked="checked">
											<div id="likeCnt${ mymapList.idx}">${ likeMap[mymapList.idx] }</div>
										</c:when>
										<c:otherwise>
											<i class="fa fa-heart" aria-hidden="true"></i>
											<input type="checkbox"
												onclick="handleLike(this, ${ mymapList.idx });">
											<div id="likeCnt${ mymapList.idx}">${ likeMap[mymapList.idx] }</div>
										</c:otherwise>
									</c:choose>
									<div class="views">
										<i class="fa fa-eye" aria-hidden="true"></i><span>${ viewcntMap[mymapList.idx] }</span>
									</div>

									<a href="#" class="btn btn-default btn-post" role="button">READ
										MORE<i class="fa fa-angle-double-right"></i>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 text-center">
					<ul class="pagination">
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Blog Section -->
</body>
</html>