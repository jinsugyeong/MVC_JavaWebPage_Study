<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="kr.or.ksmart.dao.Udao"%>
<%@ page import="kr.or.ksmart.dto.User"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<--id  login_action.jsp");
System.out.println(pw + "<--pw  login_action.jsp");

String alert = null;

Udao udao = new Udao();
int re = udao.uLoginCheck(id, pw);

if(re==1){
	User u = udao.uGetForSession(id);
	session.setAttribute("S_ID", u.getU_id());
	session.setAttribute("S_LEVEL", u.getU_level());
	session.setAttribute("S_NAME", u.getU_name());
	alert = "로그인 성공";
}else if(re==2){
	alert ="비번 불일치. 로그인 실패";
}else if(re==3){
	alert="아이디 불일치. 로그인 실패";
}
%>

<script type="text/javascript">
	alert('<%=alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>