<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file =  "../include/dbCon.jsp"%>

<%

String userid = (String) session.getAttribute("SessionId");

String sql = "select nickname from memberInfo where userid = '"+userid+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String nickname = rs.getString("nickname");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>main2</title>
	<link rel="stylesheet" href="../css/style2.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>


<style>

	/* -----------------------페이지 루트--------------------------------*/
	
	.mypageLine{
		width:100%; 
		border-bottom:1px solid #c8c8c8;
		margin-top:24px;
		padding-left:10%;
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
	
	/* ----------------------- 마이페이지 --------------------------------*/
	
	.myPage{
		background:white;
		height: 600px;
		color:black;
		margin-top: 50px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
	}
	
	.myPage h2{
	font-size:24px;
	color:#161616;
	
	}
	
	.myPage button {
    width:90px;
    background-color: #ffffff;
    border: 1px solid #999999;
    color:   #999999;
   	padding: 3px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 2px;
    cursor: pointer;
    /*border-radius:5px;*/
	}


	.myPage .box{
		position:absolute;
		border-top: 1px solid grey;
		border-right:1px solid #d3d3d3;
		border-bottom:1px solid #d3d3d3;
		
		width: 400px;
		height: 170px;
		float:left;
		text-align: center;
		
		padding-top: 80px;
		
		margin-top:20px;
		margin-left:150px;
		font-size:15px;
		font-weight:bold;
		color:#424242;
		
		background: radial-gradient(#ffffff,#f9f9f9) fixed;
 		z-index:0;
	}
	
	.myPage .explain{
		color:black;
		margin-top: 45px;
		font-weight: 600;
	}
	
	.myPage .box .b1{
		
	}
	
	.myPage .box .b2{
	 	color:red;
	 	font-size:50px;
	 	font-weight:lighter;
		
	 	border-bottom: 1px solid red;

	 	float:left;
	 	padding:0;
	 	margin : 0 0 0 40%;
	 	
	}
	
	.myPage .box .b3{
	 	font-size:20px;
	 	
	 	font-weight:lighter;
		float:left;
		
	 	margin-left:1px;
	 	margin-top: 40px;
	 	
	 	width:30px;
	 	height:30px;
	 	
	}
		
	</style>

<body>


<header>
	<div class = "header_container">
		<%@ include file="../include/header2.jsp" %>
	</div>
</header>

 
<section>

	<div class ="mypageLine">
		<div class = "route">
		<a href = "../main/main2.jsp">
			<img src = "../img/main_img.png" style= "width:15px; height:15px;margin-top:3px;">
		</a>
		<img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;">
		<a href = "../member/myPage.jsp"><font>마이페이지</font></a>
		</div>
	</div>
	
	
	
	
	<div class = "section_container">
	<!-- 내용을 쓰세영 ^_^ -->
		<div class ="myPage" >
   		<h2>마이페이지</h2>
   		
   		<div class ="explain">
   		<font style = "font-size:18px; color: #ff7c3e;"><%= nickname %></font> 님의 총 대여횟수는 총 0회입니다.&nbsp;&nbsp;
   		<button onclick = "location = 'memberModify.jsp'">회원정보 변경</button>
   		</div>
   		

   		
   		<a href ="../reserve/rentList.jsp">
   			<div class = "box" style = "left:0px;">
   				<div class  = "b1">예약내역</div>
   				<div class  = "b2">00</div>
   				<div class  = "b3">건</div>
   			</div>
   		</a>
   		
   		<a href ="">
   			<div class = "box" style = "left:401px;">
   				<div class  = "b1">쿠폰</div>
   				<div class  = "b2">00</div>
   				<div class  = "b3">장</div>
   			</div>
   		</a>
   		
   		
   		
   		<a href ="">
   			<div class = "box" style = "border-right:0px;left:802px;">
   				<div class  = "b1">나의리뷰</div>
   				<div class  = "b2">00</div>
   				<div class  = "b3">개</div>
   			</div>
   		</a>
   		


</div>
</div>


</section>

 
<aside>
	<div class = "aside_container">
		<!-- aside를 쓰세영 ^_^ -->
	</div>
</aside>

 
<footer>
		<div class = "footer_container">
		<!-- footer를 쓰세영 ^_^ -->
	</div>
</footer>
 
</body>
</html>

