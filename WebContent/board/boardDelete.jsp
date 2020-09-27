<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");

if( unq == null || pass == null ) {
%>
	<script>
	alert("잘못된 경로입니다.");
	history.back();
	</script>
<%
	return;
}

String sql1 = " select count(*) as cnt from memberinfo "
		    + "   where pass='"+pass+"' ";

ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int cnt = rs1.getInt("cnt");

if( cnt == 0 ) {
%>
	<script>
	alert("암호를 다시 입력해주세요.");
	history.back();
	</script>
<%
	return;
}

String sql2 = " delete from board where unq='"+unq+"' ";
stmt.executeUpdate(sql2);
%>
<script>
alert("삭제완료");
location = "boardList.jsp";
</script>









