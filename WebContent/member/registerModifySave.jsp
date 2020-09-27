<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../include/dbCon.jsp" %>
<%
String userid = (String) session.getAttribute("SessionId");

String nickname = request.getParameter("nickname");
String username = request.getParameter("username");
String mobile1 = request.getParameter("mobile1");
String mobile2 = request.getParameter("mobile2");
String mobile3 = request.getParameter("mobile3");
String year = request.getParameter("year");
String month = request.getParameter("month");
String date = request.getParameter("date");
String zipcode = request.getParameter("zipcode");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String addr = request.getParameter("addr");

String mobile = mobile1 +"-"+ mobile2 +"-"+ mobile3;
String birthday = year+"-"+month+"-"+date;



String sql = "UPDATE MEMBERINFO SET"
	       + " nickname='"+nickname+"',"
	       + " username='"+username+"',"
	       + " mobile='"+mobile+"',"
	       + " birthday='"+birthday+"',"
	       + " gender='"+gender+"',"
	       + " email='"+email+"',"
	       + " zipcode='"+zipcode+"',"
	       + " addr='"+addr+"' "
	 
		   + " WHERE userid = '"+userid+"' ";


int result = stmt.executeUpdate(sql);
String msg ="";
if(result>0){	
	msg = "ok";
	}
%>

<%=msg %>
