<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file =  "../include/dbCon.jsp"%>

<%

String userid = (String) session.getAttribute("SessionId");
if(userid == null){
	%>
	<script>
		alert("로그인을 해주세요.");
		location = "../main/main2.jsp";
	</script>
	<%
}else{
String sql = "select nickname from memberInfo where userid = '"+userid+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String nickname = rs.getString("nickname");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>예약내역 | FFC렌터카</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
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
	    z-index:999;	
	  
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
	    margin-top:15px;
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


	
	
	/* ----------------------- rentList --------------------------------*/
	
	.rentList{
		background:white;
		height: 600px;
		color:black;
		margin-top: 50px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
	}
	
	.rentList h2{
	font-size:24px;
	color:#161616;
	
	}
	
	.rentList button {
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


	.rentList .box{
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
		font-size:15px;
		font-weight:bold;
		color:#424242;
		
		background: radial-gradient(#ffffff,#f9f9f9) fixed;
 		
	}
	
	.rentList .explain{
		color:black;
		margin-top: 45px;
		font-weight: 600;
	}
	

	/*---------------------------------------------------------*/
	.rentList{
		background:white;
		height: 600px;
		color:black;
		margin-top: 50px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
	}
	
	.rentList h2{
	font-size:24px;
	color:#161616;

	}
	
	
	/************** content ******************/
	
	.rentList .content{
		
	}
	
	.rentList table{
		border-top:1px solid black;
		border-collapse: collapse;
		width:1200px;
	}
	
	.rentList .tag{
		border-right: 1px solid #cccccc;
		font-size: 15px;
		font-weight:bold;
		background: #fafafa;
		text-align:center;
		padding-left:10px;
		height:35px;
	}
	
	.rentList td{
	height: 40px;
	font-size: 14px;
	color: #686463;
	padding-left:10px;
	}
	
	
	.rentList font{
		color:red;
		margin-right:3px;
	}
	
	.rentList .underLine{
		border-bottom: 1px solid #cccccc;
	}
	
	.rentList input{
		border: none;
		background: #f0f0f0;
	}
	
	.rentList .checkBtn {
    width:65px;
    height:25px;
    background-color: #ffffff;
    border: 1px solid #999999;
    color:   #999999;
   	
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 3px;
    cursor: pointer;
    /*border-radius:5px;*/
	}
	
	.rentList button {
    width:300px;
    height:50px;
    background-color: #f04040;
    border: none;
    color:   white;

    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 70px;
    cursor: pointer;
    /*border-radius:5px;*/
	}
	
	label{
		margin-right:12px;
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
			<img src = "../img/main_img.png" style= "width:15px; height:15px;margin-top:3px;float:left;">
		</a>
		<img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
		<a href = "../member/myPage.jsp" style = "float:left;margin-top:3px;"><font>마이페이지</font></a>
		
		<img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
		
		 <ul class="menu2">
        <li>
            <input type="checkbox" id="menuBtn2">
            <label for="menuBtn2" class="labelBtn2" onclick="">예약내역
            <img class="labelBtn2" style = "width:15px; height:15px;margin-top:-15px;margin-left:55px;" src = "../img/liarrow.jpg">
            </label>
            <ul class="submenu2">
                 <li><a href="./memberModify.jsp">회원정보 변경</a></li>
                <li style = "background:white;"><a href="#" style = "color:#ff6767;"><b>예약내역</b></li>
                <li><a href="#">쿠폰등록</a></li>
                <li><a href="#">리뷰</a></li>
            </ul>
        </li>
    </ul>
		
		</div>
	</div>
	
	
	
	
	<div class = "section_container">
	<!-- 내용을 쓰세영 ^_^ -->
	<div class ="rentList" >
   		 
   	<h2>예약내역</h2>	 
   	
   
 	<div class = "content">
 	
 	
 	<div style = "margin-bottom:12px; margin-left:700px;">
 	
 	<input type = "radio" name = "rentState" id = "all">
 	<label for="all">전체</label>
 	
 	<input type = "radio" name = "rentState" id = "nopay">
 	<label for="nopay">결제대기</label>
 	
 	<input type = "radio" name = "rentState" id = "okpay">
 	<label for="okpay">예약완료</label>
 	
 	<input type = "radio" name = "rentState" id = "useing">
 	<label for="useing">이용중</label>
 	
 	<input type = "radio" name = "rentState" id = "complete">
 	<label for="complete">이용완료</label>
 	
 	<input type = "radio" name = "rentState" id = "cancel">
 	<label for="cancel">취소</label>
 	</div>
 	
 	
	<table>
  		<colgroup>
			<col width = "16.9%"/>
			<col width = "11.9%"/>
			<col width = "17.7%"/>
			<col width = "25.2%"/>
			<col width = "19.4%"/>
			<col width = "8.6%"/>
	
  		</colgroup>
  	
  		<tr class ="underLine"> 
			<th class = "tag">예약번호</td>
			<th class = "tag">예약일</td>
			<th class = "tag">차량명</td>
			<th class = "tag">대여지점</td>
			<th class = "tag">대여기간</td>
			<th class = "tag" style = "border-right:none;">상태</td>
		</tr>

 	</table>

	</div>

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

<% }%>

