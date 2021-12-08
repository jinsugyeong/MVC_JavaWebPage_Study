<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("UTF-8");		//post 방식 한글처리
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

System.out.println(uid + "<-- uid  login_action.jsp");
System.out.println(upw + "<-- upw  login_action.jsp");

String dbid = "id001";
String dbpw = "pw001";
String dbname = "일길동";
String dblevel = "최고관리자"; //구매자,판매자,관리자,최고관리자 로 변경해서 테스트
String alert = null;

 if(uid.equals(dbid)) {
	 System.out.println("1-1 아이디 일치");
	 if(upw.equals(dbpw)) {
		 System.out.println("2-1 비밀번호 일치"); 
		 session.setAttribute("S_ID", dbid);
		 session.setAttribute("S_NAME", dbname);
		 session.setAttribute("S_LEVEL", dblevel);
		 //response.sendRedirect(request.getContextPath()+"/index.jsp"); //로그인 성공 시 다시 index페이지로 돌아감
		 alert = "로그인 성공";
	 }else {
		 System.out.println("2-2 비밀번호 불일치");
		 alert = "비번 불일치";
	 }
 } else {
	 System.out.println("1-2 아이디 불일치");
	 alert = "아이디 불일치";
 }


 
%>

<script type="text/javascript">
	alert('<%= alert%>');
	location.href='<%=request.getContextPath() %>/index.jsp';
</script>