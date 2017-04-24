<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/resources/admin/assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/admin/assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Member List</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath }/resources/admin/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="${pageContext.request.contextPath }/resources/admin/assets/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath }/resources/admin/assets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>

<body>

	<div class="wrapper">
	    <div class="sidebar" data-color="purple" data-image="${pageContext.request.contextPath }/resources/admin/assets/img/sidebar-1.jpg">
			<!--
	        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
		    Tip 2: you can also add an image using data-image tag

			-->

			<div class="logo">
				<a href="http://www.creative-tim.com" class="simple-text">
					발자국
				</a>
			</div>


	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/dashboard.do">
	                        <i class="material-icons">dashboard</i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	                <li class="active">
	                    <a href="${pageContext.request.contextPath }/admin/memberlist.do">
	                        <i class="material-icons">content_paste</i>
	                        <p>Member List</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/boardlist.do">
	                        <i class="material-icons">library_books</i>
	                        <p>Board List</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/adv.do">
	                        <i class="material-icons">location_on</i>
	                        <p>Add advertisement</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/notifications.do">
	                        <i class="material-icons text-gray">notifications</i>
	                        <p>Notifications</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/faq.do">
	                        <i class="material-icons">bubble_chart</i>
	                        <p>FAQ</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    	
		</div>

	    <div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Member List</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
								</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">notifications</i>
									<span class="notification">5</span>
									<p class="hidden-lg hidden-md">Notifications</p>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">Mike John responded to your email</a></li>
									<li><a href="#">You have 5 new tasks</a></li>
									<li><a href="#">You're now friend with Andrew</a></li>
									<li><a href="#">Another Notification</a></li>
									<li><a href="#">Another One</a></li>
								</ul>
							</li>
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
	 							   <i class="material-icons">person</i>
	 							   <p class="hidden-lg hidden-md">Profile</p>
	 						   </a>
							</li>
						</ul>

						<form class="navbar-form navbar-right" role="search">
							<div class="form-group  is-empty">
	                        	<input type="text" class="form-control" placeholder="Search">
	                        	<span class="material-input"></span>
							</div>
							<button type="submit" class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i><div class="ripple-container"></div>
							</button>
	                    </form>
					</div>
				</div>
			</nav>

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">정상 회원 목록</h4>
	                                <p class="category">정상 회원 목록</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>이메일</th>
	                                    	<th>아이디</th>
	                                    	<th>가입일</th>
											<th>MyMap 수</th>
											<th>MyPlan 수</th>
											<th>신고된 MyMap 수</th>
											<th>상태 변경</th>
											<th>영구 삭제</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:if test="${ not empty regularMemberInfoList }">
	                                    		<c:forEach var="regularMemberInfoList" items="${ regularMemberInfoList }" varStatus="loop">
			                                        <tr>
			                                        	<td>${ regularMemberInfoList.email }</td>
			                                        	<td>${ regularMemberInfoList.userid }</td>
			                                        	<td>${ regularMemberInfoList.regdate }</td>
			                                        	<td>${ regularMemberInfoList.myMapCnt }</td>
														<td>${ regularMemberInfoList.myPlanCnt }</td>
														<td>${ regularMemberInfoList.reportedMyMapCnt }</td>
														<td>${ regularMemberInfoList.status }</td>
														<td><a href="#">회원정보 영구 삭제</a></td>
			                                        </tr>
		                                        </c:forEach>
	                                        </c:if>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                 
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">블라인드 회원 목록</h4>
	                                <p class="category">블라인드 회원 목록</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>이메일</th>
	                                    	<th>아이디</th>
	                                    	<th>가입일</th>
											<th>MyMap 수</th>
											<th>MyPlan 수</th>
											<th>신고된 MyMap 수</th>
											<th>상태 변경</th>
											<th>영구 삭제</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:if test="${ not empty blindedMemberInfoList }">
	                                    		<c:forEach var="blindedMemberInfoList" items="${ blindedMemberInfoList }" varStatus="loop">
			                                        <tr>
			                                        	<td>${ blindedMemberInfoList.email }</td>
			                                        	<td>${ blindedMemberInfoList.userid }</td>
			                                        	<td>${ blindedMemberInfoList.regdate }</td>
			                                        	<td>${ blindedMemberInfoList.myMapCnt }</td>
														<td>${ blindedMemberInfoList.myPlanCnt }</td>
														<td>${ blindedMemberInfoList.reportedMyMapCnt }</td>
														<td>${ blindedMemberInfoList.status }</td>
														<td><a href="#">회원정보 영구 삭제</a></td>
			                                        </tr>
		                                        </c:forEach>
	                                        </c:if>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>

	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">탈퇴 회원 목록</h4>
	                                <p class="category">탈퇴 회원 목록</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>이메일</th>
	                                    	<th>아이디</th>
	                                    	<th>가입일</th>
	                                    	<th>탈퇴일</th>
											<th>MyMap 수</th>
											<th>MyPlan 수</th>
											<th>신고된 MyMap 수</th>
											<th>상태 변경</th>
											<th>영구 삭제</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:if test="${ not empty deactivatedMemberInfoList }">
	                                    		<c:forEach var="deactivatedMemberInfoList" items="${ deactivatedMemberInfoList }" varStatus="loop">
			                                        <tr>
			                                        	<td>${ deactivatedMemberInfoList.email }</td>
			                                        	<td>${ deactivatedMemberInfoList.userid }</td>
			                                        	<td>${ deactivatedMemberInfoList.regdate }</td>
			                                        	<td>${ deactivatedMemberInfoList.deactivatedate }</td>
			                                        	<td>${ deactivatedMemberInfoList.myMapCnt }</td>
														<td>${ deactivatedMemberInfoList.myPlanCnt }</td>
														<td>${ deactivatedMemberInfoList.reportedMyMapCnt }</td>
														<td>${ deactivatedMemberInfoList.status }</td>
														<td><a href="#">회원정보 영구 삭제</a></td>
			                                        </tr>
		                                        </c:forEach>
	                                        </c:if>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>		                    


	                </div>
	            </div>
	        </div>

	        <footer class="footer">
	            <div class="container-fluid">
	                <nav class="pull-left">
	                    <ul>
	                        <li>
	                            <a href="#">
	                                Home
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                                Company
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                                Portfolio
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                               Blog
	                            </a>
	                        </li>
	                    </ul>
	                </nav>
	                <p class="copyright pull-right">
	                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
	                </p>
	            </div>
	        </footer>
	    </div>
	</div>

</body>

	<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/bootstrap-notify.js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/demo.js"></script>

</html>
