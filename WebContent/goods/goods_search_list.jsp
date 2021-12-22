<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
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

System.out.println(sk + " <-- 선택칸");
System.out.println(sv + " <-- 입력칸");
System.out.println(cate +" <-- 카테고리");

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

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sq = "SELECT * FROM tb_goods";

//1단계 드라이버로딩
Class.forName("com.mysql.jdbc.Driver");

try{
	//2단계 DB연결
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev42db?" +
				"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev42id";
	String dbPass = "dev42pw";
		
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "2단계 DB연결");
	
	
	/* 3단계 쿼리문 준비
	1. null/null/null ->모두
	3. 공백,공백, null ->경고창
	3. 공백,공백, 값 ->조건1개
	4. 값,값,null ->조건1개
	5. 값,값,값 -> 조건2개
	*/
	
	if(cate==null){//카테고리 선택안할 때
		
		if((sk==null && sv==null)||(sk=="" && sv=="") ){
			//처음 로딩했을때
			pstmt = conn.prepareStatement(sq);
		}else{
			//sk랑sv에 값이 있을때 조건1개
			pstmt = conn.prepareStatement(sq+" where "+sk +"=?");
			pstmt.setString(1, sv);
		}
		
	}else{//카테고리 선택할때		
		
		if((sk=="" && sv=="") || (sk!="" && sv=="")){
			//카테고리 선택하고 sk,sv없을때 조건1개
			pstmt = conn.prepareStatement(sq+" where g_cate =?");
			pstmt.setString(1, cate);
		}else {
			//카테고리 선택하고 sk,sv도 있을때 조건2개
			pstmt = conn.prepareStatement(sq+" where "+ sk + "=? and g_cate =?");
			pstmt.setString(1, sv);
			pstmt.setString(2, cate);
		}
		
	}
	System.out.println(pstmt + " <-- 쿼리문 확인");
	
	
	//4 쿼리 실행
	rs = pstmt.executeQuery();
	
	//5 쿼리 실행 결과 사용
	while(rs.next()){
%>
		<tr>
			<td><%= rs.getString("g_cate")%></td>
			<td><%= rs.getString("g_name")%></td>
			<td><%= rs.getString("g_price")%></td>
			<td><%= rs.getString("g_color")%></td>
			<td><%= rs.getString("g_size")%></td>
			<td><%= rs.getString("g_desc")%></td>
		</tr>
<%
	}
	
	
}catch(SQLException ex){
	out.println(ex.getMessage());
	ex.printStackTrace();
}finally{
	// 6단계 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
	
%>
</table>
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>