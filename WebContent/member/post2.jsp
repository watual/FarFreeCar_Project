<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file ="../include/dbCon.jsp" %>
<%
	String dong = request.getParameter("dong");
	
	String sql = "select a1,a2,a3, a4, a5,a6,a7 from post"
			   + " where a4 like '%"+dong+"%' or a5 like '%"+dong+"%' ";
	ResultSet rs = stmt.executeQuery(sql);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post2</title>
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

<script>
function fn_result(){
	var addr = document.postform.addr.value;
	var array = addr.split(" ");
	var zipcode = array[0].substring(1,array[0].length-1);
	var address = addr.replace(array[0],"");
	
	opener.registerFrm.zipcode.value = zipcode; 
	opener.registerFrm.addr.value = address;
	
	self.close();
}
</script>

<body>
<div class = "postDiv">
<p>
	검색하려는 동(리)을 입력해 주세요.
	(예: 황금동 검색 시 -> 황금으로 검색)
	</p>
	<form name= postform method ="post" action = "">
	<select name = "addr">
		<% 
		while(rs.next()){
			String a1 = rs.getString("a1");
			String a2 = rs.getString("a2");
			String a3 = rs.getString("a3");
			String a4 = rs.getString("a4");
			String a5 = rs.getString("a5");
			String a6 = rs.getString("a6");
			String a7 = rs.getString("a7");
			if(a4 == null || a5 == null || a6 ==null || a7 == null ){
				a4 ="";
				a5 ="";
				a6 ="";
				a7 ="";	
			}
			String addr ="["+a1+"] "+a2+" "+a3+" "+a4+" "+a5+" "+a6+" "+a7;
		%>	
				<option value ="<%=addr %>"><%=addr %></option>
		<%
		}
		%></select>
		
		<input type = "submit" onclick = "fn_result()" value ="적용">
	</form>

</div>
</body>
</html>