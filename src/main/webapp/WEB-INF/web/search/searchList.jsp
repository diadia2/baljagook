<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search List</title>

</head>
<body>
<div class="container">
			<div class="search_list">
				<div class="search_top">
					검색결과 : <b>20</b> 건
				</div>
				<div class="list">
					<ul>
						<c:forEach var="mymapList" items="${ mymapList }">
							<li><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ mymapList.idx }">
									<div class="list_box">
										<div class="imgs">
											<img
												src="http://imgnews.naver.com/image/108/2016/07/22/2016072218131889688_1_99_20160722190904.jpg" />
										</div>
										<div class="infos">
											<span class="title"> ${ mymapList.title }<br /> ${ mymapList.content }
											</span><br /> <br /> <span class="tags"> <c:forEach
													var="hashtagList" items="${ hashtagList }">
													<c:if test="${ hashtagList.mymapidx == mymapList.idx }">
	                                    	#${ hashtagList.name }
	                                    	</c:if>
												</c:forEach>
											</span>
											<!-- Like -->
											<br />
											<c:choose>
												<c:when
													test="${ likeAlreadyChecked[mymapList.idx] == true }">
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
										</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>