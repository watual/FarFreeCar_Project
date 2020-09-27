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

function call_agree2(){
	$("#agree2Bg").fadeIn(300);
}

function back_agree2(){
	$("#agree2Bg").fadeOut(300);
}
</script>





<style>


.agree2Bg{ 
	background-color:rgba(0, 0, 0, 0.35); /*살짝 투명한 검정으로 배경색*/ 
	height: inherit;
	
	position: absolute; /*다른 요소들 위로 겹쳐질 수 있게함*/ 
	z-index:999;
	top:0;
	left:0;	
	right:0;
	bottom:0;
	display:none;
	overflow:initial;
	} 
	
	
	.agree2Bg .loginbox{
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
		position:fixed;
		margin-top: 0px;
		margin-bottom:0px;
		margin-left: 24%;
		width: 800px;
		height:100%;
		background:white;
		border: 1px solid #6fb2ec;
		
	}
	
	.agree2Bg .top{
		width :800px;
		height:67px;
		/*background: red;*/
		border-bottom:1px solid #d3d3d3;

	}
	
	.agree2Bg .loginTitle{
		
		float:left;
		font-size: 25px;
		font-weight: bold;
		/*background:pink;*/
		margin-top:22px;
		margin-left:29px;
	
	}
	
	
	.agree2Bg .boxClose{
		position: absolute;
	    right: 25px;
	    top: 23px;
	    width: 19px;
	    height: 19px;
	    background: url(../img/btn-close.png) no-repeat;
	    opacity: 0.3;
		
	}
	
	.agree2Bg .loginbox .middle{
		width :367px;
		padding-top:18px;
		padding-left:29px;
		padding-right:29px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		
	}
	
	.agree2Bg textarea{
		width:740px;
		height:600px;
		font-family: '맑은 고딕';
		color:grey;
		font-weight:normal;
	}










</style>


<body>

<div id = "agree2Bg" class="agree2Bg">
	<div class="loginbox">
		
		<div class = "top">
			<div class = "loginTitle">개인정보취급방침 동의</div>
			
			<a href="javascript:back_agree2()">
				<div class = "boxClose"></div>
			</a>
		</div>
		
		
		<div class = "middle">
		
		<textarea>가. 개인정보의 수집 및 이용 목적
① FFC렌트카는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
1. FFC렌트카 서비스 제공을 위한 회원관리
1) 공간정보 다운로드, 오픈API 신청 및 활용 등 포털 서비스 제공과 서비스 부정이용 방지를 목적으로 개인정보를
   처리합니다.

나. 수집하는 개인정보의 항목
① FFC렌트카 회원정보(필수): 이름, 이메일(아이디), 비밀번호

다. 개인정보의 보유 및 이용기간
① FFC렌트카는 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.
1. FFC렌트카 회원정보
- 수집근거: 정보주체의 동의
- 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)
- 보존근거: 정보주체의 동의

라. 동의 거부 권리 및 동의 거부에 따른 불이익
위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.</textarea>
   		
		
			
         </div>
		
	</div> 
</div>
</body>
</html>
