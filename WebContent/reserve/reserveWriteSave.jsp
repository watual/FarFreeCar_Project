<!-- 
받는 변수 항목
rentno, userid, carno, rentDate, returnDate, rent_storeno, return_storeno, 	rdate_rentInfo
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
<%
String rentno = request.getParameter("userid");

%>