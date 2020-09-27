<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>store</title>
<link rel="stylesheet" href="../css/style2.css" type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<script>
	function callStore() {
		$("#storeBg").fadeIn(300);
	}

	function backStore() {
		$("#storeBg").fadeOut(300);
	}
	
	
</script>

<script>
function store_submit(){
	/* 유효성체크 */
	var rentStore1 = $('input:radio[name=rentStore]').is(':checked');
	var returnStore1 = $('input:radio[name=returnStore]').is(':checked');
	
	if(rentStore1 == false){
		alert("대여지점을 선택해주세요.");
		return false;
	}
	if(returnStore1 == false){
		alert("반납지점을 선택해주세요.");
		return false;
	}
	
	
	
	
	
	var rentStore = $('#rentFrm input:radio[name=rentStore]:checked').val();
	$("#rentStore").html(rentStore);
	
	var returnStore = $('#returnFrm input:radio[name=returnStore]:checked').val();
	$("#returnStore").html(returnStore);
	
	

	$("#rentStore").css("color","black");
	$("#rentStore").css("border","2px solid red");
	$("#rentStore").css("background","white");
	

	$("#returnStore").css("color","black");
	$("#returnStore").css("border","2px solid red");
	$("#returnStore").css("background","white");
	
	
	$("#storeBg").fadeOut(300);
	
}
</script>



<style>
.storeBg {
	background-color: rgba(0, 0, 0, 0.35); /*살짝 투명한 검정으로 배경색*/
	height: inherit;
	position: absolute; /*다른 요소들 위로 겹쳐질 수 있게함*/
	z-index: 999;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: none;
	/*display:block;*/
}

.storeBg .storebox {
	font-family: 'NanumBarunGothic', '맑은 고딕', '돋음', dotum, sans-serif;
	position: fixed;
	margin-top: 22px;
	margin-left: 265px;
	width: 1000px;
	height: 660px;
	background: white;
	border-radius: 3px;
	border: 1.5px solid black;
}

.storeBg .top {
	width: 1000px;
	height: 67px;
	/*background: red;*/
	border-bottom: 1px solid #d3d3d3;
}

.storeBg .calTitle {
	float: left;
	font-size: 23px;
	font-weight: bold;
	/*background:pink;*/
	margin-top: 24px;
	margin-left: 29px;
}

.storeBg .boxClose {
	position: absolute;
	right: 25px;
	top: 23px;
	width: 19px;
	height: 19px;
	background: url(../img/btn-close.png) no-repeat;
	opacity: 0.3;
}

.storebox .middle {
	width: 942px;
	padding-top: 18px;
	padding-left: 29px;
	padding-right: 29px;
	font-family: 'NanumBarunGothic', '맑은 고딕', '돋음', dotum, sans-serif;
	/*background: pink;*/
}

.storebox button {
	width: 200px;
	height: 50px;
	background-color: #f04040;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	cursor: pointer;
	/*border-radius:5px;*/
	margin-top: 30px;
	margin-left:370px;
}



.storebox .store_explain{
     font-size:9pt; 
     color:red;
     margin-left:10px;
  
}
</style>






<body>

	<div id="storeBg" class="storeBg">
		<div class="storebox">

			<div class="top">
				<div class="calTitle">지점 선택</div>

				<a href="javascript:backStore()">
					<div class="boxClose"></div>
				</a>
			</div>


			<div class="middle">
	
			<%@include file = "./store1.jsp" %>
		
			<%@include file = "./store2.jsp" %>
		
			
			<div style = "width:942px; height:100px;float:left;"></div> <!-- 여백 div -->
			
			<div class = "store_explain">
			▪ &nbsp;대여지점과 다른 지점으로 반납하실 경우 별도의 수수료가 부과됩니다.
			</div>

				<button type="button" onclick = "store_submit()">확인</button>

			</div>

		</div>
	</div>
</body>
</html>


