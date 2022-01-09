<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.dao.Gdao" %>
<%@ page import="kr.or.ksmart.dto.Goods" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%
	String send_gcode = request.getParameter("send_gcode");
	
	Gdao gdao = new Gdao();
	Goods g = gdao.gUpdateSelete(send_gcode);
	String dbgcode = g.getG_code();
	String dbgname = g.getG_name();
	String dbgcate = g.getG_cate();
	String dbgprice = g.getG_price();
	String dbgcolor = g.getG_color();
	String dbgsize = g.getG_size();
	String dbgdesc = g.getG_desc();
%>
	<h2>상품수정화면</h2>
	<br><br>
	<form action="<%=request.getContextPath() %>/goods/goods_update_action.jsp" method="post" id="goodsform">
		<input type="hidden" name="gcode" value="<%= dbgcode %>">
		<label><span>상품명 : </span><input type="text" name="gname" value="<%= dbgname%>"></label>
		<label><span>카테고리 : </span><select name="gcate">
			<option value="<%=dbgcate%>"><%=dbgcate%></option>
			<option value="아우터">아우터</option>			
			<option value="상의">상의</option>			
			<option value="하의">하의</option>			
			<option value="가방">가방</option>			
			<option value="악세서리">악세서리</option>		
		</select></label>		
		<label><span>가격 : </span><input type="text" name="gprice" value="<%= dbgprice%>"></label>
		<label><span>색상 : </span><input type="text" name="gcolor" value="<%= dbgcolor%>"></label>
		<label><span>사이즈 : </span><input type="text" name="gsize" value="<%= dbgsize%>"></label>
		<label><span>상세설명 : </span><textarea rows="5" cols="21" name="gdesc"><%= dbgdesc%></textarea></label>
		<input type="submit" value="등록">
	</form>

<%@ include file="/module/hadan.jsp" %>
</body>
</html>