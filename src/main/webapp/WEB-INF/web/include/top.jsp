<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style type="text/css">
</style>

<script type="text/javascript">
	function goSearch(){
	    location.href = "${ pageContext.request.contextPath }/map/search.do?searchtext="+$('#searchtext').val();
	}
</script>

</head>
<body>
	<!-- Preloader -->
	<div class="preloader-wrap">
		<div class="preloader-inside">
			<div class="spinner spinner-1">
				<img
					src="${pageContext.request.contextPath }/resources/img/logo.png"
					alt="responsive img">
			</div>
		</div>
	</div>
	<!-- End Preloader -->
	<!-- Scroll Top Button -->
	<a href="#home" class="smoothscroll">
		<div class="scroll-top">
			<i class="fa fa-angle-up"></i>
		</div>
	</a>
	<!-- End Scroll Top Button -->

	<!-- Nav Section -->
	<header>
		<!-- Nav Section -->
		<nav class="navbar navbar-default navbar-fixed-top nav-area"
			id="scroll-menu">
			<div class="container">
				<div class="row">
					<div class="navbar-header col-md-3">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="${pageContext.request.contextPath }/main.do"><img
							src="${pageContext.request.contextPath }/resources/img/logo.png"
							alt="responsive img"></a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<div class="nav navbar-nav navbar-left col-md-6">
							<!-- hidden-xs hidden-sm -->
							<form action="${pageContext.request.contextPath }/map/search.do" method="get">
								<div class="form-group">
									<div class="input-group">
										<input id="searchtext" name="searchtext" type="text" placeholder="Search"
											class="form-control placeholder"> <span
											class="input-group-btn"> <a href="javascript:goSearch()"
											class="btn btn-default btn-search"><i
												class="fa fa-search"></i></a>
										</span>
									</div>
								</div>
							</form>
						</div>
						<ul class="nav navbar-nav col-md-3 aa">
							<li><a href="#">Log In</a></li>
							<!-- <li><a href="#">Log Out</a></li> -->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">User : ${sessionScope.user }</a>
								<ul class="dropdown-menu">
									<li><a href="${ pageContext.request.contextPath }/member/mypage.do">My Page</a></li>
									<li><a href="#">Log Out</a></li>
									<li><a href="#">Service</a></li>
								</ul></li>
						</ul>

					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</nav>
	</header>
	<!-- End Nav Section -->
</body>
</html>