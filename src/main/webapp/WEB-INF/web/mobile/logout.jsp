<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<script type="text/javascript">
	
	Android.setId(null);
	
</script>
<script>
	window.location.href = "${ pageContext.request.contextPath }/m/main.do";
</script>