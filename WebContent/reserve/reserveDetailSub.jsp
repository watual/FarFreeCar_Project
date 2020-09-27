<!-- 
Oracle 변수 항목
rentno, userid_rentInfo, carno_rentInfo, rentDate, returnDate, rent_storeno_rentInfo, return_storeno_rentInfo, 	rdate_rentInfo
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
<%
String userid = ((String) session.getAttribute("sessionId")).trim();
if(userid == "" || userid == null) {
	System.out.println("잘못된 접근입니다.");
}

String rentno = request.getParameter("rentno");
String carno_rentInfo = request.getParameter("carno_rentInfo");
String rentDate = request.getParameter("rentDate");
String returnDate = request.getParameter("returnDate");
String rent_storeno_rentInfo = request.getParameter("rent_storeno_rentInfo");
String return_storeno_rentInfo = request.getParameter("return_storeno_rentInfo");
String rdate_rentInfo = request.getParameter("rdate_rentInfo");

String sql = " INSERT INTO rentinfo( "
		+" rentno, "
		+" userid_rentInfo, "
		+" carno_rentInfo, "
		+" rentDate, "
		+" returnDate, "
		+" rent_storeno_rentInfo, "
		+" return_storeno_rentInfo, "
		+" rdate_rentInfo ) "

		+" VALUES( "
		+"  rentInfo_seq.nextval, "
		+" '"+userid+"', "
		+" '"+carno_rentInfo+"', "
		+" '"+rentDate+"', "
		+" '"+returnDate+"', "
		+" '"+rent_storeno_rentInfo+"', "
		+" '"+return_storeno_rentInfo+"', "
		+" sysdate) ";


int result = stmt.executeUpdate(sql);
if(result==0) {
%>
	<script>
		alert("저장실패");
		history.go(-1);
	</script>
<%
} else {
%>
	<script>
		alert("저장성공");
		location='deptList.jsp';
	</script>
<%
}

%>