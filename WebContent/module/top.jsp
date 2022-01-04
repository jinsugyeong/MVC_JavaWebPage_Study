<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_NAME = (String)session.getAttribute("S_NAME");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
System.out.println(S_ID + "<- S_ID top.jsp");
System.out.println(S_NAME + "<- S_NAME top.jsp");
System.out.println(S_LEVEL + "<- S_LEVEL top.jsp");
%>
   <!-- Begin Wrapper -->
   <div id="wrapper">
         <!-- Begin Header -->
         <div id="header">
  
		       <a href="<%= request.getContextPath()%>/index.jsp">홈으로</a>	<br/>	 <br/>
<%
if(S_LEVEL == null){
%>
<!-- 1-1로그인 전 화면 시작 -->
<a href="<%= request.getContextPath() %>/goods/goods_search_list.jsp">02상품리스트</a><br/><br/>

<form action="<%= request.getContextPath() %>/login/login_action.jsp" method="post" id="loginForm">
	아이디 : <input type="text" name="uid">	
	비번 : <input type="password" name="upw">	
		<input type="submit" value="로그인">
</form>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp"><button type="button" >회원가입</button></a>
<!-- 1-1로그인 전 화면 End -->
<%}else{ %>
<!-- 1-2로그인 후 화면 시작 -->
<%
	if(S_LEVEL.equals("구매자")){
%>	
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%=S_ID%>">01마이페이지</a>
<a href="<%= request.getContextPath() %>/goods/goods_search_list.jsp">02상품리스트</a> <br/><br/>


<%
	}else if(S_LEVEL.equals("판매자")){
%>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%=S_ID%>">01마이페이지</a>
<a href="<%= request.getContextPath() %>/goods/goods_search_list.jsp">02상품리스트</a> 
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">04상품등록</a>
<a href="<%= request.getContextPath() %>/goods/goods_admin.jsp">05상품관리</a><br/><br/>

<%
	}else if(S_LEVEL.equals("관리자") || S_LEVEL.equals("최고관리자")){
%>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%=S_ID%>">01마이페이지</a> <!-- 업데이트로로그인한사람아이디 -->
<a href="<%= request.getContextPath() %>/goods/goods_search_list.jsp">02상품리스트</a> <!-- 그냥상품테이블리스트+검색폼include -->
<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">03회원리스트</a> <!-- 회원등록폼 왼쪽메뉴에 include -->
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">04상품등록</a> <!-- 판매자이상부터만 -->
<a href="<%= request.getContextPath() %>/goods/goods_admin.jsp">05상품관리</a><!-- 로그인한사람 상품만나오게 -->
<a href="<%= request.getContextPath() %>/superadmin/superadmin_index.jsp">06최고관리자메뉴</a><br/><br/><!-- 관리자랑최고관리자만보이고, 최고관리자만 들어갈수있음 -->
<%
	}
%>
	<%= S_ID %> 아이디 / <%= S_LEVEL %> 권한 로그인 중
	<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
<!-- 1-2로그인 후 화면 End -->
<%} %>
			   
		 </div>
		 <!-- End Header -->