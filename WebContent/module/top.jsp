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
  
		       <a href="<%= request.getContextPath()%>/index.jsp">Ȩ����</a>	<br/>	 <br/>
<%
if(S_LEVEL == null){
%>
<!-- 1-1�α��� �� ȭ�� ���� -->
<a href="<%= request.getContextPath() %>/goods/goods_search_list.jsp">02��ǰ����Ʈ</a><br/><br/>

<form action="<%= request.getContextPath() %>/login/login_action.jsp" method="post" id="loginForm">
	���̵� : <input type="text" name="uid">	
	��� : <input type="password" name="upw">	
		<input type="submit" value="�α���">
</form>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp"><button type="button" >ȸ������</button></a>
<!-- 1-1�α��� �� ȭ�� End -->
<%}else{ %>
<!-- 1-2�α��� �� ȭ�� ���� -->
<%
	if(S_LEVEL.equals("������")){
%>	
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%=S_ID%>">01����������</a>
<a href="<%= request.getContextPath() %>/goods/goods_search_list.jsp">02��ǰ����Ʈ</a> <br/><br/>


<%
	}else if(S_LEVEL.equals("�Ǹ���")){
%>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%=S_ID%>">01����������</a>
<a href="<%= request.getContextPath() %>/goods/goods_search_list.jsp">02��ǰ����Ʈ</a> 
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">04��ǰ���</a>
<a href="<%= request.getContextPath() %>/goods/goods_admin.jsp">05��ǰ����</a><br/><br/>

<%
	}else if(S_LEVEL.equals("������") || S_LEVEL.equals("�ְ������")){
%>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%=S_ID%>">01����������</a> <!-- ������Ʈ�ηα����ѻ�����̵� -->
<a href="<%= request.getContextPath() %>/goods/goods_search_list.jsp">02��ǰ����Ʈ</a> <!-- �׳ɻ�ǰ���̺���Ʈ+�˻���include -->
<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">03ȸ������Ʈ</a> <!-- ȸ������� ���ʸ޴��� include -->
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">04��ǰ���</a> <!-- �Ǹ����̻���͸� -->
<a href="<%= request.getContextPath() %>/goods/goods_admin.jsp">05��ǰ����</a><!-- �α����ѻ�� ��ǰ�������� -->
<a href="<%= request.getContextPath() %>/superadmin/superadmin_index.jsp">06�ְ�����ڸ޴�</a><br/><br/><!-- �����ڶ��ְ�����ڸ����̰�, �ְ�����ڸ� �������� -->
<%
	}
%>
	<%= S_ID %> ���̵� / <%= S_LEVEL %> ���� �α��� ��
	<a href="<%= request.getContextPath() %>/login/logout.jsp">�α׾ƿ�</a>
<!-- 1-2�α��� �� ȭ�� End -->
<%} %>
			   
		 </div>
		 <!-- End Header -->