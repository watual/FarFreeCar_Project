<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbCon.jsp" %>

<%
String userid = (String) session.getAttribute("SessionId");

String title = request.getParameter("title");
String content = request.getParameter("content");


if(title == null || title.equals("")) {
%>
	<script>
	alert("제목을 입력해주세요.");
	history.back();
	</script>
<%
	return;
}

String sql = " INSERT INTO board(unq,title,userid,content,rdate) "
				+ " VALUES(board_seq.nextval,'"+title+"','"+userid+"','"+content+"',sysdate) ";
int result = stmt.executeUpdate(sql);
if(result>0) {
%>
	<script>
	alert("저장완료");
	location = "boardList.jsp";
	</script>
<%
}
%>
