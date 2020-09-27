<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String unq = request.getParameter("unq");
String gubun = request.getParameter("gubun"); 

String url = "";
if( gubun.equals("2") ) {
	url = "commentDelete.jsp";
} else {
	url = "boardDelete.jsp";
}
%>

<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8"><title></title>
	<link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
	<link rel="stylesheet" href="../css/style2.css" type="text/css">
	<link href='http://www.openhiun.com/hangul/nanumbarungothic.css' rel='stylesheet' type='text/css'>
	<script src="../js/jquery-1.12.4.js"></script>
	<script src="../js/jquery-ui.js"></script>
</head>

<script>
function fn_submit() {
	var f = document.frm;
	if( f.pass.value == "" ) {
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	document.frm.submit();	
}
</script>
<body>

<header>
	<div class = "header_container">
		<%@ include file="../include/header2.jsp" %>
	</div>
</header>
<section style="padding-left:20%;">
<br>
<form name="frm" method="post" action="<%=url%>">
<input type="hidden" name="unq" value="<%=unq %>" >
<table border="1" width="400" align="center">
	<tr>
		<th width="30%">암호</th>
		<td width="70%"><input type="password" name="pass"></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit" onclick="fn_submit();return false;">삭제</button>
		</th>
	</tr>
</table>
</form>
</section>
<aside>
	<div class = "aside_container">
		<!-- aside를 쓰세영 ^_^ -->
		
		<!-- section과 aside 사이세로 여백   -->
		<div style = "width:100px;height:800px;"></div> 
		<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	</div>
</aside>

 
<footer>
		<div class = "footer_container">
		<!-- footer를 쓰세영 ^_^ -->
	</div>
</footer>
 </body>
</html>


    