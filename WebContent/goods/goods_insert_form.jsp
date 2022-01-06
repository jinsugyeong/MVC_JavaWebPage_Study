<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<%-- <%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %> --%>

	<h2>상품등록화면</h2>
	<br>
	<form action="<%=request.getContextPath() %>/goods/goods_insert_action.jsp" method="post" id="goodsform">
		<label><span>상품명 : </span><input type="text" name="gname"></label>
		<label><span>카테고리 : </span><select name="gcate">
			<option value="">:: 카테고리 ::</option>
			<option value="아우터">아우터</option>			
			<option value="상의">상의</option>			
			<option value="하의">하의</option>			
			<option value="가방">가방</option>			
			<option value="악세서리">악세서리</option>			
		</select></label>		
		<label><span>가격 : </span><input type="text" name="gprice"></label>
		<label><span>색상 : </span><input type="text" name="gcolor"></label>
		<label><span>사이즈 : </span><input type="text" name="gsize"></label>
		<label><span>상세설명 : </span><textarea rows="5" cols="30"></textarea></label>
		<input type="submit" value="등록">
	</form>

<%@ include file="/module/hadan.jsp" %>
</body>
</html>