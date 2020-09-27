<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/dbCon.jsp"%>
<%
String url33333 = request.getRequestURI();
%>
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
function main_login(){
	var userid = $.trim($("#mainUserid").val());
	$("#mainUserid").val(userid);
	if(userid == ""){
		alert("아이디를 입력해 주세요.");
		$("#mainUserid").focus;
		return false;
	}
	
	var pass = $.trim($("#mainPass").val());
	$("#mainPass").val(pass);
	if(pass == ""){
		alert("비밀번호를 입력해 주세요.");
		$("#mainPass").focus;
		return false;
	}
	
	
	$.ajax({

		type:"POST",
		url:"../member/loginSub.jsp",
		dataType : "text",
		data: "userid="+userid+"&pass="+pass,
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

function carSizeValue(a){
		
		$("#carSize").val(a);
		
		for(var i=0;i<10;i++){
			$(".a"+i).css("border","none");
		}
		$(".a"+a).css("border","2px solid red");
		
	
		for(var i=0;i<10;i++){
			$(".refer"+i).css("display","none");
		}
		$(".refer"+a).css("display","block");
		
}

$(function(){
	var sale = $(".sale").html();
	var sale2 = sale.replace(/[^0-9]/g,'');
	sale2 = Number(sale2);
	sale2 = sale2.toLocaleString();
	sale3 = "할인가 "+sale2+"원";
	$(".sale").html(sale3);
	
	
	var origin = $(".origin").html();
	origin = origin.replace(/[^0-9]/g,'');
	origin = Number(origin);
	origin = origin.toLocaleString();
	origin = "정상가 "+origin+"원";
	$(".origin").html(origin);
	
	
	
	
	
	
	
	
	
	
	
	$("#simpleRentBtn").click(function(){
		/*var frm = $("#frm").serialize();
		$.ajax({
			type:"POST",
			url:"test.jsp",
			dataType : "text",
			data: frm,
			success: function(data){
				if($.trim(data) == "ok"){ 
					alert("ok");
				}else{
					alert("잘못입력");
				}
			},
			error: function(){
				alert("에라가 발생했습니다.");
			}
			
			
		});	
		*/
		
		
		var rentdate = $("#startD").html();
		$("#rentdate").val(rentdate);

		var returndate = $("#endD").html();
		$("#returndate").val(returndate);
		
		var rentStore = $("#rentStore").html();
		$("#rentStoreName").val(rentStore);
		
		var returnStore = $("#returnStore").html();
		$("#returnStoreName").val(returnStore);
		
		/* -------------------- 유효성체크 -------------------- */
		if($("#rentdate").val() == null || $("#rentdate").val() == "대여일시"){
			alert("대여일시를 선택해주세요");
			return false;
		}
	
		if($("#returndate").val() == null || $("#returndate").val() == "반납일시"){
			alert("기간을 선택해주세요");
			return false;
		}
		
		if($("#rentStoreName").val() == null || $("#rentStoreName").val() == "대여지점"){
			alert("지점을 선택해주세요");
			return false;
		}
		
		if($("#returnStoreName").val() == null || $("#returnStoreName").val() == "반납지점"){
			alert("대여지점를 선택해주세요");
			return false;
		}
		
		
		
		frm.submit();
	});
		
	
	
});
	
	

</script>


<style>
     @font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	
	
	
	
/*------------------------------------ left -------------------------------------------*/
	
	.left_box{
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		border:1px solid #d6d6d6;
		float:left;
		/*width:933px;*/
		width:409.5px;
		height:660px;
		margin-right:10px;
		padding: 25px;
		
		
	}
	
	.left_box .title1{
		font-size:20pt;
		font-weight:bold;
		font-family: 'Tmonmonsori', sans-serif;
		margin:30px;
		height:12px;
	}
	
	 .left_box .title1:after {
        content: "";
        display: block;
        width: 113px;
        border-bottom: 10px solid #ff6767;
        margin: -11px -5px;
      }
      
      
       .left_box .subtitle_box{
      		margin-top:25px;
      }
      
       .left_box .subtitle{
      	font-size:11.5pt;
      	font-weight:bold;
      	margin-bottom:8px;
      }
      
       .left_box .box{
      	width:196px;
	    height: 53px;
	    border: 1px solid #c2c2c2;
	    box-sizing: border-box;
	    text-align: center;
	    
	    background-image:url('../img/right_arrow.png');
	    background-repeat:no-repeat;
	    background-size: 20px;
	    background-position:90% center;
	    line-height:50px;
	    
	    float:left;
	
      }
      
       .left_box a{
      	font-size:12pt;
      	color:#888888;
      }
      
       .left_box td a{
      	color:#313131;
      	/*padding:15px 40px;*/
      	display:inline-block;
      	width:130.4px;
      	padding-top:15px;
      	height:30.8px; /* 134.4 52.8 -> 4커짐 */
      }
      
       .left_box .a0{
      	width: 404px;
      }
      
      .left_box  h7{
      	 font-size:9pt; 
      	 color:red;
      	 /*visibility:hidden;*/
      	 display:none;
      }
      
       .left_box table{
      	border-collapse:collapse;
      	width:411.2px;
      	
      }
      
       .left_box td{
            	
      	padding:0;
      	border: 1px solid #c2c2c2;
      	font-size:12pt;
      	text-align:center;
      	color:#313131;
      	width:130.4px;
      	height:49.8px;
      	
      	
      }
      
     .left_box .refer2{
      	display:block;
      }
      
      .left_box .a2{
      	border:2px solid red;
      }
      
      .left_box #simpleRentBtn{
      	border:none;
		float:right;
		background:#ff6767;
		width:410px;
		height:48px;
		color:white;
		font-weight:bold;	
      }
      
 /*------------------------------------ middle -------------------------------------------*/
      
      
	.middle_box{
		border:1px solid #d6d6d6;
		float:left;
		width:394px;
		padding: 25px;
		height:660px;
		margin-right:10px;
		
	}
	
	.middle_box:hover{
		box-shadow: 0 2px 4px 0 rgba(0,0,0,0.2), 0 2px 7px 0 rgba(0,0,0,0.19);
	}
	
	
	 .middle_box .title2{
	 	color:black;
		font-size:20pt;
		font-weight:bold;
		font-family: 'Tmonmonsori', sans-serif;
		margin:30px;
		height:12px;
	}
	
	 .middle_box .title2:after {
        content: "";
        display: block;
        width: 185px;
        border-bottom: 10px solid #ff6767;
        margin: -11px -5px;
      }
	
	.middle_box .carbox{
		/*border: 1px solid pink;*/
		width:390px;
		height:200px;
		
		margin-top:80px;
		
		background-image:url('../img/sampleCar1.jpg');
	    background-repeat:no-repeat;
	    background-size: 400px;
	    background-position: center;
		
	}
	
	.middle_box .discount{
		margin-top:15px;
		background:#f04040;
		border-radius:5px;
		width:120px;
		height:45px;
		color:white;
		font-size:22pt;
		font-weight:bold;
		text-align:center;
		
	}
	
	.middle_box .carName_div{
		color:black;
		font-size:14pt;
		font-weight:bold;
		font-family: 'Tmonmonsori', sans-serif;
		
	}
	
	.middle_box .origin{
		margin-top:20px;
		color:grey;
		text-decoration:line-through;
	}
	
	.middle_box .sale{
		font-family: 'Tmonmonsori', sans-serif;
		font-size:18pt;
		color:red;
	}
	
	.middle_box .goDetail{
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		text-align:right;
		color:#ff6767;
		font-weight:bold;
		font-size:15pt;
		margin-top:110px;
		
		
	}
	
	
/*------------------------------------ right -------------------------------------------*/
	
	.right_box{
		float:right;
	
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
	}
	
	
	.login_box1{
		background:#606062;
		
		width:231px;
		height:250px;
		/*365*/
		padding: 25px 30px 0 30px;
		
	}
	
	
	.login_box1_2{
		background:#606062;
		
		width:231px;
		height:170px;
		/*365*/
		padding: 25px 30px 0 30px;
		
	}
	
	.My_Account{
		font-size:26px;
		color:white;
		font-weight:bold;
		margin-bottom: 25px;
	}
	
	.right_box .head1{
		border:1px solid #9d9d9d;
		border-bottom:none;
		width:113.5px;
		/*width:114.5px;*/
		height:25px;
		float:left;
		
		color:white;
		font-size:10pt;
		text-align:center;
		padding-top:15px;
		
	}
	
	.right_box .head2{
		border-bottom:1px solid #9d9d9d;
		width:113.5px;
		/*width:114.5px;*/
		height:40px;
		float:left;
	}
	
	
	.border{
		border:1px solid rgb(195, 195, 195);
		width:154px;
		height:18px;
		padding:5px;
		background:white;
		
		
	}
	
	input[type = "text"]{
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		outline:none;
		border:none;
		width:150px;
		
	}
	
	input[type = "password"]{
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		outline:none;
		border:none;
		width:150px;
		
	}
	
	
	/* placeholder 컬러변경 */
	input::placeholder {
	  color:rgb(195, 195, 195);
	  opacity: 1; /* 파이어폭스에서 뿌옇게 나오는 현상을 방지하기 위한 css */
	}
	input::-webkit-input-placeholder {
	  color:rgb(195, 195, 195);
	}
	input:-ms-input-placeholder {
	  color:rgb(195, 195, 195);
	}
	input:-mos-input-placeholder {
	  color:rgb(195, 195, 195);
	}
	
	
	#loginBtn{
		border:none;
		float:right;
		background:#ff6767;
		width:63px;
		height:62px;
		color:white;
		font-weight:bold;	
	}
	
	
	.login_box2 .font{
		font-size:27px;
		color:white;
		font-weight:bold;
		
	}
	
	.login_ul2{
		list-style:none;
		display:inline-block;
		padding:0px;
		margin-block-start: 0.5em;
		
	}
	
	.login_ul2 li{
		padding:0px;
		float:left;
		margin-right:20px;
		

	}
	.login_ul2 li a{
		color:#d8d8d1;
		font-size:10pt;
		font-weight:normal;
	}
	
	.login_ul2 li:nth-child(3){
		margin-right:0;
	}
	
	.login_ul{
		list-style:none;
		display:inline-block;
		padding:0px;

	}
	
	.login_ul li{
		padding:0px;
		font-size:10pt;
		float:left;
		margin-right:42px;
		

	}
	.login_ul li a{
		color:white;
		font-size:12pt;
	}
	
	.login_ul li:nth-child(3){
		margin-right:0;
	}

	
	.login_box2{
		background:#6b6e71;
		width:231px;
		height:100px;
		padding: 25px 30px 0 30px;
		
		
	}
	
	input[type = "checkbox"] + label {
			display: inline-block;
			width: 13px;
			height: 13px;
			border: 1px solid #ff6767;
			cursor: pointer;
			
	}
	input[type = "checkbox"]:checked + label {
			border: 1px solid #ff6767;
			background: url(../img/ico_check.png) no-repeat;
	}
	
	input[type = "checkbox"] {
				display: none;
	}
	
	.nickDiv{
		font-size:14pt;
		font-weight:bold;
		color:white;
		float:left;
	}
	
	.member_set{
		width:23px;
		height:20px;
		float:left;
		margin-left:20px;
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

	<div class = "section_container">
		<!-- 내용을 쓰세영 ^_^ -->
		
		<!------------------ left_box ---------------------->
		<div class ="left_box">
			<div class ="title1">간편 예약</div>
			<div style = "width:100px; height:25px;"></div> <!-- 이너박스 -->
				
			<div class = "subtitle_box">
				<div class ="subtitle">기간 선택</div>
				<div>
					<a href = "javascript:callCal();">
						<div class = "box rent" id = "startD" style = "margin-right:15px;">대여일시</div>
					</a>
					
					<a href = "javascript:callCal();">
						<div class = "box rent" id = "endD">반납일시</div>
					</a>
					
					<div style = "width:100px;height:58px"></div>
					<h7>▪ &nbsp;대여시간이 24시간 이상인 경우에만 할인이 적용됩니다.</h7>				
				</div>
			</div>
			
			
			<div class = "subtitle_box">
				<div class ="subtitle">지점선택</div>
				<div>
					<a href = "javascript:callStore();">
						<div class = "box rent" id = "rentStore" style = "margin-right:15px;">대여지점</div>
					</a>
					
					<a href = "javascript:callStore();">
						<div class = "box rent" id = "returnStore">반납지점</div>
					</a>
					
					<div style = "width:100px;height:58px"></div>
					<h7>▪ &nbsp;대여지점과 다른 지점으로 반납하실 경우 별도의 수수료가 부과됩니다.</h7>				
				</div>
			</div>
			
			<div class = "subtitle_box">
				<div class ="subtitle">차량유형 선택</div>
				<table>
					<colgroup>
					
					</colgroup>
					<tr>
						<td><a href="javascript:carSizeValue(1);" class = "a1">경차</a></td>
						<td><a href="javascript:carSizeValue(2);" class = "a2">소형차</a></td>
						<td><a href="javascript:carSizeValue(3);" class = "a3">중형차</a></td>
					</tr>
					<tr>
						<td><a href="javascript:carSizeValue(4);"  class = "a4">준대형차</a></td>
						<td><a href="javascript:carSizeValue(5);"  class = "a5">대형차</a></td>
						<td><a href="javascript:carSizeValue(6);" class = "a6">승합차</a></td>
					</tr>
					<tr>
						<td><a href="javascript:carSizeValue(7);" class = "a7">SUV/RV</a></td>
						<td><a href="javascript:carSizeValue(8);"  class = "a8">전기차</a></td>
						<td><a href="javascript:carSizeValue(9);" class = "a9">수입차</a></td>
					</tr>
					<tr>
						<td colspan = "3" ><a href="javascript:carSizeValue(0);" class = "a0">전체</a></td>
					</tr>
				</table>
				
				<div style = "width:100px;height:15px"></div>
				
				<div style = "width:400px;height:30px;">
				<h7 class= "refer1">▪ &nbsp;경차안내 : 모닝, 스파크, 레이등 경차급 차량</h7>	
				<h7 class= "refer2">▪ &nbsp;소형안내 : 아반떼, K3, SM3등 준중형급 차량</h7>
				<h7 class= "refer3">▪ &nbsp;중형안내 : 쏘나타, K5, SM6, 말리부 등 중형차급 차량</h7>
				<h7 class= "refer4">▪ &nbsp;준대형안내 : 그랜져, K7, SM7 등 준대형급차량</h7>
				<h7 class= "refer5">▪ &nbsp;대형안내 : 제네시스, K9 등 대형급차량</h7>
				<h7 class= "refer6">▪ &nbsp;승합안내 : 카니발, 스타렉스, 쏠라티 / 단체여행 추천</h7>	
				<h7 class= "refer7">▪ &nbsp;SUV/RV안내 : 적재공간이 넉넉한 SUV차량</h7>		
				<h7 class= "refer8">▪ &nbsp;전기차안내 : 아이오닉EV, 볼트EV / 친환경자동차량</h7>		
				<h7 class= "refer9">▪ &nbsp;수입차안내 : BMW, 벤츠 등 해외 브랜드 수입차량</h7>
				<h7 class= "refer0">▪ &nbsp;모든차량(조회가 오래걸릴 수 있습니다.)</h7>				
				</div>
				
			<form id = "frm" name = "frm" method = "post" action = "../reserve/detailSearch.jsp">
				
				<input type ="hidden" id = "rentdate" name = "rentdate" value = "">
				<input type ="hidden" id = "returndate" name = "returndate" value = "">
				
				<input type ="hidden" id = "rentStoreName" name = "rentStoreName" value = "">
				<input type ="hidden" id = "returnStoreName" name = "returnStoreName" value = "">
				
				<input type ="hidden" id = "carSize" name = "carSize" value = "0">
				
				<button id = "simpleRentBtn" type = "button">검색</button>
			</form>
			
			</div>
			
			
		</div> <!-- left_box -->
		
		
		<!------------------ middle_box ---------------------->
		<a href = "#">
		<div class ="middle_box">
			<div class ="title2">오늘의 추천차량</div>
			<div class = "carbox"></div>
			<div style = "padding:0px 30px;">
			<div class = "discount">-58%</div>
			
			<div style = "margin:15px;">
				<div class = "carName_div">그랜드스타렉스 12인승</div>
				<div style = "color:black;font-size:10pt;">승합/경유/자동</div>
				<div class = "origin">정상가 496000원</div>
				<div class = "sale">할인가 207400원</div>
			</div>
			
		</div>
		
		<div class = "goDetail">해당차량 상세보기&nbsp;&nbsp;&nbsp;></div>
		
		</div><!-- middle_box -->
		</a>
	
		<!------------------ right_box ---------------------->
		<div class = "right_box">
			
			
				<%
	String SessionIdM= (String) session.getAttribute("SessionId");
	if(SessionIdM == null){
	%>
		<div class = "login_box1">
				<div class = "My_Account">My Account</div><!-- My_Account --> 
				
					<div style = "width:100%;height:50px;">
					<div class = "head1" >회원 로그인</div>
					<div class = "head2"></div>
					</div>
					
					<button type = "button" id = "loginBtn" onclick = "main_login()">로그인</button>
					<div class = "border" style = "margin-bottom:2px;"><input id = "mainUserid" type = "text" placeholder ="아이디"></div>
					<div class ="border"><input id = "mainPass" type = "password" placeholder ="비밀번호" style = "margin-bottom:10px;"></div>
				<div>
				
				<div style = "margin-top:15px;">
					
					<div style="float:left;">
			   		<input type="checkbox" id="cb9">
			    	<label for="cb9"></label> &nbsp;
			    	</div>
			    	
			    	<div style = "float:left;color:#d8d8d1;font-size:11pt;">자동로그인</div>
    			</div>
				
				
				<ul class = "login_ul2">
						<li><a href="#">아이디찾기</a></li>
						<li><a href="#">비밀번호찾기</a></li>
						<li><a href="../member/memberWrite.jsp">회원가입</a></li>
					</ul>
				</div>
				
			
			</div><!-- login_box1 --> 

	<%
	}else{
		String sql = "select nickname from memberInfo where userid = '"+SessionIdM+"'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String nickname = rs.getString("nickname");
	%>			
		
		<div class = "login_box1_2">
				<div class = "My_Account">My Account</div><!-- My_Account --> 
				
					<div style = "width:100%;height:50px;">
					<div class ="nickDiv"><%=nickname %>님</div>
					<a href = "../member/myPage.jsp"><img src = "../img/ico_setting.png" class ="member_set"></a>
					</div>
					
				<div>
				
		
				<div style = "border-top:1px solid grey; width:230px;"></div>
				
				<ul class = "login_ul2">
						<li><a href="../reserve/rentList.jsp">예약내역</a></li>
						<li><a href="#">쿠폰</a></li>
						<li><a href = "../member/logout.jsp?url=<%=url33333 %>">로그아웃</a></li>
					</ul>
				</div>
				
			
			</div><!-- login_box1-2 --> 
		
		
		
		
				
	<%} %>
		
			
			<div class = "login_box2">
				<div class = "font">
					<span class = "font" style = "font-size:23px;">고객센터</span>
					1995-1230
				</div>
				<div>
					<ul class = "login_ul">
						<li><a href="#">지점안내</a></li>
						<li><a href="#">상담문의</a></li>
						<li><a href="#">FAQ</a></li>
					</ul>
				</div>
			</div><!-- login_box2 --> 
			
			
			
		
			
			
			<%@include file = "../include/main_slider1.jsp" %>
		
		</div> <!-- right_box --> 
	
	</div>

</section>


<aside>
	<div class = "aside_container">
		<!-- aside를 쓰세영 ^_^ -->
		
		<!-- section과 aside 사이세로 여백   -->
		<div style = "width:100px;height:800px;"></div> 
		<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	</div>
</aside>

 
<footer>
		<div class = "footer_container">
		<%@include file="../include/footer.jsp" %>
	</div>
</footer>
 
</body>
</html>