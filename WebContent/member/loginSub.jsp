<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file = "../include/dbCon.jsp"%>
<%
	String userid = request.getParameter("userid");
	String pass= request.getParameter("pass");
	
	String sql = "select count(*) cnt from memberInfo"
			   + " where userid = '"+userid+"' and pass = '"+pass+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	
	int cnt = 0 ;
	if(rs.next()){ // if 쓰는 이유는 데이터가 하나도 없을 시 null이 들어갈까봐
		cnt = rs.getInt("cnt");
	}
	String msg = "";
	if(cnt == 0) msg = "no";
	
	session.setAttribute("SessionId",userid);
%>


<%=msg%>