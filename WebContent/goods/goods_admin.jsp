<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css" /> 
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
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>	
<form action="<%=request.getContextPath() %>/goods/goods_admin.jsp" method="post">
	<b>���ı���</b>
	<label><input type="checkbox" name="sort" value="g.g_date" checked>��ϳ�¥</label>
	<label><input type="checkbox" name="sort" value="g.g_cate">ī�װ�</label>
	<label><input type="checkbox" name="sort" value="g.g_name">�̸�</label>
	<label><input type="checkbox" name="sort" value="g.g_price">����</label>
	<input type="submit" value="����">
</form>
<br>
<table border="1" width="100%">
  <tr>
    <th>ī�װ�</th>
    <th>��ǰ��</th>
    <th>����</th>
    <th>����</th>
    <th>������</th>
    <th>��ϳ�¥</th>
    <th>����</th>
    <th>����</th>    
  </tr>
  
<%
String[] sort = request.getParameterValues("sort");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String id = (String)session.getAttribute("S_ID"); //�α��� ���̵�
String sq = "SELECT * FROM tb_goods AS g JOIN tb_member AS m ON g.m_id=m.m_id where m.m_id=?";

//1�ܰ� ����̹��ε�
Class.forName("com.mysql.jdbc.Driver");


//2�ܰ� DB����
String jdbcDriver = "jdbc:mysql://localhost:3306/dev42db?" +
			"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev42id";
String dbPass = "dev42pw";
	
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

//3�ܰ�
//������ �α����� ��� ���̵�, ������ order by�� check box�� ���ڿ� �����;���
if(sort != null){
	sq += " order by ";
	for(int i=0; i<sort.length; i++){
		if(sort.length==1){
			sq += sort[i];
		}else{
			sq += (i!=sort.length-1) ? sort[i]+"," : sort[i];
		}
	}
	
}
pstmt = conn.prepareStatement(sq);
pstmt.setString(1, id);
System.out.println(pstmt + " <--������ Ȯ��");

//4�ܰ� ��������
rs = pstmt.executeQuery();

while(rs.next()){
	%>
	<tr>
		<td><%= rs.getString("g_cate")%></td>
		<td><%= rs.getString("g_name")%></td>
		<td><%= rs.getString("g_price")%></td>
		<td><%= rs.getString("g_color")%></td>
		<td><%= rs.getString("g_size")%></td>
		<td><%= rs.getString("g_date")%></td>
		<td><a href="<%= request.getContextPath() %>/goods/goods_update_action.jsp?send_id=<%= rs.getString("m_id")%>">����</a></td>
		<td><a href="<%= request.getContextPath() %>/goods/goods_delete_action.jsp?send_id=<%= rs.getString("m_id")%>">����</a></td>	
	</tr>
	<%
}
%>

  
</table>
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>