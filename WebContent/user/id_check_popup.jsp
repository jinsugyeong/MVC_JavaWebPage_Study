<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.dao.Udao" %>
<!DOCTYPE html>
<form action="id_check_popup.jsp" method="post">
	<input type="text" name="newId">
	<input type="submit" value="검색" id="searchBtn">
</form>
<form>
	<button type="button">id 사용하기</button>
</form>
<%
	//db에 있는 모든 id랑 비교
	String newId = request.getParameter("newId");
	String alert = null;
	boolean re = false;
	Udao udao = new Udao();
	
	if (udao.uSeleteUpdate(newId)!=null){
		alert = "이미 사용중인 아이디 입니다.";
	}else {
		alert="사용 가능한 아이디 입니다.";
	}
%>

<script>
	alert('<%=alert %>');
	var search = document.getElementById('searchBtn');
	document.
	search.onclick = function(){
		if(<%=re %>==true){
			confirm('')
		}else{
			
		}
	}
</script>