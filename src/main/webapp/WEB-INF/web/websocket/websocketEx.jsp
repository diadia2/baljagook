<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript">
	var sock = null;
	$(function() {
		sock = new SockJS("/Baljagook/echo");
		sock.onopen = function() {
			sock.send("반갑습니당!");
		}
		sock.onmessage = function(evt) {
			$('#chatMessage').append(evt.data + "<br/>");
			console.log(evt);
		}
		sock.onclose = function() {
			sock.send("퇴장");
		}
		$('#sendMessage').click(function() {
			/* sock.send("hi");
			$('#chatMessage').append("hi <br/>"); */
			if ($("#message").val()!=""){
				sock.send($("#message").val());
				$("#chatMessage").append("")
			}

		});
	});
</script>
</head>
<body>
	<input type="text" id="message">
	<input type="button" id="sendMessage" value="gogo">
	<div id="chatMessage">s</div>
</body>
</html>