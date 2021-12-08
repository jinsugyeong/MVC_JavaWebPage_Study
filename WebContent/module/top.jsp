<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String S_ID = (String)session.getAttribute("S_ID");
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
%>
<!-- Begin Wrapper -->
<div id="wrapper">
	<!-- Begin Header -->
	<div id="header">
		상단 메뉴 <br /><br />
		<%
			if (S_LEVEL == null) {
		%>

			<!-- 로그인 전 화면 1-1 -->
			<a href="<%=request.getContextPath()%>/user/user_insert_form.jsp">01회원가입</a>
			<br /> <br /> <br />
	
			<form action="<%=request.getContextPath()%>/login/login_action.jsp"
				method="post">
				ID <input type="text" name="uid"> PW <input type="password"
					name="upw"> <input type="submit" value=" login ">
			</form>
			<!-- 로그인 전 화면 End 1-1 -->

		<%
			} else {
		%>

			<!-- 로그인 후 화면 1-2 -->
			<%
				if (S_LEVEL == "구매자") {
			%>
			<a href="<%=request.getContextPath()%>/user/user_insert_form.jsp">01회원가입</a>
			<a href="#">04상품검색</a><br /> <br />
			<br />
			<%
				} else if (S_LEVEL == "판매자") {
			%>
			<a href="<%=request.getContextPath()%>/user/user_insert_form.jsp">01회원가입</a>
			<a href="#">03상품등록</a> <a href="#">04상품검색</a>
			<br /> <br /> <br />
			<%
				} else if (S_LEVEL == "관리자") {
			%>
			<a href="<%=request.getContextPath()%>/user/user_insert_form.jsp">01회원가입</a>
			<a href="<%=request.getContextPath()%>/user/user_list.jsp">02전체회원조회</a>
			<a href="#">03상품등록</a> <a href="#">04상품검색</a>
			<a href="<%=request.getContextPath()%>/superadmin/superadmin_index.jsp?S_LEVEL=<%=S_LEVEL%>">05최고관리자페이지</a>
			<br /> <br /> <br />
			<%
				} else if (S_LEVEL == "최고관리자") {
			%>
			<a href="<%=request.getContextPath()%>/user/user_insert_form.jsp">01회원가입</a>
			<a href="<%=request.getContextPath()%>/user/user_list.jsp">02전체회원조회</a>
			<a href="#">03상품등록</a> <a href="#">04상품검색</a> <a
				href="<%=request.getContextPath()%>/superadmin/superadmin_index.jsp?S_LEVEL=<%=S_LEVEL%>">05최고관리자메뉴</a>
			<br /> <br /> <br />
			<%
				}
			%>
			<%=S_ID%> 아이디 / <%=S_LEVEL%> 권한 로그인중
			<a href="<%=request.getContextPath()%>/login/logout.jsp?S_LEVEL=null"><input type="submit" value=" logout "></a>
			<!-- 로그인 후 화면 End 1-2 -->

		<%
			}
		%>
	</div>
	<!-- End Header -->