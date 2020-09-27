<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbCon.jsp" %>
<%
String userid = (String) session.getAttribute("SessionId");

if(userid == null){
	%>
	<script>
		alert("로그인을 해주세요.");
		location = "../main/main2.jsp";
	</script>
	<%
	return;
}
String searchField = request.getParameter("searchField");
String searchText = request.getParameter("searchText");

%>
<%
int unit = 10;
String page1 = request.getParameter("page");
if(page1 == null || page1.equals("")) {
	page1 = "1";
}
int viewPage = Integer.parseInt(page1);

int startIdx = (viewPage - 1) * unit + 1 ;
int endIdx = startIdx + (unit - 1);
%>
<%
String sqlTot = " select count(*) total from board ";
		if(searchField != null) {
		 	 sqlTot += " where "+searchField+" like '%"+searchText+"%' ";
		} 
ResultSet rsTot = stmt.executeQuery(sqlTot);
rsTot.next();
int total = rsTot.getInt("total");

int number = total - ((viewPage - 1) * unit);

int lastpage = (int)Math.ceil((double)total/unit);

String sql = " select b.* from( "
				+ " select rownum rn, a.* from "
				+ " (select unq,title,hits,to_char(rdate,'yyyy-mm-dd') rdate from board ";
						if(searchField != null) {
							sql += " where "+searchField+" like '%"+searchText+"%' ";
						}
							sql += " order by unq desc) a) b " 			
								  + " where rn >= "+startIdx+" and rn <="+endIdx ;

ResultSet rs = stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
	<link rel="stylesheet" href="../css/style2.css" type="text/css">
	<link href='http://www.openhiun.com/hangul/nanumbarungothic.css' rel='stylesheet' type='text/css'>
	<script src="../js/jquery-1.12.4.js"></script>
	<script src="../js/jquery-ui.js"></script>
</head>
<script>
function fn_search() {
	if(document.searchFrm.searchText.value == "") {
		alert("검색 단어를 입력해주세요.");
		document.searchFrn.searchText.focus();
		return false;
	}
	document.searchFrm.submit();
}
</script>
<body>
<%@include file = "../member/login2.jsp" %>
<header>
	<div class = "header_container">
		<%@ include file="../include/header2.jsp" %>
	</div>
</header>


<section style="padding-left:30%;">
<br>
<div>
	<div style="width:20%;">
Total : <%=total %>
	<button type="button" onclick="location='boardWrite.jsp'">글쓰기</button>
	</div>
</div>
<table border="1" style = "width:800px;align:center;">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="25%"/>
		<col width="25%"/>
	</colgroup>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
<%
while(rs.next()) {
	int unq = rs.getInt("unq");
	String title = rs.getString("title");
	int hits = rs.getInt("hits");
	String rdate = rs.getString("rdate");
%>
	<tr align="center">
		<td><%=number %></td>
		<td><a href="../board/boardDetail.jsp?unq=<%=unq %>"><%=title %></a></td>
		<td><%=hits %></td>
		<td><%=rdate %></td>
	</tr>
<%	
	number--;
}
%>
</table>
<table style="border:0;width:800px;align:center;">
	<tr>
		<td align="center">
		<%
		for(int i=1; i<=lastpage; i++) {
		%>
				<a href="boardList.jsp?page=<%=i %>"><%=i %></a>
		<%
		}
		%>
		</td>
	</tr>
</table>
<form name="searchFrm" method="post" action="boardList.jsp">
<table border="0">
	<tr>
		<td align="left">
		<select name="searchField">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="searchText">
		<button type="button" onclick="fn_search()">검색</button>
		</td>
	</tr>
</table>
</form>
</section>
 
<footer>
	<div class = "footer_container">
		<%@include file="../include/footer.jsp" %>
	</div>
</footer>
 </body>
</html>