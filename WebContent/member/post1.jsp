<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post1</title>
</head>

<style>
.postDiv{
	border : 2px solid purple;
	width : 98%;
	height: 90px;
	font-size:9pt; /*12px과 비슷*/
	text-align : center;
	padding-top: 5px;
	
	
}
</style>

<body>
<div class = "postDiv">
<p>
	검색하려는 동(리)을 입력해 주세요.
	(예: 황금동 검색 시 -> 황금으로 검색)
	</p>
	<form name= postform method ="post" action = "post2.jsp">
	<input type = "text" name = "dong">
	<input type ="submit" value = "검색">
	</form>

</div>
</body>
</html>