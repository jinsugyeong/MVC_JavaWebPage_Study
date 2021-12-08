<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
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
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
            <h2>04 전체 회원(삭제 후 1명)</h2>

            <table>
              <tr>
                <th>no</th>
                <th>아이디</th>
                <th>비번</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>수정</th>
                <th>삭제</th>
              </tr>
              <tr>              
                <td>1</td>
                <td>id001</td>
                <td>pw001</td>
                <td>일길동</td>
                <td>010-0000-0001</td>
                <td>email01@email.com</td>
                <td>수정버튼</td>          
                <td>삭제버튼</td>
              </tr>
            </table>    
<%@ include file="/module/hadan.jsp" %>
</body>
</html>