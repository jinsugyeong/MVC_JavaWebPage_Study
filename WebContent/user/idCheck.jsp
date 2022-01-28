<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="kr.or.ksmart.dto.User" %>
<%@ page import="kr.or.ksmart.dao.Udao" %>
<%
	String id = request.getParameter("userId");
	int result = 0;
	
	Udao udao = new Udao();
	List<User> userId = udao.uList();
	
	
	for(User u : userId){
		if(u.getU_id().equals(id))result++;
	}
	
	Map<String, Integer> map = new HashMap<String, Integer>();
	map.put("result", result);
	
	Gson gson = new Gson();
	out.println(gson.toJson(map));
%>