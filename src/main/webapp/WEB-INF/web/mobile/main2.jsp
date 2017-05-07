<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Baljagook Main</title>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
<!-- icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>
<body>

	<nav>
		<div class="nav-wrapper">
			<form>
				<div class="input-field">
					<input id="search" type="search" required> <label
						class="label-icon" for="search"><i class="material-icons">search</i></label>
					<i class="material-icons">close</i>
				</div>
			</form>
		</div>
	</nav>
	<script type="text/javascript">
		$(function() {
			$(".dropdown-button").dropdown();
			$(".button-collapse").sideNav();
		});
	</script>

	<nav>
		<div class="nav-wrapper">
			<a href="#!" class="brand-logo">Logo</a> <a href="#"
				data-activates="mobile-demo" class="button-collapse"><i
				class="material-icons">menu</i></a>
			<ul class="right hide-on-med-and-down">
				<li><a href="sass.html">Sass</a></li>
				<li><a href="badges.html">Components</a></li>
				<li><a href="collapsible.html">Javascript</a></li>
				<li><a href="mobile.html">Mobile</a></li>
			</ul>
			<ul class="side-nav" id="mobile-demo">
				<li><a href="sass.html">Sass</a></li>
				<li><a href="badges.html">Components</a></li>
				<li><a href="collapsible.html">Javascript</a></li>
				<li><a href="mobile.html">Mobile</a></li>
			</ul>
		</div>
	</nav>
	<div class="row">
		<div class="col s1">1</div>
		<div class="col s1">2</div>
		<div class="col s1">3</div>
		<div class="col s1">4</div>
		<div class="col s1">5</div>
		<div class="col s1">6</div>
		<div class="col s1">7</div>
		<div class="col s1">8</div>
		<div class="col s1">9</div>
		<div class="col s1">10</div>
		<div class="col s1">11</div>
		<div class="col s1">12</div>
	</div>

	<!-- Navbar goes here -->

	<!-- Page Layout here -->
	<div class="row">

		<div class="col s3">
			<!-- Grey navigation panel -->
			ddd
		</div>

		<div class="col s9">
			<!-- Teal page content  -->
			aaa
			<div class="valign-wrapper">
				<h5>This should be vertically aligned</h5>
			</div>
			<h4 class="truncate">This is an extremely long title that will
				be truncated</h4>
			<div class="card-panel hoverable">Hoverable Card Panel</div>
		</div>

	</div>


<!-- 	<div class="fixed-action-btn toolbar">
		<a class="btn-floating btn-large red"> <i
			class="large material-icons">mode_edit</i>
		</a>
		<ul>
			<li class="waves-effect waves-light"><a href="#!"><i
					class="material-icons">insert_chart</i></a></li>
			<li class="waves-effect waves-light"><a href="#!"><i
					class="material-icons">format_quote</i></a></li>
			<li class="waves-effect waves-light"><a href="#!"><i
					class="material-icons">publish</i></a></li>
			<li class="waves-effect waves-light"><a href="#!"><i
					class="material-icons">attach_file</i></a></li>
		</ul>
	</div> -->


	<div class="fixed-action-btn horizontal click-to-toggle">
		<a class="btn-floating btn-large red"> <i class="material-icons">menu</i>
		</a>
		<ul>
			<li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
			<li><a class="btn-floating yellow darken-1"><i
					class="material-icons">format_quote</i></a></li>
			<li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
			<li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
		</ul>
	</div>

</body>
</html>