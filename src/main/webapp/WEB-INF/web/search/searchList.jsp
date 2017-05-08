<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search List</title>
<style type="text/css">
.pretty.plain.toggle i.info:before {
    color: red !important;
}
</style>
</head>
<body>
			<c:forEach var="mymapList" items="${ mymapList }" varStatus="status">

				<li class="col-lg-3 col-sm-6 col-md-4 mix hover_1" data-cat="4" style="margin-bottom: 20px">
					<div class="thumbnail-box-wrapper">
						<div class="thumbnail-box">
							<a class="thumb-link" href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }" title=""></a>
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
								<a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }" title="">${ mymapList.title } - ${mymapList.userid }<%--  - ${mapImg} - ${status.index } --%></a> 
								
								<small>${mymapList.regdate }</small>
								<!-- Like -->
										<br />
										<c:choose>
											<c:when test="${ likeAlreadyChecked[mymapList.idx] == true }">
												<div class="pretty plain smooth toggle">
													<input type="checkbox" onclick="handleLike(this, ${ mymapList.idx });"
													checked="checked"> <label><i
														class="fa fa-heart-o"></i></label> <label><i
														class="fa fa-heart info"></i></label>
														<span id="likeCnt${ mymapList.idx}">${ likeMap[mymapList.idx] }</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="pretty plain smooth toggle">
													<input type="checkbox" onclick="handleLike(this, ${ mymapList.idx });"> <label><i
														class="fa fa-heart-o"></i></label> <label><i
														class="fa fa-heart info"></i></label>
														<span id="likeCnt${ mymapList.idx}">${ likeMap[mymapList.idx] }</span>
												</div>
											</c:otherwise>
										</c:choose>
										<i class="fa fa-eye" aria-hidden="true"></i>&nbsp<span>${ viewcntMap[mymapList.idx] }</span>
								
								
								<span class="tags"> 
									<c:forEach var="hashtagList" items="${ hashtagList }">
										<c:if test="${ hashtagList.mymapidx == mymapList.idx }">
		                                    	#${ hashtagList.name }
		                                </c:if>
									</c:forEach>
								</span>
							</h3>
						</div>
					</div>
				</li>
			</c:forEach>
			
			<c:forEach var="mymapList" items="${ mymapList2 }" varStatus="status">

				<li class="col-lg-3 col-sm-6 col-md-4 mix hover_2" data-cat="4" style="margin-bottom: 20px">
					<div class="thumbnail-box-wrapper">
						<div class="thumbnail-box">
							<a class="thumb-link" href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }" title=""></a>
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
								<a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }" title="">${ mymapList.title } - ${mymapList.userid }<%--  - ${mapImg} - ${status.index } --%></a> 
								
								<small>${mymapList.regdate }</small>
								<!-- Like -->
										<br />
										<c:choose>
											<c:when test="${ likeAlreadyChecked[mymapList.idx] == true }">
												<div class="pretty plain smooth toggle">
													<input type="checkbox" onclick="handleLike(this, ${ mymapList.idx });"
													checked="checked"> <label><i
														class="fa fa-heart-o"></i></label> <label><i
														class="fa fa-heart info"></i></label>
														<span id="likeCnt${ mymapList.idx}">${ likeMap[mymapList.idx] }</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="pretty plain smooth toggle">
													<input type="checkbox" onclick="handleLike(this, ${ mymapList.idx });"> <label><i
														class="fa fa-heart-o"></i></label> <label><i
														class="fa fa-heart info"></i></label>
														<span id="likeCnt${ mymapList.idx}">${ likeMap[mymapList.idx] }</span>
												</div>
											</c:otherwise>
										</c:choose>
										<i class="fa fa-eye" aria-hidden="true"></i>&nbsp<span>${ viewcntMap[mymapList.idx] }</span>
								
								
								<span class="tags"> 
									<c:forEach var="hashtagList" items="${ hashtagList }">
										<c:if test="${ hashtagList.mymapidx == mymapList.idx }">
		                                    	#${ hashtagList.name }
		                                </c:if>
									</c:forEach>
								</span>
							</h3>
						</div>
					</div>
				</li>
			</c:forEach>
</body>
</html>