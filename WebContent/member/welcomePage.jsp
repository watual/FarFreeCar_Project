<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String SessionId2= (String) session.getAttribute("SessionId"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>main2</title>
	<link rel="stylesheet" href="../css/style2.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
	<script src="../js/jquery-1.12.4.js"></script>
	<script src="../js/jquery-ui.js"></script>
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
	
	
	
	
	
	.welcomePage{
		background:white;
		height: 600px;
		color:black;
		margin-top: 50px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		position:relative;
		
		
	}
	.welcomePage .submitBtn {
    width:300px;
    height:50px;
    background-color: #f04040;
    border: none;
    color:   white;

    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
	float:right;
	margin-right:60px;
    cursor: pointer;
    /*border-radius:5px;*/
	}
	
	.welcomePage .welcomImg{
		width:5%;
		height:10%;
		float:left;
		
		padding-right:40px;
		
		margin-left:100px;
	}
	
	.welcomePage .basicFont{
		margin-top:10px;
		margin-left: 100px;
		font-size:14px;
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
		<a href = "../member/myPage.jsp"><font>회원가입</font></a>
		</div>
	</div>

	
	
	<div class = "section_container">
		<div class ="welcomePage" >
   		
   		
   		
   		<div style = "margin-top:90px;float:left;width:100%;">
   		<img  class = "welcomImg" src = "../img/welcome.png">
	   		<div style = " color: #f04040; font-size:40px;float:left;margin-top:8px;">
	   		회원가입</div>
	   		<div style = "color: #676767; font-size:40px;margin-top:8px;">
	   		이 완료되었습니다.</div>

   		</div>
   		
   		<div style = " margin-bottom: 40px;margin-left:100px; margin-top:30px;float:left;width:100%;">
	   		<div class = "basicFont">
	   		<font style = "font-size:18px; color: #ff7c3e;"><%=SessionId2 %></font>
	   		 고객님, 회원가입을 진심으로 환영합니다.
	   		</div>
	   		
	   		<div class = "basicFont">
	   		
	   		</div>
	   		<div class = "basicFont">
	   		FFC 렌터카에서 누릴 수 있는 다양한 혜택을 확인해 보세요.
	   		</div>
	   		
   		</div>
   		
   		
   		
   		<div>
   		<button type = "button" onclick = "location='../main/main2.jsp'" class = submitBtn>
   		메인으로
   		</button>
   		</div>
   		


<!-- 
닉네임 고객님, 
회원가입을 진심으로 환영합니다.
FFC 렌터카에서 누릴 수 있는 다양한 혜택을 확인해보세요.
 -->

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