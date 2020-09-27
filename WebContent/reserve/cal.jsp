<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cal</title>
<link rel="stylesheet" href="../css/style2.css" type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<script>
	function callCal() {
		$("#calBg").fadeIn(300);
	}

	function backCal() {
		$("#calBg").fadeOut(300);
	}
	
	
</script>

<script>
function cal_submit(){
	var cal1Date = $("#dateShow_box").html();
	
	if(cal1Date == "날짜를 선택해주세요."){
		cal1Date = $("#today_box").html();
		
	}
	
	var hour_select = $("#hour_select").val();
	var min_select = $("#min_select").val();
	
	// 4번띄어쓰기함 
	var startD = cal1Date+"\u00A0\u00A0\u00A0\u00A0"+hour_select+"\u00A0"+min_select;
	
	
	
	
	
	
	//----------------------------endD--------------------------------//
	var Rcal1Date = $("#RdateShow_box").html();
	
	if(Rcal1Date == "날짜를 선택해주세요."){
		Rcal1Date = $("#Rtoday_box").html();
		
	}
	
	var Rhour_select = $("#Rhour_select").val();
	var Rmin_select = $("#Rmin_select").val();
	
	// 4번띄어쓰기함 
	var endD = Rcal1Date+"\u00A0\u00A0\u00A0\u00A0"+Rhour_select+"\u00A0"+Rmin_select;
	
	var start_hour = Number(hour_select.replace("시",""));
	var end_hour = Number(Rhour_select.replace("시",""));
	
	
	if(cal1Date == Rcal1Date){
		if( start_hour > end_hour){
			alert("죄송합니다. 대여시간 이후의 반납시간으로 설정해주세요.");
			return false;
		}else if( start_hour+1 > end_hour){  // 적어도 1시간 이상은 빌려야함 
			alert("죄송합니다. 대여 정책에 따라 대여는 1시간 이상 선택하셔야 대여가능합니다.");
			return false;
		}
		
		
	}
	
	
	
	
	$("#startD").html(startD);
	$("#startD").css("text-align","left");
	$("#startD").css("padding-left","8px");
	$("#startD").css("color","black");
	$("#startD").css("border","2px solid red");
	$("#startD").css("background","white");
	
	$("#endD").html(endD);
	$("#endD").css("text-align","left");
	$("#endD").css("padding-left","8px");
	$("#endD").css("color","black");
	$("#endD").css("border","2px solid red");
	$("#endD").css("background","white");
	
	

	
	
	$("#calBg").fadeOut(300);
		
	
}
</script>



<style>
.calBg {
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

.calbox {
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

.calBg .top {
	width: 1000px;
	height: 67px;
	/*background: red;*/
	border-bottom: 1px solid #d3d3d3;
}

.calTitle {
	float: left;
	font-size: 23px;
	font-weight: bold;
	/*background:pink;*/
	margin-top: 24px;
	margin-left: 29px;
}

.boxClose {
	position: absolute;
	right: 25px;
	top: 23px;
	width: 19px;
	height: 19px;
	background: url(../img/btn-close.png) no-repeat;
	opacity: 0.3;
}

.calbox .middle {
	width: 942px;
	padding-top: 18px;
	padding-left: 29px;
	padding-right: 29px;
	font-family: 'NanumBarunGothic', '맑은 고딕', '돋음', dotum, sans-serif;
	/*background: pink;*/
}

.calbox button {
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

.arrowImg{
	width:20px;
	height:35px;
	background-image:url('../img/ico_cal_arrow.png');
	float:left;
	margin-top:215px;
	margin-left:70px;
}

.cal_explain{
     font-size:9pt; 
     color:red;
     margin-left:70px;
}
</style>






<body>

	<div id="calBg" class="calBg">
		<div class="calbox">

			<div class="top">
				<div class="calTitle">기간 선택</div>

				<a href="javascript:backCal()">
					<div class="boxClose"></div>
				</a>
			</div>


			<div class="middle">
	
			<%@include file = "./cal1.jsp" %>
		
			<div class = "arrowImg"></div>
			
			<%@include file = "./cal2.jsp" %>
			
			<div style = "width:69px; height:435px;float:left;"></div> <!-- 여백 div -->
			
			<div class = "cal_explain">
			▪ &nbsp;FFC렌터카 표준영업시간은 08:30~18:00(서울지역 08:30~19:00)이며, 그 외 시간을 선택하는 경우 이용 가능한 지점이 적거나 없을 수 있습니다.
			</div>

				<button type="button" onclick = "cal_submit()">확인</button>

			</div>

		</div>
	</div>
</body>
</html>


