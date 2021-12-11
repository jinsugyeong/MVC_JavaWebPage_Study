<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");


System.out.println(id + "<--id  login_action.jsp");
System.out.println(pw + "<--pw  login_action.jsp");

/* 아이디일치불일치조건비교 */
String dbid ="11";
String dbpw = "22";

String dbname = "홍길동";
String level = "최고관리자";

String alert = null;

if(id.equals(dbid)) {
	System.out.println("1-1 아이디 일치");
	
	if(pw.equals(dbpw)){
		System.out.println("2-1 비밀번호 일치");
		
		session.setAttribute("S_ID",id);
		session.setAttribute("S_NAME",dbname);
		session.setAttribute("S_LEVEL",level);
		
		//response.sendRedirect(request.getContextPath() + "/index.jsp");
		
		alert = "로그인 성공";
	}else {
		System.out.println("2-2 비밀번호 불일치");
		
		alert = "비밀번호를 확인하세요";		
	}	
}else {
	System.out.println("1-2 아이디 불일치");
	alert = "아이디를 확인하세요";
}

%>

<script type="text/javascript">
	alert('<%=alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>