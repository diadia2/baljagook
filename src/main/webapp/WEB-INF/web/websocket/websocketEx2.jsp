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
		/* 	sock = new SockJS("/Baljagook/echojs");
			sock.onopen = function() {
				console.log('open socket');
			}
			sock.onmessage = function(evt) {
				console.log('message', evt.data);
				$('#chatMessage').append(evt.data + "<br/>");
			}
			sock.onclose = function() {
				console.log('close');
			}
			$('#sendMessage').click(function() {
				sock.send($("#message").val());
			}); */

		var socket = new SockJS('/Baljagook/endpoint');
		var client = Stomp.over(socket);
		client.connect({}, function(frame) {
			console.log('connected stomp over sockjs');
			client.subscribe('/subscribe/echo', function(message) {
				console.log('receive subscribe');
				console.log(message);
				$('#chatMessage').append(message.body + '<br>');
			});
			/* 		client.subscribe('/user/queue/private-message') = function(data) {
						console.log('sss subscribe');
						console.log(data);
					} */
		});

		$('#sendMessage').click(function() {
			var data = {
				name : "${sessionScope.user}",
				message : $('#message').val()
			};
			client.send('/app/echo', {}, JSON.stringify(data));

		});
	});
</script>
</head>
<body>
	<input type="text" id="message" value="${sessionScope.user}">
	<input type="button" id="sendMessage" value="gogo">
	<div id="chatMessage">s</div>


</body>
</html>