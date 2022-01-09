<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="kr.or.ksmart.dao.Gdao" %>
<%@ page import="kr.or.ksmart.dto.Goods" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}
td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
	text-align: center;
}
tr:nth-child(even) {
	background-color: #efefef;
}
</style>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" /> 

</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>	

<%@ include file="/goods/goods_search_form.jsp" %>
<br>
<table border="1" width="100%">
  <tr>
    <th>카테고리</th>
    <th>상품명</th>
    <th>가격</th>
    <th>색상</th>
    <th>사이즈</th>
    <th>상세설명</th>
  </tr>
<%
request.setCharacterEncoding("UTF-8");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
String cate = request.getParameter("cate");

if((sk!=null||sk!="") && sv==""){
	if(cate==null){
%>
<script type="text/javascript">
	alert('검색할 조건을 입력해주세요');
	location.href='<%= request.getContextPath()%>/goods/goods_search_list.jsp';
</script>
<%
	}
	}
Gdao gdao = new Gdao();
ArrayList<Goods> alu = gdao.gSearch(sk, sv, cate);

for(int i=0; i<alu.size(); i++){
	Goods g = alu.get(i);
%>
	<tr>
		<td><%=g.getG_cate() %></td>
		<td><%=g.getG_name() %></td>
		<td><%=g.getG_price() %></td>
		<td><%=g.getG_color() %></td>
		<td><%=g.getG_size() %></td>	
		<td><%=g.getG_desc() %></td>
	</tr>
<%
}
	
%>
</table>
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>