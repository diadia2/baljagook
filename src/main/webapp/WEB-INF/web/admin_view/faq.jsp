<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/resources/admin/assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/admin/assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>FAQ</title>

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

<style>
/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>


<script>
	$(document).ready(function () {		

		$('#addFAQ').click(function () {
			$('#addFAQModal').modal('show');
		});
		
		$('#closeAddFAQModal').click(function () {
			$('#addFAQModal').modal('hide');
		});

		$('#closeEditFAQModal').click(function () {
			$('#editFAQModal').modal('hide');
		});		
		
		/* -------------------FAQ 등록--------------------------- */
		$('#faqFormAdd').submit(function (e) {
			console.log('faq form submitted');
			e.preventDefault();

 			if($('#addTitle').val() == "") {
				alert('제목을 입력하세요');
			} else if($('#addContent').val() == "") {
				alert('내용을 입력하세요');
			} else {					
				var faqData = {
						'title' : $('#addTitle').val(),
 						'content' : $('#addContent').val()
				};
				var dataJSON = JSON.stringify(faqData);
					
	 			$.ajax({
					type : 'POST',
					data : dataJSON,
					url : '${ pageContext.request.contextPath }/addFAQ.do',
					contentType : 'application/json',
					success : (function(data) {
						alert('등록되었습니다.');
						window.location.href = '${ pageContext.request.contextPath }/admin/faq.do';
					})	
				});
			}
		});
		
		/* -------------------FAQ 수정--------------------------- */		
		$('#faqFormEdit').submit(function (e) {
			console.log('faq 수정');
			e.preventDefault();
			
 			if($('#editTitle').val() == "") {
				alert('제목을 입력하세요');
			} else if($('#editContent').val() == "") {
				alert('내용을 입력하세요');
			} else {					
				var faqData = {
						'idx' : $('#faqIdx').val(),
						'title' : $('#editTitle').val(),
						'content' : $('#editContent').val()
				};
				var dataJSON = JSON.stringify(faqData);
					
	 			$.ajax({
					type : 'POST',
					data : dataJSON,
					url : '${ pageContext.request.contextPath }/editFAQ.do',
					contentType : 'application/json',
					success : (function(data) {
						alert('수정되었습니다.');
						window.location.href = '${ pageContext.request.contextPath }/admin/faq.do';
					})	
				});
			}
		});		
				
	});
	
	/* -------------------FAQ 삭제--------------------------- */	
	function removeFAQ(idx) {
		alert('삭제하시겠습니까?');
			$.ajax({
				type : 'POST',
				url : '${ pageContext.request.contextPath }/removeFAQ.do',
				data : { idx: idx},
				success : (function(data) {
					alert('삭제되었습니다.');
					window.location.href = '${ pageContext.request.contextPath }/admin/faq.do';
				})	
			});			
	}
	
	/* ------------------수정하려는 FAQ 데이터 불러오기--------------------------- */
	function getFAQByIdx(idx) {
			$.ajax({
				type : 'POST',
				url : '${ pageContext.request.contextPath }/getFAQByIdx.do',
				data : { idx: idx},
				dataType : 'json',
				success : (function(data) {
					$('#faqIdx').val(data['idx']);
					$('#editTitle').val(data['title']);
					$('#editContent').val(data['content']);
					showFAQEditForm();
				})	
			});
		
	}
	
	/* -------------------수정하려는 FAQ 데이터를 포함한 수정 Form 열기--------------------------- */	
	function showFAQEditForm() {
		$('#editFAQModal').modal('show');		
	}
	
</script>

</head>
<body>

	<!-- FAQ 등록 Modal -->
	<div id="addFAQModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span id="closeAddFAQModal" class="close">&times;</span>
				<h2>FAQ 등록</h2>
			</div>
			<form id="faqFormAdd">
				<input type="text" id="addTitle" name="addTitle">
				<br/>
				<textarea id="addContent" class="text" cols="80" rows="20" name="addContent" ></textarea>
				<br/>
				<button type="submit">등록</button> 
			</form>
		</div>
	</div>
	
	<!-- FAQ 수정 Modal -->
	<div id="editFAQModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span id="closeEditFAQModal" class="close">&times;</span>
				<h2>FAQ 수정</h2>
			</div>
			<form id="faqFormEdit">
				<input type="hidden" id="faqIdx" name="faqIdx">
				<input type="text" id="editTitle" name="editTitle">
				<br/>
				<textarea id="editContent" class="text" cols="80" rows="20" name="editContent" ></textarea>
				<br/>
				<button type="submit">수정</button> 
			</form>
		</div>
	</div>	


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
	                <li class="active">
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
						<a class="navbar-brand" href="#">Notifications</a>
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
	                <div class="card">
	                    <div class="card-header" data-background-color="purple">
	                        <h4 class="title">FAQ</h4>
	                    </div>
	                    <div class="" style="text-align: right">
							<button id="addFAQ" type="button" class="btn btn-black btn-round btn-just-icon">
								<i class="material-icons">add</i><div class="ripple-container"></div>
							</button>
						</div>	                    
						<div class="col-lg-12 col-md-12">
							<div class="card card-nav-tabs">
								<div class="card-content">
									<div class="tab-content">
										<div class="tab-pane active" id="profile">
 											<table class="table">
												<tbody>
													<c:if test="${ not empty faqList }">
														<c:forEach var="faqList" items="${ faqList }" varStatus="loop">
															<tr>
																<td><a data-toggle="collapse" href="#faqContent${ loop.index }" aria-expanded="false" aria-controls="faqContent${ loop.index }" >${ faqList.title }</a></td>
																<td class="td-actions text-right">
																	<button type="button" onclick="getFAQByIdx(${ faqList.idx });" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
																		<i class="material-icons">edit</i>
																	</button>
																	<button type="button" onclick="removeFAQ(${ faqList.idx });" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
																		<i class="material-icons">close</i>
																	</button>
																</td>
															</tr>
															<tr>
																<td>
																	<div class="collapse" id="faqContent${ loop.index }">
																		${ faqList.content }
																	</div>																
																</td>
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