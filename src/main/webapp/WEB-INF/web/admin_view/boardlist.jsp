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

	<title>Board List</title>

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

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	function showReportList(regmapidx) {
		console.log(regmapidx);
		
		$.ajax({
			type : 'POST',
			data : jQuery.param({ regmapidx: regmapidx }),
			url : '${ pageContext.request.contextPath }/admin/getReportList.do',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			success : (function(data) {
				console.log('success');
				$('#reportDetail').empty();
				for(var i in data) {
					console.log(data[i]);
					var $appendReportDetail = $("<tr><td>"+data[i].userid+"</td>"+
							  					"<td>"+data[i].regdate+"</td>"+
							  					"<td>"+data[i].reason+"</td></tr>");
					$appendReportDetail.appendTo('#reportDetail');
				}
			})
		});
	}
	
	function blindMap(regmapidx) {
		console.log(regmapidx);
		
		$.ajax({
			type : 'POST',
			data : jQuery.param({ regmapidx : regmapidx }),
			url : '${ pageContext.request.contextPath }/admin/blindRegmap.do',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : (function(data) {
				alert('블라인드 처리 완료');
				window.location.href = '${ pageContext.request.contextPath }/admin/boardlist.do';
			})
			
		});
	}
	
	function cancelBlind(regmapidx) {
		console.log(regmapidx);
		$.ajax({
			type : 'POST',
			data : jQuery.param({ regmapidx : regmapidx }),
			url : '${ pageContext.request.contextPath }/admin/cancelBlind.do',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : (function(data) {
				alert('블라인드 취소 완료');
				window.location.href = '${ pageContext.request.contextPath }/admin/boardlist.do';
			})
			
		});
	}

</script>

</head>

<body>

	<div class="wrapper">
	    <div class="sidebar" data-color="purple" data-image="${pageContext.request.contextPath }/resources/admin/assets/img/sidebar-1.jpg">

			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo">
				<a href="${pageContext.request.contextPath }" class="simple-text">
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
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/memberlist.do">
	                        <i class="material-icons">content_paste</i>
	                        <p>Member List</p>
	                    </a>
	                </li>
	                <li class="active">
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
						<a class="navbar-brand" href="#">Board List</a>
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
	                                <h4 class="title">신고 게시글 목록</h4>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>제목</th>
	                                    	<th>내용</th>
	                                    	<th>작성자</th>
											<th>등록일</th>
											<th>신고 수</th>
											<th>블라인드</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:if test="${ not empty reportedMapDTOList }">
	                                    		<c:forEach var="reportedMapDTOList" items="${ reportedMapDTOList }" varStatus="loop"> 
			                                    	<tr>
			                                    	<td><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ reportedMapDTOList.mymapidx }">${ reportedMapDTOList.title }</a></td>
			                                    	<td>${ reportedMapDTOList.content }</td>
			                                    	<td>${ reportedMapDTOList.userid }</td>
			                                    	<td>${ reportedMapDTOList.regdate }</td>
													<td><a href="#" onclick="showReportList(${ reportedMapDTOList.regmapidx });">${ reportedMapDTOList.count }</a></td>
													<td><button type="button" onclick="blindMap('${ reportedMapDTOList.regmapidx }')">블라인드</button></td>
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
	                                <h4 class="title">신고글 조회</h4>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
		                                    <th>신고인</th>
		                                    <th>신고일</th>
		                                    <th>이유</th>
	                                    </thead>
	                                    <tbody id="reportDetail">
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">블라인드 게시글 목록</h4>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>제목</th>
	                                    	<th>내용</th>
	                                    	<th>작성자</th>
											<th>등록일</th>
											<th>신고 수</th>
											<th>블라인드 취소</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:if test="${ not empty blindedMapDTOList }">
	                                    		<c:forEach var="blindedMapDTOList" items="${ blindedMapDTOList }" varStatus="loop"> 
			                                    	<tr>
			                                    	<td><a href="${ pageContext.request.contextPath }/map/detail.do?mymapidx=${ blindedMapDTOList.mymapidx }">${ blindedMapDTOList.title }</a></td>
			                                    	<td>${ blindedMapDTOList.content }</td>
			                                    	<td>${ blindedMapDTOList.userid }</td>
			                                    	<td>${ blindedMapDTOList.regdate }</td>
													<td><a href="#" onclick="showReportList(${ blindedMapDTOList.regmapidx });">${ blindedMapDTOList.count }</a></td>
													<td><button type="button" onclick="cancelBlind('${ blindedMapDTOList.regmapidx }')">블라인드 취소</button></td>
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
