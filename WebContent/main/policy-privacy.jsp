<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/dbCon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 | FFC렌터카</title>
<link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png">
<link rel="stylesheet" href="../css/style2.css" type="text/css">
<link href='http://www.openhiun.com/hangul/nanumbarungothic.css'
	rel='stylesheet' type='text/css'>
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/jquery-ui.js"></script>
</head>

<script>
	function main_login() {
		var userid = $.trim($("#mainUserid").val());
		$("#mainUserid").val(userid);
		if (userid == "") {
			alert("아이디를 입력해 주세요.");
			$("#mainUserid").focus;
			return false;
		}

		var pass = $.trim($("#mainPass").val());
		$("#mainPass").val(pass);
		if (pass == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#mainPass").focus;
			return false;
		}

		$.ajax({

			type : "POST",
			url : "../member/loginSub.jsp",
			dataType : "text",
			data : "userid=" + userid + "&pass=" + pass,
			success : function(data) {
				if ($.trim(data) == "no") {
					alert("아이디 비밀번호가 일치하지 않습니다.");
				} else {
					location.reload();
				}
			},
			error : function() {
				alert("에라가 발생했습니다.");
			}
		});

	}

	function carSizeValue(a) {

		$("#carSize").val(a);

		for (var i = 0; i < 10; i++) {
			$(".a" + i).css("border", "none");
		}
		$(".a" + a).css("border", "2px solid red");

		for (var i = 0; i < 10; i++) {
			$(".refer" + i).css("display", "none");
		}
		$(".refer" + a).css("display", "block");
	}

	$(function() {
		var sale = $(".sale").html();
		var sale2 = sale.replace(/[^0-9]/g, '');
		sale2 = Number(sale2);
		sale2 = sale2.toLocaleString();
		sale3 = "할인가 " + sale2 + "원";
		$(".sale").html(sale3);

		var origin = $(".origin").html();
		origin = origin.replace(/[^0-9]/g, '');
		origin = Number(origin);
		origin = origin.toLocaleString();
		origin = "정상가 " + origin + "원";
		$(".origin").html(origin);

		$("#simpleRentBtn").click(
				function() {
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
					rentdate = rentdate
							.replace("&nbsp;&nbsp;&nbsp;&nbsp;", " ");
					rentdate = rentdate.replace("시&nbsp;", ":");
					rentdate = rentdate.replace("분", "");
					$("#rentdate").val(rentdate);

					var returndate = $("#endD").html();
					returndate = returndate.replace("&nbsp;&nbsp;&nbsp;&nbsp;",
							" ");
					returndate = returndate.replace("시&nbsp;", ":");
					returndate = returndate.replace("분", "");
					$("#returndate").val(returndate);

					var rentStore = $("#rentStore").html();
					$("#rentStoreName").val(rentStore);

					var returnStore = $("#returnStore").html();
					$("#returnStoreName").val(returnStore);

					/* -------------------- 유효성체크 -------------------- */
					if ($("#rentdate").val() == null
							|| $("#rentdate").val() == "대여일시") {
						alert("대여일시를 선택해주세요");
						return false;
					}

					if ($("#returndate").val() == null
							|| $("#returndate").val() == "반납일시") {
						alert("기간을 선택해주세요");
						return false;
					}

					if ($("#rentStoreName").val() == null
							|| $("#rentStoreName").val() == "대여지점") {
						alert("지점을 선택해주세요");
						return false;
					}

					if ($("#returnStoreName").val() == null
							|| $("#returnStoreName").val() == "반납지점") {
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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/*------------------------------------ left -------------------------------------------*/
.left_box {
	font-family: 'NanumBarunGothic', '맑은 고딕', '돋음', dotum, sans-serif;
	border: 1px solid #d6d6d6;
	float: left;
	/*width:933px;*/
	width: 409.5px;
	height: 660px;
	margin-right: 10px;
	padding: 25px;
}

.left_box .title1 {
	font-size: 20pt;
	font-weight: bold;
	font-family: 'Tmonmonsori', sans-serif;
	margin: 30px;
	height: 12px;
}

.left_box .title1:after {
	content: "";
	display: block;
	width: 113px;
	border-bottom: 10px solid #ff6767;
	margin: -11px -5px;
}

.left_box .subtitle_box {
	margin-top: 25px;
}

.left_box .subtitle {
	font-size: 11.5pt;
	font-weight: bold;
	margin-bottom: 8px;
}

.left_box .box {
	width: 196px;
	height: 53px;
	border: 1px solid #c2c2c2;
	box-sizing: border-box;
	text-align: center;
	background-image: url('../img/right_arrow.png');
	background-repeat: no-repeat;
	background-size: 20px;
	background-position: 90% center;
	line-height: 50px;
	float: left;
}

.left_box a {
	font-size: 12pt;
	color: #888888;
}

.left_box td a {
	color: #313131;
	/*padding:15px 40px;*/
	display: inline-block;
	width: 130.4px;
	padding-top: 15px;
	height: 30.8px; /* 134.4 52.8 -> 4커짐 */
}

.left_box .a0 {
	width: 404px;
}

.left_box  h7 {
	font-size: 9pt;
	color: red;
	/*visibility:hidden;*/
	display: none;
}

.left_box table {
	border-collapse: collapse;
	width: 411.2px;
}

.left_box td {
	padding: 0;
	border: 1px solid #c2c2c2;
	font-size: 12pt;
	text-align: center;
	color: #313131;
	width: 130.4px;
	height: 49.8px;
}

.left_box .refer2 {
	display: block;
}

.left_box .a2 {
	border: 2px solid red;
}

.left_box #simpleRentBtn {
	border: none;
	float: right;
	background: #ff6767;
	width: 410px;
	height: 48px;
	color: white;
	font-weight: bold;
}

/*------------------------------------ middle -------------------------------------------*/
.middle_box {
	border: 1px solid #d6d6d6;
	float: left;
	width: 394px;
	padding: 25px;
	height: 660px;
	margin-right: 10px;
}

.middle_box:hover {
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 2px 7px 0
		rgba(0, 0, 0, 0.19);
}

.middle_box .title2 {
	color: black;
	font-size: 20pt;
	font-weight: bold;
	font-family: 'Tmonmonsori', sans-serif;
	margin: 30px;
	height: 12px;
}

.middle_box .title2:after {
	content: "";
	display: block;
	width: 185px;
	border-bottom: 10px solid #ff6767;
	margin: -11px -5px;
}

.middle_box .carbox {
	/*border: 1px solid pink;*/
	width: 390px;
	height: 200px;
	margin-top: 80px;
	background-image: url('../img/sampleCar1.jpg');
	background-repeat: no-repeat;
	background-size: 400px;
	background-position: center;
}

.middle_box .discount {
	margin-top: 15px;
	background: #f04040;
	border-radius: 5px;
	width: 120px;
	height: 45px;
	color: white;
	font-size: 22pt;
	font-weight: bold;
	text-align: center;
}

.middle_box .carName_div {
	color: black;
	font-size: 14pt;
	font-weight: bold;
	font-family: 'Tmonmonsori', sans-serif;
}

.middle_box .origin {
	margin-top: 20px;
	color: grey;
	text-decoration: line-through;
}

.middle_box .sale {
	font-family: 'Tmonmonsori', sans-serif;
	font-size: 18pt;
	color: red;
}

.middle_box .goDetail {
	font-family: 'NanumBarunGothic', '맑은 고딕', '돋음', dotum, sans-serif;
	text-align: right;
	color: #ff6767;
	font-weight: bold;
	font-size: 15pt;
	margin-top: 110px;
}

/*------------------------------------ right -------------------------------------------*/
.right_box {
	float: right;
	font-family: 'NanumBarunGothic', '맑은 고딕', '돋음', dotum, sans-serif;
}

.login_box1 {
	background: #606062;
	width: 231px;
	height: 250px;
	/*365*/
	padding: 25px 30px 0 30px;
}

.login_box1_2 {
	background: #606062;
	width: 231px;
	height: 250px;
	/*365*/
	padding: 25px 30px 0 30px;
}

.My_Account {
	font-size: 26px;
	color: white;
	font-weight: bold;
	margin-bottom: 25px;
}

.right_box .head1 {
	border: 1px solid #9d9d9d;
	border-bottom: none;
	width: 113.5px;
	/*width:114.5px;*/
	height: 25px;
	float: left;
	color: white;
	font-size: 10pt;
	text-align: center;
	padding-top: 15px;
}

.right_box .head2 {
	border-bottom: 1px solid #9d9d9d;
	width: 113.5px;
	/*width:114.5px;*/
	height: 40px;
	float: left;
}

.border {
	border: 1px solid rgb(195, 195, 195);
	width: 154px;
	height: 18px;
	padding: 5px;
	background: white;
}

input[type="text"] {
	font-family: 'NanumBarunGothic', '맑은 고딕', '돋음', dotum, sans-serif;
	outline: none;
	border: none;
	width: 150px;
}

input[type="password"] {
	font-family: 'NanumBarunGothic', '맑은 고딕', '돋음', dotum, sans-serif;
	outline: none;
	border: none;
	width: 150px;
}

/* placeholder 컬러변경 */
input::placeholder {
	color: rgb(195, 195, 195);
	opacity: 1; /* 파이어폭스에서 뿌옇게 나오는 현상을 방지하기 위한 css */
}

input::-webkit-input-placeholder {
	color: rgb(195, 195, 195);
}

input:-ms-input-placeholder {
	color: rgb(195, 195, 195);
}

input:-mos-input-placeholder {
	color: rgb(195, 195, 195);
}

#loginBtn {
	border: none;
	float: right;
	background: #ff6767;
	width: 63px;
	height: 62px;
	color: white;
	font-weight: bold;
}

.login_box2 .font {
	font-size: 27px;
	color: white;
	font-weight: bold;
}

.login_ul2 {
	list-style: none;
	display: inline-block;
	padding: 0px;
	margin-block-start: 0.5em;
}

.login_ul2 li {
	padding: 0px;
	float: left;
	margin-right: 20px;
}

.login_ul2 li a {
	color: #d8d8d1;
	font-size: 10pt;
	font-weight: normal;
}

.login_ul2 li:nth-child(3) {
	margin-right: 0;
}

.login_ul {
	list-style: none;
	display: inline-block;
	padding: 0px;
}

.login_ul li {
	padding: 0px;
	font-size: 10pt;
	float: left;
	margin-right: 42px;
}

.login_ul li a {
	color: white;
	font-size: 12pt;
}

.login_ul li:nth-child(3) {
	margin-right: 0;
}

.login_box2 {
	background: #6b6e71;
	width: 231px;
	height: 100px;
	padding: 25px 30px 0 30px;
}

input[type="checkbox"]+label {
	display: inline-block;
	width: 13px;
	height: 13px;
	border: 1px solid #ff6767;
	cursor: pointer;
}

input[type="checkbox"]:checked+label {
	border: 1px solid #ff6767;
	background: url(../img/ico_check.png) no-repeat;
}

input[type="checkbox"] {
	display: none;
}

.nickDiv {
	font-size: 14pt;
	font-weight: bold;
	color: white;
}
</style>


<body>
	<%@include file="../member/login2.jsp"%>
	<%@include file="../reserve/cal.jsp"%>
	<%@include file="../reserve/store.jsp"%>

	<header>
		<div class="header_container">
			<%@ include file="../include/header2.jsp"%>
		</div>
	</header>


	<section>
		<div class="section_container">
			<div style="padding-left: 150px; width:1000px; margin-left:150px; border-top:1px solid #c8c8c8; border-bottom:1px solid #c8c8c8; float:left;">
				<h3>개인정보의 수집 및 이용목적에 대한 동의</h3>
				<h4>1. 개인정보의 수집목적 및 이용</h4>
				<p style="margin-left:10px;">
					가.FFC는 다음과 같은 목적을 위하여 고객님의 개인정보를 수집하고 있습니다.<br>
					&nbsp;&nbsp;- FFC 장기대여 견적신청 서비스 제공을 위함 <br>
					나.FFC는 관계법령에 의한 경우나 이용자인 정보주체의 사전동의를 얻은 경우를 제외하고는 수집한 개인정보를상기 목적 이외의 용도로 활용하지 않겠습니다.<br>
				</p>
				
				<h4>2. 개인정보수집 항목 및 수집방법</h4>
				<p style="margin-left:10px;">
					가. 개인정보수집 항목 - 이름 : 본인 확인 및 장기렌터카 신청을 위함<br>
					&nbsp;&nbsp;- 휴대전화번호, 이메일 : 고객 견적신청 사항에 대한 회신을 위함<br>
					나. 개인정보수집방법 - 홈페이지에서 운영하는 신청양식을통해 개인정보 수집<br>
				</p>
				
				<h4>3. 개인정보의 보유 및 이용기간 이용자가 제공한 개인정보는 접수일로부터 3년 동안 FFC가 보유하게 됩니다.</h4>
				
				<h4>4. 동의 거부권 및 불이익 본인은 위와 같은 본인의 개인정보 수집·이용에 관한 동의를 거부할 권리가있습니다.</h4>
				<p style="margin-left:10px;">
					다만, 동의를 거부하는 경우 차량 대여가 불가능(대여자격 미확인)하거나 요금 할인 등 회원 혜택이 적용되지않는 등(비회원)불이익이 있습니다.
				</p>
				<br><br><br><br>
			</div>
			<div class="right_box">
				<%
					String SessionIdM = (String) session.getAttribute("SessionId");
					if (SessionIdM == null) {
				%>
				<div class="login_box1">
					<div class="My_Account">My Account</div>
					<!-- My_Account -->
					<div style="width: 100%; height: 50px;">
						<div class="head1">회원 로그인</div>
						<div class="head2"></div>
					</div>
					<button type="button" id="loginBtn" onclick="main_login()">로그인</button>
					<div class="border" style="margin-bottom: 2px;">
						<input id="mainUserid" type="text" placeholder="아이디">
					</div>
					<div class="border">
						<input id="mainPass" type="password" placeholder="비밀번호"
							style="margin-bottom: 10px;">
					</div>
					<div>
						<div style="margin-top: 15px;">
							<div style="float: left;">
								<input type="checkbox" id="cb9"> <label for="cb9"></label>
								&nbsp;
							</div>
							<div style="float: left; color: #d8d8d1; font-size: 11pt;">자동로그인</div>
						</div>
						<ul class="login_ul2">
							<li><a href="#">아이디찾기</a></li>
							<li><a href="#">비밀번호찾기</a></li>
							<li><a href="../member/memberWrite.jsp">회원가입</a></li>
						</ul>
					</div>
				</div>
				<!-- login_box1 -->
				<%
					} else {
						String sql = "select nickname from memberInfo where userid = '" + SessionIdM + "'";
						ResultSet rs = stmt.executeQuery(sql);
						rs.next();
						String nickname = rs.getString("nickname");
				%>
				<div class="login_box1_2">
					<div class="My_Account">My Account</div>
					<!-- My_Account -->
					<div style="width: 100%; height: 50px;">
						<div class="nickDiv"><%=nickname%>님
						</div>
					</div>
					<div>
						<div style="margin-top: 15px;"></div>
						<ul class="login_ul2">
							<li><a href="#">아이디찾기</a></li>
							<li><a href="#">비밀번호찾기</a></li>
							<li><a href="../member/memberWrite.jsp">회원가입</a></li>
						</ul>
					</div>
				</div>
				<!-- login_box1-2 -->
				<%
					}
				%>
				<div class="login_box2">
					<div class="font">
						<span class="font" style="font-size: 23px;">고객센터</span> 1995-1230
					</div>
					<div>
						<ul class="login_ul">
							<li><a href="#">지점안내</a></li>
							<li><a href="#">상담문의</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>
				</div>
				<!-- login_box2 -->
				<%@include file="../include/main_slider1.jsp"%>
			</div>
			<!-- right_box -->
		</div>
	</section>


	<aside>
		<div class="aside_container">
			<!-- aside를 쓰세영 ^_^ -->

			<!-- section과 aside 사이세로 여백   -->
			<div style="width: 100px; height: 800px;"></div>
			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
		</div>
	</aside>

	<%@include file="../include/footer.jsp"%>
	<footer>
		<div class="footer_container">
			<!-- footer를 쓰세영 ^_^ -->
		</div>
	</footer>

</body>
</html>