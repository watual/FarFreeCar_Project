<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file =  "../include/dbCon.jsp"%>
<%
String rentdate = request.getParameter("rentdate");
String returndate = request.getParameter("returndate");
String rentStoreName = request.getParameter("rentStoreName");
String returnStoreName = request.getParameter("returnStoreName");
String carSize = request.getParameter("carSize");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원정보 수정 | FFC렌터카</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
	<link rel="stylesheet" href="../css/style2.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
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
		float:right;
		
		
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
	    margin-top:32px;
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


	
	
	/* ----------------------- detailRent --------------------------------*/
	.detailRent{
		background:white;
		height: 600px;
		color:black;
		margin-top: 50px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
	}
	
	.detailRent h2{
	font-size:24px;
	color:#161616;

	}
	
	.box_b{
		
		width:300px;
		height:200px;
		position:relative;
		float:left;
		
		
	}
	
	.detailRent .f_top{
		background:#f04040;
		width:250px;
		height:50px;
		border:none;
		border-radius: 0 15px 0px 0;
		
		position:absolute;
	
	}
	
	.f_cont-box{
		width:0px;height:0px;
		border-right:50px solid transparent; /*border의 성질을 이용해 오른쪽테두리만 투명으로 만든다. */
		border-bottom:47px solid #f04040; /*border를 사용해 두께를 만든다.*/
		
		position:absolute;
		float:left;
		left:245px;
		top:3.5px;
	}
	
	.detailRent .top{
		background:#bcbdc0;
		width:250px;
		height:50px;
		border:none;
		border-radius: 0 15px 0px 15px;
		left:50px;
		position:absolute;
	
	}
	
	.cont-box1{
		width:0px;height:0px;
		border-right:50px solid transparent; /*border의 성질을 이용해 오른쪽테두리만 투명으로 만든다. */
		border-bottom:47px solid #bcbdc0; /*border를 사용해 두께를 만든다.*/
		
		position:absolute;
		float:left;
		left:4.5px;
	
		transform:rotate(180deg);
	}
	.cont-box2{
		width:0px;height:0px;
		border-right:50px solid transparent; /*border의 성질을 이용해 오른쪽테두리만 투명으로 만든다. */
		border-bottom:47px solid #bcbdc0; /*border를 사용해 두께를 만든다.*/
		
		position:absolute;
		float:left;
		left:295px;
		top:3.5px;
		
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

 
<section>

	<div class ="mypageLine">
		<div class = "route">
		<a href = "../main/main2.jsp">
			<img src = "../img/main_img.png" style= "width:15px; height:15px;margin-top:3px;float:left;">
		</a>
		<img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
		
		
		 <ul class="menu2">
        <li>
            <input type="checkbox" id="menuBtn2">
            <label for="menuBtn2" class="labelBtn2" onclick="">예약
            	<img class="labelBtn2" style = "width:15px; height:15px;margin-top:4px;margin-left:10px;margin-right:45px;float:right;" src = "../img/liarrow.jpg">
            </label>
            <ul class="submenu2">
            	<li><a href="#">간편예약</a></li>
                <li style = "background:white;"><a href="#" style = "color:#ff6767;"><b>상세예약</b></li>
                <li><a href="../reserve/rentList.jsp">예약내역</a></li>
            </ul>
        </li>
    </ul>
		
		</div>
	</div>
	
	
	
	
<div class = "section_container">
	<!-- 내용을 쓰세영 ^_^ -->
	<div class ="detailRent" >
   	
	 
   	<h2>상세 예약</h2>	 
   
<div class="box_b">
	<div class = "f_top"></div>
	<div class = "f_cont-box"></div>
</div>

<div class="box_b">
	<div class = "cont-box1"></div>
	<div class = "top"></div>
	<div class = "cont-box2"></div>
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









