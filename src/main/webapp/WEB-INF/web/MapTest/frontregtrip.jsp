<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body> 
<form action="${ pageContext.request.contextPath }/map/mapcheck.do" method="POST">
제목<input type="text" name="title"/><br/>
내용<input type="text" name="content"/><br/>
시작날짜<input type="text" name="start"/>&nbsp;&nbsp;
종료날짜<input type="text" name="end"/><br/>
해쉬태그<input type="text" name="hashtag"/><br/>
도시<br/>
<input type="checkbox" name="city" value="경주"/>&nbsp; 경주&nbsp;
<input type="checkbox" name="city" value="안양"/>&nbsp; 안양&nbsp;
<input type="checkbox" name="city" value="서울"/>&nbsp; 서울&nbsp;<br/>
테마<br/>
<input type="checkbox" name="theme" value="연인"/>&nbsp; 연인&nbsp;
<input type="checkbox" name="theme" value="이별"/>&nbsp; 이별&nbsp;
<input type="checkbox" name="theme" value="가족"/>&nbsp; 가족&nbsp;
<p><input type="submit" value="저장" /> 
</form>
</body>
</html>