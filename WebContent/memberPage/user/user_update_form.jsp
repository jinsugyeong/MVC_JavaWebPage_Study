<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberPage/css/main.css" />
<!-- 
������ ���� 
ip�ּ�,������, port ��ȣ, �������� ���� �ٲ�� ��θ� ��� �����ؾ��Ѵ�.
 -->
</head>

<body>

	<!-- Begin Wrapper -->
	<div id="wrapper">

		<!-- Begin Header -->
		<div id="header">

			��� �޴� <br /> <br /> 
			<a href="<%=request.getContextPath()%>/memberPage/user/user_insert_form.jsp">01ȸ������</a>
			<a href="<%=request.getContextPath()%>/memberPage/user/user_list.jsp">02��üȸ����ȸ</a>
			<a href="#">03��ǰ���</a>
			<a href="#">04��ǰ�˻�</a>

		</div>
		<!-- End Header -->

		<!-- Begin Left Column -->
		<div id="leftcolumn">
			���� �޴�
		</div>
		<!-- End Left Column -->
<%
	request.setCharacterEncoding("euc-kr");
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String uname = request.getParameter("uname");
	String uphone = request.getParameter("uphone");
	String uemail = request.getParameter("uemail");
	
	System.out.println(uid + "<-- uid  user_update_form.jsp");
	System.out.println(upw + "<-- upw  user_update_form.jsp");
	System.out.println(uname + "<-- uname  user_update_form.jsp");
	System.out.println(uphone + "<-- uphone  user_update_form.jsp");
	System.out.println(uemail + "<-- uemail  user_update_form.jsp");
%>
		<!-- Begin Right Column -->
		<div id="rightcolumn">
			ȸ������ ȭ��<br/>
			<form action="<%=request.getContextPath()%>/memberPage/user/user_list_update.jsp" method="post">
				���̵�: <input type="text" name="uid" value="<%=uid %>" readonly>	<br/>
				���: <input type="password" name="upw" value="<%=upw %>">	<br/>
				�̸�: <input type="text" name="uname" value="<%=uname %>">	<br/>
				��ȭ��ȣ: <input type="text" name="uphone" value="<%=uphone %>">	<br/>
				�̸���: <input type="text" name="uemail" value="<%=uemail %>">	<br/>
				<input type="submit" name="ȸ��������ư" value="ȸ��������ư">	<br/>
			</form>

		</div>
		<!-- End Right Column -->

		<!-- Begin Footer -->
		<div id="footer">

			�ϴ� �޴�<br /> 
			�ѱ�����Ʈ���������� 063-717-1008 ksmart.or.kr

		</div>
		<!-- End Footer -->

	</div>
	<!-- End Wrapper -->

</body>
</html>