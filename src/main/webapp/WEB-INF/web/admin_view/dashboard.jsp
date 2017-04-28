<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/resources/admin/assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/admin/assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Dashboard</title>

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
<script type="text/javascript">
/* 
function start() {
  // Initializes the client with the API key and the Translate API.
  gapi.client.init({
    'apiKey': 'AIzaSyAF05JCFoefu9jROxjM8TcHc8GIR6YDhuU',
    'discoveryDocs': ['https://www.googleapis.com/discovery/v1/apis/translate/v2/rest'],
  }).then(function() {
    // Executes an API request, and returns a Promise.
    // The method name `language.translations.list` comes from the API discovery.
    return gapi.client.language.translations.list({
      q: 'hello world',
      source: 'en',
      target: 'de',
    });
  }).then(function(response) {
    console.log(response.result.data.translations[0].translatedText);
  }, function(reason) {
    console.log('Error: ' + reason.result.error.message);
  });
};

// Loads the JavaScript client library and invokes `start` afterwards.
gapi.load('client', start);
 */
</script>
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
	                <li class="active">
	                    <a href="${pageContext.request.contextPath }/admin/dashboard.do">
	                        <i class="material-icons">dashboard</i>
	                        <p>대시보드</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/memberlist.do">
	                        <i class="material-icons">content_paste</i>
	                        <p>회원 관리</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/admin/boardlist.do">
	                        <i class="material-icons">library_books</i>
	                        <p>게시글 관리</p>
	                    </a>
	                </li>
	               	<li>
	                    <a href="${pageContext.request.contextPath }/admin/adv.do">
	                        <i class="material-icons">location_on</i>
	                        <p>광고 관리</p>
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
						<a class="navbar-brand" href="#">Dashboard</a>
					</div>
				</div>
			</nav>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="orange">
									<i class="material-icons">content_copy</i>
								</div>
								<div class="card-content">
									<p class="category">Total</p>
									<p class="category">Member</p>
									<h3 class="title"><small>총</small> ${ totalmember }<small>명</small></h3> 
								</div>
								<div class="card-footer">
									<div class="stats"> 
										<i class="material-icons">date_range</i> Number of Members
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="green">
									<i class="material-icons">store</i>
								</div>
								<div class="card-content">
									<p class="category">Total</p>
									<p class="category">Map</p>
									<h3 class="title"><small>총</small> ${ totalmap }<small>개</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">date_range</i> Number of Maps
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="red">
									<i class="material-icons">info_outline</i>
								</div>
								<div class="card-content">
									<p class="category">Total</p>
									<p class="category">Ads</p>
									<h3 class="title">${ totalAdv }<small>건</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">local_offer</i> Advertisement
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="blue">
									<i class="fa fa-twitter"></i>
								</div>
								<div class="card-content">
									<p class="category">Total</p>
									<p class="category">Reg maps</p>
									<h3 class="title"><small>총</small> ${ totalregmap }<small>개</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">update</i> number of Plan
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<div class="card" style="height: 300px">
								<div class="card-header card-chart" data-background-color="green">
									<div class="ct-chart" id="dailySalesChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">Daily New Members</h4>
									<p class="category">일일 가입자 현황</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> updated in  ${ dateFrom } ~ ${ dateTo }
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card" style="height: 300px">
								<div class="card-header card-chart" data-background-color="orange">
									<div class="ct-chart" id="emailsSubscriptionChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">Today Report</h4>
									<p class="category">오늘의 현황</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> today  ${ dateToday } 
									</div>
								</div>

							</div>
						</div>

						<div class="col-md-4">
							<div class="card" style="height: 300px">
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="card-content" style="border-bottom: 1px solid grey">
										<p>페이지뷰 수</p>
										<p class="category"> </p>
										<h3 class="title">
											<span id="pageCount"> </span><small>  view</small>
										</h3>
									</div>
								</div> 
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="card-content" style="border-bottom: 1px solid grey">
										<p>평균 세션시간</p>
										<p class="category"> </p>
										<h3 class="title">
											<span id="sessionCount"> </span><small> 초</small>
										</h3>
									</div>
								</div>
								
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="card-content" style="border-bottom: 1px solid grey">
										<p>유저당 세션 수</p>
										<p class="category"> </p>
										<h3 class="title">
											<span id="sessionsPerUser"> </span><small> 회</small>
										</h3>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="card-content" style="border-bottom: 1px solid grey">
										<p>세션당 페이지수</p>
										<p class="category"> </p>
										<h3 class="title"> 
											<span id="pagePerSession"> </span><small> view</small>
										</h3>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="card-content"></div>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> today  ${ dateToday } 
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="purple">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">Info:</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active">
													<a href="#profile" data-toggle="tab">
														<i class="material-icons">bug_report</i>
														광고업체
													<div class="ripple-container"></div></a>
												</li>
												<li class="">
													<a href="#messages" data-toggle="tab">
														<i class="material-icons">code</i>
														좌표컬럼 현황
													<div class="ripple-container"></div></a>
												</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="card-content">
									<div class="tab-content">
										<div class="tab-pane active" id="profile">
											<table class="table">
												<thead style="color:purple;">
		                                        	<th width="20%">업체명</th>
		                                    		<th width="75%">소개</th>
		                                    		<th> Edit</th>
	                                    		</thead>
												<tbody id="advInfo">
													<c:forEach var="AdvertisementList" items="${ AdvertisementList }" varStatus="i">
														<tr>
															<td><input type="text" class="form-control" value="${ AdvertisementList.name }" readonly="readonly"/></td>
															<td><input type="text" class="form-control" value="${ AdvertisementList.detail }"/></td>
															<td class="td-actions text-right">
																<button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs" onclick="editAdv('${ AdvertisementList.idx }',${ i.index })">
																	<i class="material-icons">edit</i>
																</button>
																<button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs" onclick="deleteAdv('${ AdvertisementList.idx }')">
																	<i class="material-icons">close</i>
																</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="tab-pane" id="messages">
											<table class="table">
												<thead style="color:purple;">
		                                        	<th width="16%"></th>
		                                        	<th width="28%">A week ago</th>
		                                    		<th width="28%">Today</th>
		                                    		<th width="28%">Total</th>
	                                    		</thead>
												<tbody>
													<tr>
														<td>수집된 좌표</td>
														<td>${ weekAgoCoordinatesCount }</td>
														<td>${ todayCoordinatesCount }</td>
														<td>${ totalCoordinatesCount }</td>
													</tr>
												</tbody>
											</table>
											<br/><br/>
											<button type="button" class="btn btn-primary btn-block" onclick="deleteSpots()">CLICK to delete spots before a week</button>
										</div>
										
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6 col-md-12">
							<div class="card">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">The Most Active Users</h4>
	                                <p class="category">여행 지도를 가장 많이 업데이트한 유저</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead class="text-warning">
	                                        <th>Rank</th>
	                                    	<th>email</th>
	                                    	<th>maps</th>
	                                    	<th>id</th>
	                                    </thead>
	                                    <tbody>
		                                    <c:forEach var="memberList" items="${ memberList }" varStatus="i">
		                                    	<tr>
		                                        	<td>${ i.index + 1 }</td>
		                                        	<td>${ memberList.email }</td>
		                                        	<td>${ memberList.status }<small>건</small></td>
		                                        	<td>${ memberList.userid }</td>
	                                        	</tr>
		                                    </c:forEach>
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

	<script type="text/javascript">
		
		var memberCount = [];
		var todayMember = ${ todayMember };
		var users;
		var newusers;
		var sessionCount;
		var AvgSessionTime;
		var pagePerSession;
		var hits;
		var sessionsPerUser;
		var accessToken = '${ accessToken }';
		<c:forEach items="${dailyMemberCount}" var="dailyMemberCount">
			memberCount.push(${dailyMemberCount});
	    </c:forEach>
    	$(document).ready(function(){
    	    console.log(accessToken);
			 
		    	$.ajax({
				    type: 'GET', 
				    url: 'https://www.googleapis.com/analytics/v3/data/ga?ids=ga%3A148780410&start-date=today&end-date=today&metrics=ga%3Ausers%2Cga%3AnewUsers%2Cga%3Asessions%2Cga%3AavgSessionDuration%2Cga%3ApageviewsPerSession%2Cga%3Ahits%2Cga%3AsessionsPerUser&access_token='
					    +accessToken, 
				    dataType : 'json',
				    success: function(data) {
						console.log(data);
						users = data.rows[0][0];
						newusers = data.rows[0][1];
						sessionCount = data.rows[0][2];
						AvgSessionTime = data.rows[0][3];
						pagePerSession = data.rows[0][4];
						hits = data.rows[0][5];
						sessionsPerUser = data.rows[0][6];
						demo.initDashboardPageCharts();
 						$('#pageCount').text(hits);
						$('#sessionCount').text(
											 (Math.floor(AvgSessionTime/60) > 9 ? Math.floor(AvgSessionTime/60) : '0'+Math.floor(AvgSessionTime/60))
											+":"
											+((AvgSessionTime%60).toFixed(0) > 9 ? (AvgSessionTime%60).toFixed(0) : '0'+(AvgSessionTime%60).toFixed(0))
											);
						$('#sessionsPerUser').text(Number(sessionsPerUser).toFixed(2));
						$('#pagePerSession').text(Number(pagePerSession).toFixed(2));
			        }
				}); 
    	});
	</script>
	<script type="text/javascript">
		
	function editAdv(idx, i){
	    
	    if(confirm('현재 소개내용으로 수정 하시겠습니까?')){
			var index = idx;
			var newDetail = $('#advInfo').children().eq(i).children().eq(1).children().eq(0).children().eq(0).val();
			
			$.ajax({
			    type: 'POST', 
			    url: '${pageContext.request.contextPath}/admin/changeAdvDetail.do',
			    data: {
					index : index,
					newDetail : newDetail
			    },
			    dataType : 'json',
			    success: function(data) {
					alert(data);
		        }
			}); 
	    }
	}
	
	function deleteAdv(idx){
	    if(confirm('데이터를 삭제 하시겠습니까?')){
			var index = idx;
			
			$.ajax({
			    type: 'POST', 
			    url: '${pageContext.request.contextPath}/admin/deleteAdv.do',
			    data: {
					index : index
			    },
			    dataType : 'json',
			    success: function(data) {
					alert(data);
					location.href = '${pageContext.request.contextPath}/admin/dashboard.do'
		        }
			});
			
	    }
	}
	
	function deleteSpots(){
	    if(confirm('1주일 이상된 수집좌표를 모두 삭제 하시겠습니까?')){
			
			$.ajax({
			    type: 'POST', 
			    url: '${pageContext.request.contextPath}/admin/deleteSpots.do',
			    dataType : 'json',
			    success: function(data) {
					alert(data);
					location.href = '${pageContext.request.contextPath}/admin/dashboard.do'
		        }
			});
	    }
	}
	
	</script>
</html>
