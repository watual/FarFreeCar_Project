<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/dbCon.jsp" %>
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
String title = request.getParameter("title");
String content = request.getParameter("content");

String sql1 =  " select count(*) as cnt from memberinfo "
	    + "   where pass='"+pass+"' ";

ResultSet rs = stmt.executeQuery(sql1);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 0) {
%>
	<script>
	alert("암호를 다시 확인해주세요.");
	history.go(-1);
	</script>
<%
	return;
}

String sql = " update board set "
				+ " 		title='"+title+"', "
				+ " 		content='"+content+"' "
				+ " where unq='"+unq+"' ";
stmt.executeUpdate(sql);
%>
	<script>
	alert("수정 완료");
	location="boardDetail.jsp?unq=<%=unq%>";
	</script>











