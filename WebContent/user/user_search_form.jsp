<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style type="text/css">
form{
	widht: 400px;
}
</style>
<form action="<%=request.getContextPath() %>/user/user_search_list.jsp" method="post" class="searchform">
	<select name="sk" >
		<option value="u_id">아이디</option>
		<option value="u_level">권한</option>
		<option value="u_name">이름</option>
		<option value="u_phone">전화번호</option>
		<option value="u_email">이메일</option>		
	</select>
	<input type="text" name="sv">
	<input type="submit" value="검색버튼">	
</form>
