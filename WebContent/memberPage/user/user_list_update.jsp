<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/memberPage/css/main.css"/>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>

<body>

   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         <div id="header"> 
       
             ��� �޴�<br/><br/>    
             <a href="<%=request.getContextPath() %>/memberPage/user/user_insert_form.jsp">01 ȸ������</a>
             <a href="<%=request.getContextPath() %>/memberPage/user/user_list.jsp">02 ��ü ȸ�� ��ȸ</a>
             <a href="#">03 ��ǰ ���</a>
             <a href="#">04 ��ǰ �˻�</a>
            
       </div>
       <!-- End Header -->
       
       <!-- Begin Left Column -->
       <div id="leftcolumn">
       
             ���� �޴�
       
       </div>
       <!-- End Left Column -->
 <%
	request.setCharacterEncoding("EUC-KR");
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String uname = request.getParameter("uname");
	String uphone = request.getParameter("uphone");
	String uemail = request.getParameter("uemail");
	
	System.out.println(uid + "<-- uid  user_list_update.jsp");
	System.out.println(upw + "<-- upw  user_list_update.jsp");
	System.out.println(uname + "<-- uname  user_list_update.jsp");
	System.out.println(uphone + "<-- uphone  user_list_update.jsp");
	System.out.println(uemail + "<-- uemail  user_list_update.jsp");
%>       
       <!-- Begin Right Column -->
       <div id="rightcolumn">
       
            <h2>03 ��ü ȸ��(���� �� 2��)</h2>

            <table>
              <tr>
              	<th>no</th>
                <th>���̵�</th>
                <th>���</th>
                <th>�̸�</th>
                <th>��ȭ��ȣ</th>
                <th>�̸���</th>
                <th>����</th>
                <th>����</th>
              </tr>
              <tr>
              	<td>1</td>
                <td>id001</td>
                <td>pw001</td>
                <td>�ϱ浿</td>
                <td>010-0000-0001</td>
                <td>email01@email.com</td>
                 <td>������ư</td>          
                <td>������ư</td>
              </tr>
              <tr>
             	 <td>2</td>
                <td><%=uid %></td>
                <td><%= upw %></td>
                <td><%= uname %></td>
                <td><%= uphone %></td>
                <td><%= uemail %></td>
              <td><a href="<%=request.getContextPath() %>/memberPage/user/user_update_form.jsp?uid=<%=uid %>&upw=<%=upw %>&uname=<%=uname %>&uphone=<%=uphone %>&uemail=<%=uemail %>">������ư</a></td>
               <td><a href="<%=request.getContextPath() %>/memberPage/user/user_list_delete.jsp">������ư</a></td>
              </tr>
            </table>    
       
       </div>
       <!-- End Right Column -->
       
       <!-- Begin Footer -->
       <div id="footer">
             
           �ϴ� �޴�<br/>
           �ѱ� ����Ʈ ���� ������ 063-717-1008 ksmart.or.kr   
             
        </div>
       <!-- End Footer -->
       
   </div>
   <!-- End Wrapper -->
   
</body>
</html>