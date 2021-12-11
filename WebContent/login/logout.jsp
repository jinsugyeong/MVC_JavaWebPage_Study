<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.invalidate();
%>
<script type="text/javascript">
	alert('로그아웃 되었습니다.');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>