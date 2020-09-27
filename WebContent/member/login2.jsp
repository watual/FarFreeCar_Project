<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>main2</title>
	<link rel="stylesheet" href="../css/style2.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
	<script src="../js/jquery-1.12.4.js"></script>
	<script src="../js/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<script>

function callFunction(){
	$("#loginBg").fadeIn(300);
}

function backFunction(){
	$("#loginBg").fadeOut(300);
}
</script>

<script>
function fn_submit(){
	var userid = $.trim($("#userid").val());
	$("#userid").val(userid);
	if(userid == ""){
		alert("아이디를 입력해 주세요.");
		$("#userid").focus;
		return false;
	}
	
	var pass = $.trim($("#pass").val());
	$("#pass").val(pass);
	if(pass == ""){
		alert("비밀번호를 입력해 주세요.");
		$("#pass").focus;
		return false;
	}
	
	
	
	var frm = $("#loginFrm").serialize();
	$.ajax({

		type:"POST",
		url:"../member/loginSub.jsp",
		dataType : "text",
		data: frm,
		success: function(data){
			if($.trim(data) == "no"){
				alert("아이디 비밀번호가 일치하지 않습니다.");
			}else{
				location.reload();
			}
		},
		error: function(){
			alert("에라가 발생했습니다.");
		}	
	});

}
</script>



<style>


.loginBg{ 
	background-color:rgba(0, 0, 0, 0.35); /*살짝 투명한 검정으로 배경색*/ 
	height: inherit;
	position: absolute; /*다른 요소들 위로 겹쳐질 수 있게함*/ 
	z-index:999;
	top:0;
	left:0;	
	right:0;
	bottom:0;
	display:none;
	} 
	
	
	.loginbox{
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
		position:fixed;
		margin-top: 153px;
		margin-left: 34.5%;
		width: 425px;
		height:410px;
		background:white;
		border: 1px solid #6fb2ec;
		
	}
	
	.top{
		width :425px;
		height:67px;
		/*background: red;*/
		border-bottom:1px solid #d3d3d3;

	}
	
	.loginTitle{
		
		float:left;
		font-size: 25px;
		font-weight: bold;
		/*background:pink;*/
		margin-top:22px;
		margin-left:29px;
	
	}
	
	
	.boxClose{
		position: absolute;
	    right: 25px;
	    top: 23px;
	    width: 19px;
	    height: 19px;
	    background: url(../img/btn-close.png) no-repeat;
	    opacity: 0.3;
		
	}
	
	.loginbox .middle{
		width :367px;
		padding-top:18px;
		padding-left:29px;
		padding-right:29px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
	}
	
	
	 .loginbox .info1{
		border-top: 1px solid black;
		border-left: 1px solid black;
		border-right: 1px solid black;
		width: 183.5px;
		height: 32px;
		float:left;
		
		text-align:center;
		font-weight:bold;
		font-size: 15px;
		line-height:center;
		
		padding-top: 18px;
		
	
	
	}
	
	.loginbox .info2{
		border-bottom: 1px solid black;
		width: 181px;
		height: 50px;
		float:right;
	}
	
	.loginbox input[type = "text"]{
		border: 1px solid #d3d3d3;
		border-radius:0;
		width:352px;
		height:50px;
		margin-top:12px;
		padding-left: 10px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
	}
	
	.loginbox input[type = "password"]{
		border: 1px solid #d3d3d3;
		border-top:none;
		border-radius:0;
		width:352px;
		height:50px;
		padding-left: 10px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
	}
	
	
	
	.loginbox button {
	    width:367px;
	    height:50px;
	    background-color: #f04040;
	    border: none;
	    color:   white;
	    
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    cursor: pointer;
	    /*border-radius:5px;*/
	    
	    margin-top:15px;
	}
	
	
	

</style>


<body>

<div id = "loginBg" class="loginBg">
	<div class="loginbox">
		
		<div class = "top">
			<div class = "loginTitle">로그인</div>
			
			<a href="javascript:backFunction()">
				<div class = "boxClose"></div>
			</a>
		</div>
		
		
		<div class = "middle">
		
		<div class ="info1">회원</div>
   		<div class ="info2"></div>
		
			<form id="loginFrm">
                
                     <input type="text" id="userid" name="userid" placeholder = "아이디를 입력하세요." required="required"/>
               
                 

                     <input type="password" id="pass" name="pass" placeholder = "비밀번호를 입력하세요." required="required"/>
                 
              
                     <button type="submit" onclick = "fn_submit();return false;">Log In</button>
             </form>
         </div>
		
	</div> 
</div>
</body>
</html>
