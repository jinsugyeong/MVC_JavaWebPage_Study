<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
%>
<!DOCTYPE html>	


	<div id="header">
		<div id="wrapper">
			<h1><a href="<%=request.getContextPath() %>">8080</a></h1>

<!-- 로그인 전 화면 시작 -->
<%
	if(S_LEVEL==null){
%>
			
			<div class="login">
				<form action="<%=request.getContextPath() %>/login/login_action.jsp" method="post">
					<label>id: <input type="text" name="id"></label>
					<label>pw: <input type="password" name="pw"></label>
					<input type="submit" value="login">
				</form>
			</div>
<!-- 로그인 전 화면 끝 -->


<!-- 로그인 후 화면 시작-->
			
<%
} else {
%>
<div class="login">
				<p><%=S_LEVEL %> <b> <%=S_NAME %></b>님 안녕하세요</p>
				<a href="<%=request.getContextPath() %>/login/logout.jsp">
				<input type="submit" value="logout" class="btn-logout"></input></a>
			</div>
<!-- 1. 구매자일때 -->
	<%
		if(S_LEVEL =="구매자") {
	%>
			<nav class ="top-nav">
				<ul>
					<li><a href="<%=request.getContextPath() %>/user/user_insert_form.jsp">01회원등록</a></li>
				</ul>
			</nav>			
	<%
		} else if(S_LEVEL =="판매자") {
	%>
	
<!-- 2. 판매자일때 -->		
			<nav class ="top-nav">
				<ul>
					<li><a href="<%=request.getContextPath() %>/user/user_insert_form.jsp">01회원등록</a></li>
					<li><a href="#">03상품등록</a></li>
					<li><a href="#">04상품리스트</a></li>
				</ul>
			</nav>

	<%
		} else if(S_LEVEL =="관리자") {
	%>
<!-- 3. 관리자일때 -->		
			<nav class ="top-nav">
				<ul>
					<li><a href="<%=request.getContextPath() %>/user/user_insert_form.jsp">01회원등록</a></li>
					<li><a href="<%=request.getContextPath() %>/user/user_list.jsp">02회원리스트</a></li>
					<li><a href="#">03상품등록</a></li>
					<li><a href="#">04상품리스트</a></li>
				</ul>
			</nav>
		
		
<%
		} else if(S_LEVEL =="최고관리자") {
%>
<!-- 2. 최고관리자일때 -->			
			<nav class ="top-nav">
				<ul>
					<li><a href="<%=request.getContextPath() %>/user/user_insert_form.jsp">01회원등록</a></li>
					<li><a href="<%=request.getContextPath() %>/user/user_list.jsp">02회원리스트</a></li>
					<li><a href="#">03상품등록</a></li>
					<li><a href="#">04상품리스트</a></li>
				</ul>
			</nav>			
			
<%
		}
%>
<!-- 로그인 후 화면 끝 -->
<%
}
%>
		</div>
		</div>
		<!-- End Header -->

