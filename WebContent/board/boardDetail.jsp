<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbCon.jsp" %>
<%
String unq = request.getParameter("unq");

if(unq == null || unq.equals("")) {
%>	
	<script>
	alert("잘못된 접근입니다.");
	history.back();
	</script>
<%
return;  // jsp 종료
}
// 조회수 증가 -> hits
String sqlUpdate = "update board set hits=hits+1 where unq='"+unq+"' ";
stmt.executeUpdate(sqlUpdate);

String sql = "select title,userid,content from board where unq='"+unq+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title = rs.getString("title");
String userid = rs.getString("userid");
String content = rs.getString("content");
content = content.replaceAll("\n","<br>");
content = content.replaceAll(" ","&nbsp;");

String sql2 = " select rn-1 as nextNo, rn+1 as beforeNo,total  from( "
				  	+ " select b.* from ( "
					+ " select rownum rn, a.* from ( "
					+ " select unq,count(*) over() total from board order by unq desc) a)b "
					+ "	where unq='"+unq+"') ";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();

int nextNo = rs2.getInt("nextNo");
int beforeNo = rs2.getInt("beforeNo");
int total = rs2.getInt("total");

String sql3 = " select b.* from ( "
					+ " select rownum rn, a.* from ( "
					+ " select unq from board order by unq desc) a)b"
					+ " where rn='"+nextNo+"' or rn='"+beforeNo+"' ";
ResultSet rs3 = stmt2.executeQuery(sql3);

int nextUnq = 0;
if(nextNo>0) {
	rs3.next();
	nextUnq = rs3.getInt("unq");
}
int beforeUnq = 0;
if(beforeNo<= total) {
	rs3.next();
	beforeUnq = rs3.getInt("unq");
}
%>

<%
String gid = request.getParameter("unq");

String sqlTot = "select count(*) total from board_comment where gid='"+gid+"' ";
ResultSet rsTot = stmt.executeQuery(sqlTot);
rsTot.next();

int total2 = rsTot.getInt("total");

String sql4 = " select content,"
		    + " 	to_char(rdate,'yyyy-mm-dd') rdate from board_comment where gid='"+gid+"' "
		    + " order by unq desc ";
		   
ResultSet rs4 = stmt.executeQuery(sql4);

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
<table border="1" style="width:800px;height:210px;margin-top:20px;align:center;">
	<tr>
		<th width="20%" height="15%">제목</th>
		<td width="80%"><%=title %></td>
	</tr>
	<tr>
		<th> 아이디</th>
		<td><%=userid %></td>
	</tr>
	<tr>
		<th height="85%">내용</th>
		<td valign="top"><%=content %></td>
	</tr>
	</table>
	<table style="width:800px;margin-top:20px;align:center;">
	<tr>
		<th colspan="2">
		<%
		if(beforeNo <= total) {
		%>
		<button type="button" onclick=" location='boardDetail.jsp?unq=<%=beforeUnq %>'">이전</button>
		<%
		}
		%>
		<button type="button" onclick="location='boardModify.jsp?unq=<%=unq%>'">수정하기</button>
&nbsp;&nbsp;
		<button type="button" onclick=" location='boardList.jsp' ">목록</button>	
&nbsp;&nbsp;
		<button type="button" onclick="location='passWrite.jsp?unq=<%=unq%>&gubun=1'">삭제하기</button>
		
		<%
		if(nextNo >0) {
		%>
		<button type="button" onclick="location='boardDetail.jsp?unq=<%=nextUnq %>'">다음</button>
		<%
		}
		%>
		</th>
	</tr>
</table>
<br>
<br>
<div>
댓글 (<%=total2 %>)
</div>
<br>
<table style="border:1;width:800px;align:center;">
	<colgroup>
		<col width="50%"/>
		<col width="30%"/>
		<col width="20%"/>
	</colgroup>
	<%
	String gubun = request.getParameter("gubun"); 
	while( rs4.next() ) {
		String content2 = rs4.getString("content");
		String rdate2 = rs4.getString("rdate");
	%>
		<tr>
			<td align="left"><%=content2 %></td>
			<td align="center"><%=rdate2 %></td>		
			<td align="center">
			<button type="button" onclick=" location='passWrite.jsp?unq=<%=unq %>&gubun=2' ">삭제</button>
			</td>
		</tr>
	<%
	}
	%>
</table>
<br>

<form name="frm" method="post" action="boardCommentSave.jsp">
<input type="hidden" name="gid" value="<%=unq%>">
<table border="1" style="width:800px;margin-top:20px;align:center;">
	<tr align="center">
		<th width="20%">댓글</th>
		<td width="60%" text-align="left">
		<textarea name="content" id="content" cols="82">내용을 입력하세요.</textarea>
		</td>
		<td width="20%">
		<button type="submit" onclick="fn_submit(); return false;">저장</button>
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