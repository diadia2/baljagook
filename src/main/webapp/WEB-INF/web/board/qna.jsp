<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/share2.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A</title>
</head>
<body>
	<div id="sb-site">
		<div id="page-wrapper">
			<div id="page-content-wrapper">
				<jsp:include page="/top2.do" />
				<div id="page-content">
					<script type="text/javascript"
						src="${pageContext.request.contextPath }/resources/assets/widgets/tabs/tabs.js"></script>
					<div id="page-title">
						<h2>FAQ</h2>
						<p class="mrg15B">자주 묻는 질문</p>
					</div>
					<div class="row">
						<div class="col-md-3">
							<ul class="list-group">
								<c:forEach var="faqList" items="${ faqList }" varStatus="i">
									<li class="mrg10B"><a href="#faq-tab-${ i.index + 1 }"
										data-toggle="tab" class="list-group-item bg-white">${ faqList.title }
											<i class="glyph-icon icon-angle-right mrg0A"></i>
									</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="col-md-9">
							<div id="allfaq" class="tab-content">
								<c:forEach var="faqList" items="${ faqList }" varStatus="i">
									<c:if test="${ i.index == 0 }">
										<div class="tab-pane fade active in pad0A"
											id="faq-tab-${ i.index + 1 }">
											<div class="panel-group" id="accordion5">
												<div class="panel">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-parent="#accordion5"
																href="#collapseOne">${ faqList.title }</a>
														</h4>
													</div>
													<div id="collapseOne${ i.index }"
														class="panel-collapse collapse in">
														<div class="panel-body pad0B">
															<p class="mrg15B">${ faqList.content }</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${ i.index != 0 }">
										<div class="tab-pane fade pad0A" id="faq-tab-${ i.index + 1 }">
											<div class="panel-group" id="accordion5">
												<div class="panel">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-parent="#accordion5"
																href="#collapseOne">${ faqList.title }</a>
														</h4>
													</div>
													<div id="collapseOne${ i.index }"
														class="panel-collapse collapse in">
														<div class="panel-body pad0B">
															<p class="mrg15B">${ faqList.content }</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/bottom2.do" />
	</div>
</body>
</html>