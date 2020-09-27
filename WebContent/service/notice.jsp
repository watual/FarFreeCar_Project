<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/dbCon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>홈 | FFC렌터카</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
	<link rel="stylesheet" href="../css/style2.css" type="text/css">
	<link href='http://www.openhiun.com/hangul/nanumbarungothic.css' rel='stylesheet' type='text/css'>
	<script src="../js/jquery-1.12.4.js"></script>
	<script src="../js/jquery-ui.js"></script>
</head>

<script>

</script>


<style>
 /* -----------------------페이지 루트--------------------------------*/
   
   .mypageLine{
      width:100%; 
      border-bottom:1px solid #c8c8c8;
      margin-top:24px;
      padding-left:10%;
      font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
      
   }
   
   .mypageLine .route{
      line-height:center;
      height: 33px;
   }

   .mypageLine .route > a{
      color:  #8e8d8d;
      font-size:13px;
      font-weight:lighter;
   }
   
   
   
   /* ---------------------- 루트 리스트 --------------------------------*/
   .route a {
       text-decoration: none;
       color: #000;
   }
   
   .route li {
       padding: 0px;
       list-style-type: none;
       margin-top:1px;
       color:  #8e8d8d;
      font-size:13px;
      font-weight:lighter;
   
   }
   
   .route .submenu2 li {
      padding:5px;
   }
   
   
   .route input {
       position: fixed;
       left: -9999px;      
     
   }
   
   .route label {
       cursor: pointer;
       color:  #8e8d8d;
      font-size:13px;
      font-weight:lighter;
      
      
   }
   
   .menu2 > li {
       list-style-type: none;
       float: left;
       position: relative;  
       width: 100px;
   }
   
   .menu2 .submenu2 {
       position: absolute;
       width: 120px;
   
       transform: scaleY(0);
       transform-origin: top;
       transition: all 0.3s;
       background: white;
       padding:0;
       border: 1px solid #c8c8c8;
       border: 1px solid #c8c8c8;
       margin-top:17.5px;
       margin-left:-10px;
   }
   
   
   .menu2 #menuBtn2:checked ~ .submenu2 {
       transform: scaleY(1);
   }
   
   
   
   .menu2 .submenu2 li:hover {
      background:#ff6767;
   }
   
   .menu2 .submenu2 li:hover a {
      color:white;
   }

   
     @font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	.board {
		margin-top: 50px;
	}
	.searchCondition {
		width: 100px;
		height: 30px;
	}
	.board_search {
		width: 1000px;
		height: auto;
		padding: 10px;
	}
	.board_list {
		width: 1000px;
	}
	.searchKeyword {
		margin-left: 5px;
		height: 22px;
		width: 300px;
	}
	.board_list_top {
		background-color: white;
	}
	.board_content {
		width: 1000px;
		
	}
	
	
	
	  table{
      margin-top:5px;
      border-top:1px solid black;
      border-collapse: collapse;
      width:100%;
   }
   .board_list > tr {
   		background-color: black;
   }
</style>


<body>
<%@include file = "../member/login2.jsp" %>
<%@include file = "../reserve/cal.jsp" %>
<%@include file = "../reserve/store.jsp" %>

<header>
	<div class = "header_container">
		<%@ include file="../include/header2.jsp" %>
	</div>
</header>

 
<section style="margin-left:150px;">
	
   <div class ="mypageLine">
      <div class = "route">
      <a href = "../main/main2.jsp">
         <img src = "../img/main_img.png" style= "width:15px; height:15px;margin-top:3px;float:left;">
      </a>
      <img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
      <a href = "../member/myPage.jsp" style = "float:left;margin-top:3px;"><font>고객센터</font></a>
      <img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
      
       <ul class="menu2">
        <li>
            <input type="checkbox" id="menuBtn2">
            <label for="menuBtn2" class="labelBtn2" onclick=""> 고객의견
            <img class="labelBtn2" style = "width:15px; height:15px;margin-top:-15px;margin-left:50px;" src = "../img/liarrow.jpg">
            </label>
            <ul class="submenu2">
                <li><a href="./notice.jsp">공지사항</a></li>
                <li style = "background:white;"><a href="#" style = "color:#ff6767;"><b>고객의견</b></li>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">상담문의</a></li>
            </ul>
        </li>
    </ul>
      
      </div>
   </div>

	<div class = "section_container">
		<!-- 내용을 쓰세영 ^_^ -->
		<article class="board">
			<h3>공지사항</h3>
			<div class="board_content">
				
				<table class="board_list" border="1">
					<colgroup>
						<col width="8%">
						<col width="*">
						<col width="8%">
						<col width="11%">
						<col width="8%">
					</colgroup>
					<tr class="board_list_top">
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
					</tr>
					<%
					String sql = "select b.* from "
							+" (select rownum rn, a.* from "
							+" (select unq, title, userid, gid, pass, to_char(rdate,'yyyy-mm-dd') rdate from notice order by unq desc) a "
							+" ) b";
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()) {
						int rn = rs.getInt("rn");
						int unq = rs.getInt("unq");
						String title = rs.getString("title");
						String userid = rs.getString("userid");
						String pass = rs.getString("pass");
						String rdate = rs.getString("rdate");
						%>
						<tr>
							<td><%=rn %></td>
							<td><a href="noticePost.jsp?unq=<%=unq %>"><%=title %></a></td>
							<td><%=userid %></td>
							<td><%=rdate %></td>
						</tr>
						<%
					}
					%>
				</table>
				<div class="board_search" style="margin-top:10px; margin-left:520px;">
					<select class="searchCondition" name="searchCondition">
						<option value="0" selected>전체</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">작성자</option>
					</select>
					<input class="searchKeyword" name="searchKeyword" type="text" value="">
					<button type="button" id="btn_search">검색</button>
				</div>
			</div>
		</article>
	</div>

</section>

 
<footer>
	<div class = "footer_container">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
 
</body>
</html>