<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbCon.jsp" %>
<%

String userid = (String) session.getAttribute("SessionId");

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
function fn_submit() {
	var f = document.frm;
	if(f.title.value == "") {
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value == "내용을 입력하세요.") {
		alert("내용을 입력해주세요.");
		f.content.focus();
		return false;
	}
	f.submit();
}
</script>
<body>

<header>
	<div class = "header_container">
		<%@ include file="../include/header2.jsp" %>
	</div>
</header>
<section style="padding-left:30%;">
<br>
<form name="frm" id="frm" method="post" action="boardWriteSave.jsp">
<table border="1" style="width:800px;height:500px;margin-top:20px;align:center;">
	<tr>
		<th width="20%" height="5%">제목</th>
		<td width="80%" style="text-align:left;"><input type="text" name="title" id="title"></td>
	</tr>
	<tr>
		<th> 아이디</th>
		<td><%=userid%></td>
	</tr>
	<tr>
		<th height="85%">내용</th>
		<td style="text-align:left;">
		<textarea name="content" id="content" rows="27" cols="85">내용을 입력하세요.</textarea>
		</td>
	</tr>
	</table>
	<table style="width:800px;margin-top:20px;align:center;">
	<tr>
		<th colspan="2" height="5%">
		<button type="submit" onclick="fn_submit(); return false;">저장</button>
		<button type="reset">다시쓰기</button>
		</th>
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