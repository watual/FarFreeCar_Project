<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp"%>

<%
String content = request.getParameter("content");
String gid = request.getParameter("gid");

String sql = " INSERT INTO board_comment(unq,content,rdate,gid) "
				+ " VALUES(board_seq.nextval,'"+content+"',sysdate,'"+gid+"')";

int result = stmt.executeUpdate(sql);

if(result>0) {
%>

	<script>
	alert("등록완료");
	location="boardDetail.jsp?unq=<%=gid%>";
	</script>
<%
}
%>