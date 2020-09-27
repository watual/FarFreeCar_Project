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
				<h2>서비스 이용약관</h2>
				<h3>[1장 총칙]</h3>
				<h4>제 1 조 (목적)</h4>
				<ul>
					<li>이 약관은 고객이 (주)대구대(이하 “회사”)가 제공하는 렌트카 가격비교 및 결제대행 서비스 “FFC”를 이용함에 있어 회사와 이용고객간의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. 인터넷과 모바일과 스마트 장치 등을 이용하는 전자상거래에 대하여도 이 약관을 표준으로 삼아 사용합니다.</li>
				</ul>
				<h4>제 2 조 (정의)</h4>
				<ul>
					<li>이 약관에서 사용하는 주요 용어입니다.</li>
				</ul>
				<ol>
					<li> “FFC”는 단기, 월, 장기, 보험대차 따위를 취급하는 렌트카 회사의 가격비교 서비스를 이용고객에게 제공하기 위하여 이용고객의 컴퓨터 및 휴대용 단말기 등 정보통신설비를 이용하여 재화, 용역을 거래할수 있도록 설정한 가상의 영업장 또는 회사가 운영하는 앱과 웹사이트를 말합니다. 또한 ”FFC”를 운영하는 사업자를 뜻하기도 합니다.</li>
					<li> “서비스”라 함은, 구현되는 단말기(PC, 태블릿, 휴대용 단말기 등의 각 종 유무선 장치)와 상관없이 브랜드명 “FFC”를 사용하여 “회사”가 제공하는 제반 서비스를 말합니다.</li>
					<li> “이용고객” 이라 함은, 회사의 “서비스”에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원과 비회원을 말합니다.</li>
					<li> “게시물” 이라 함은, “이용고객”이 “서비스”를 이용함에 있어 “서비스상”에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.</li>
					<li> “주문거래”라 함은 이용고객이 서비스를 이용함에 있어 결제서비스를 이용하여 매매거래가 이루어지는 일체를 말합니다.</li>
					<li> “포인트”와 “쿠폰”이라 함은 회원이 서비스 이용할 때 회사가 회원에 제공하는 사이버 화폐를 말합니다.</li>
				</ol>
				
				<h4>제 3 조 (약관의 게시, 효력 및 개정)</h4>
				<ol>
					<li> 회사는 이 약관의 내용을 이용고객이 쉽게 알 수 있도록 FFC의 서비스 화면에 게시합니다. 회원은 연결화면을 클릭해 약관의 구체적 내용 자세히 확인할 수 있습니다.</li>
					<li> 회사는 콘텐츠산업 진흥법, 전자상거래 관련 소비자보호에 관한 법률, 규제에 관한 법률, 소비자기본법, 전자거래기본법, 전자금융거래법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li>
					<li> 회사가 약관을 개정할 경우에는 기존 약관과 개정 약관 및 개정 약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 30일 전부터 일정기간 서비스 내 공지하고, 로그인 시 동의 관련 팝업등의 전자적 수단을 통해 고지합니다.</li>
					<li> 회사가 전 항에 따라 이용고객에게 통지하면서 공지 또는 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 않으면 승인한 것으로 간주합니다. 또한 이용고객이 명시적으로 거부의 의사 표시를하지 않은 경우에는 변경된 약관을 승인한 것으로 봅니다.</li>
					<li> 이용고객이 개정약관에 동의하지 않을 경우 이용고객은 제26조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.</li>
					<li> 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</li>
				</ol>
				
				<h3>[2장 서비스의 이용]</h3>
				<h4>제 4 조 (서비스 이용)</h4>
				<ol>
					<li> 서비스 이용은 회사의 서비스 사용승낙 직후부터 가능합니다.</li>
					<li> 서비스 이용시간은 회사의 업무 상 또는 기술 상 불가능한 경우를 제외하고는 연중무휴 1일 24시간(00:00-24:00)으로 함을 원칙으로 합니다. 다만, 서비스 설비의 정기점검 등의 사유로 회사가서비스를 특정범위로 분할하여 별도로 날짜와 시간을 정할 수 있습니다.</li>
				</ol>
	
				<h4>제 5 조 (서비스 내용 변경통지 등)</h4>
				<ul>
						<li>회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 서비스의 공지사항, SMS 등의 전자적 방식을 통하여 서비스 내용 관련 변경사항을 공지하거나 서비스 사용 종료를 통지할 수 있습니다. 회사는 예약 차량의 마감 또는 기술적 사양의 변경 등의 경우에는 체결되는 계약에 의해 제공할 차량 등의 내용을 변경할 수 있습니다. 이 경우에는 변경된 차량 등의 내용을 서비스에 즉시 공지합니다. 회사가 제공하기로한 차량이 마감되었거나 기술적 사양의 변경 등의 사유로 제공내용이 변경될 경우에는 그 사유를 통지 가능한 방법으로 회원에게 통지합니다.</li>
				</ul>
				<h4>제 6 조 (서비스 이용의 제한 및 중지)</h4>
				<ol>
					<li> 회사는 다음 사유가 발생한 경우에는 이용고객의 서비스 이용을 제한하거나 중지시킬 수 있습니다.</li>
				<br>
					<ol class="p1">
						<li> 이용고객이 회사 서비스의 운영을 고의 또는 중과실로 방해하는 경우</li>
						<li> 이용고객이 제8조의 의무를 위반한 경우</li>
						<li> 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우</li>
						<li> 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</li>
						<li> 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때 기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는경우</li>
					</ol>
					<br>
					<li> 회사는 “주민등록법"을 위반한 명의도용 및 결제도용, 전화번호 도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해,"정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 서비스 이용을 통해 획득한 혜택 등도 모두 소멸되며, 회사는 이에 대해 별도로 보상하지 않습니다.</li>
					<li> 회사는 본 조에 따라 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한 기간 등을 제5조 [서비스 내용 변경통지 등]에 따라 이용고객에게 통지합니다.</li>
					<li> 이용고객은 본 조에 따른 이용제한 등에 대해 회사가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 회사가 인정하는 경우 회사는 즉시 서비스의 이용을 재개합니다.</li>
				</ol>
				<h4>제 7 조 (권리의 귀속 및 저작물의 이용)</h4>
				<ol>
					<li> 회사가 이용고객에게 제공하는 각종 서비스에 대한 저작권을 포함한 일체의 권리는 회사에 귀속되며 이용고객이 서비스를 이용하는 과정에서 작성한 게시물에 대한 저작권을 포함한 일체에 관한 권리는 별도의의사표시가 없는 한 해당 이용고객에게 귀속됩니다.</li>
					<li> 회사는 서비스의 운영, 전시, 전송, 배포, 홍보 의 목적으로 이용고객의 별도의 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되게 합리적인 범위 내에서 다음과 같이 이용고객이 등록한게시물을 사용할 수 있습니다. – 다 음 – 서비스 내에서 이용고객의 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물성을 해치지 않는 범위 내에서의 편집 저작물 작성 미디어 , 통신사 등 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 전시 혹은 홍보하게 하는 것.</li>
					<li> 이용고객에 작성한 게시물에 대해 저작권 및 모든 책임은 이를 게시한 ‘이용고객’에게 있습니다. 단, 회사는 이용고객이 게시하거나 등록하는 게시물의 내용이 다음 각 호에 해당한다고 판단되는 경우해당 게시물을 사전통지 없이 삭제 또는 임시조치(블라인드)할 수 있습니다.</li>
					<br>
					<ol class="p1">
						<li> 다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우</li>
						<li> 공공질서 및 미풍양속에 위반되는 내용일 경우</li>
						<li> 범죄적 행위에 결부된다고 인정되는 경우</li>
						<li> 회사의 저작권, 제3자의, 저작권 등 기타 권리를 침해하는 내용인 경우</li>
						<li> 회원이 사이트와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우</li>
						<li> 회사로부터 사전 승인받지 아니한 상업광고, 판촉 내용을 게시하는 경우</li>
						<li> 해당 상품과 관련없는 내용인 경우</li>
						<li> 정당한 사유없이 ‘회사’또는 ‘업체’의 영업을 방해하는 내용을 기재하는 경우</li>
						<li> 자신의 업소를 홍보할 목적으로 직접 또는 제3자(리뷰대행업체 등)을 통하여 위법 부당한 방법으로 허위 또는 과장된 게시글을 게재하는 경우</li>
						<li> 허위주문 또는 주문취소 등 위법 부당한 방법으로 리뷰권한을 획득하여 ‘회원’또는 제3자의 계정을 이용하여 게시글을 게시하는 경우</li>
						<li> 의미없는 문자 및 부호에 해당하는 경우</li>
						<li> 제3자 등으로부터 권리침해신고가 접수된 경우</li>
						<li> 관계법령에 위반된다고 판단되는 경우</li>
						<li> 기타 회사의 서비스 약관, 운영정책 등 위반행위를 할 우려가 있거나 위반행위를 한 경우</li>
					</ol>
					<br>
				</ol>
				<h4>제 8 조 (회원 및 비회원 이용고객의 의무)</h4>
				<ol>
					<li> 회원 및 비회원 이용고객은 다음 행위를 하여서는 안 됩니다.</li>
					<br>
						<ol class="p1">
						<li> 회원정보에 허위 내용을 등록하는 행위</li>
						<li> 회사의 서비스에 게시된 정보를 변경하거나 서비스를 이용하여 얻은 정보를 회사의 사전 승낙 없이 영리 또는 비영리의 목적으로 복제, 출판, 방송 등에 사용하거나 제3자에게 제공하는 행위</li>
						<li> 회사 기타 제3자의 명예를 훼손하거나 지적재산권을 침해하는 등 회사나 제3자의 권리를 침해하는 행위</li>
						<li> 다른 회원의 회원 정보 또는 이용고객의 정보를 도용하여 부당하게 서비스를 이용한 경우</li>
						<li> 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지 ·화상·음성등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위</li>
						<li> 정보통신망이용촉진및정보보호등에관한법률 등 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)를 전송하거나 게시하는 행위</li>
						<li> 공공질서 또는 미풍양속에 위배되는 내용의 정보, 문장, 도형, 음성 등을 유포하는 행위 회사의 직원이나 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 모용하여 글을 게시하거나메시지를 발송하는 행위</li>
						<li> 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를게시하거나 전자우편, SMS로 발송하는 행위</li>
						<li> 스토킹(stalking) 등 다른 이용고객의 서비스 이용을 방해하는 행위</li>
						<li> 다른 이용고객의 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위</li>
						<li> 불특정 다수의 이용고객을 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송하는 등의 방법으로 회사에서 제공하는 서비스를 이용하여 영리목적의 활동을 하는 행위</li>
						<li> 현행 법령, 회사가 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위</li>
						</ol>
					<br>
					<li> 회사는 회원 또는 비회원 이용고객이 제1항의 행위를 하는 경우 서비스의 이용을 제한하거나 일방적으로 본 계약을 해지할 수 있습니다.</li>
					<li> 회사는 회원 자격을 제한 및 정지 시킨 후 같은 행위가 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우, 회사는 해당 회원에 대해 회원격을 상실시킬 수 있습니다.</li>
					<li> 회사가 회원자격을 상실시키는 경우 회원에게 이를 통지합니다. 한편, 회원자격 말소 전에 30일 이상의 기간을 정하여 반론하고 소명할 기회를 부여합니다.</li>
					<li> 회사는 사고 발생시 회원을 보호하기 위해 자동차손해배상보장법에 따라 자동차 종합 보험(대인배상, 대물배상, 자기신체사고)에 가입된 자동차를 제공합니다. 또한 회원의 손해를 줄이기 위해 자동차손해면책제도와 관련된 보험서비스(자차보험)를 제공합니다.</li>
				</ol>
				<h4>제 9 조(자동차 관리)</h4>
				<ol>
					<li> 회원은 이용하는 차량의 경고등을 브레이크 오일이나 자동차 내 기타 경고등을 항상 체크하며 주행해야 하며 필요 시 세차를 할 수 있습니다. 문제가 되는 상황이나 의심스러운 소음 등의 징후가 발견되는 경우회원은 즉시 고객센터로 연락해야 합니다.</li>
					<li> 운전 중 사고 발생 시 FFC 고객센터로 즉시 연락해야 합니다.</li>
					<li> 고객은 자동차 대여기간에 발생하는 법률 위반으로 인한 벌금과 과태료를 지불해야 할 의무가 있습니다.</li>
					<li> 고객은 예약 시 지불한 금액 외에 추가 요금을 지불할 수 있습니다. 추가 요금은 연장요금, 조기 배회차 요금, 야간 배회대여요금, 유료 주차장 주차비, 추가 옵션 요금 등에서 발생할 수 있습니다.</li>
				</ol>
				<h4>제 10 조(도로교통 관련 법률 위반)</h4>
				<ul>
					<li>고객은 차량 운전 중에 발생하는, 다음과 같은 도로교통 관련 법률 위반 및 법률 위반에 대해 책임을 져야 합니다.</li>
				</ul>
				<ol class="p1">
					<li> 10대 중과실 사고</li>
					<li> 사망사고 : 교통사고로 피해자가 현장 또는 치료 도중에 사망한 경우</li>
					<li> 건널목통과방법 위반 : 건널목 및 철길에서 일시 정지 및 안전 확인 등 주의 의무 위반</li>
					<li> 도주사고 : 사람을 치고 도주한 경우, 남의 재물에 손해를 입히고 도주한 경우</li>
					<li> 보행자 보호의무 위반 : 신호 등 유무를 불문하고 횡단보도에서 보행인을 친 사고(자전거 또는 이륜차를 끌고 가는 보행인 포함)</li>
					<li> 신호위반 :신호를 위반했거나 비보호좌회전, 수신호를 위반한 경우, 통행금지구역, 일방통행구역에서의 운전 등</li>
					<li> 무면허운전 : 무면허운전, 면허 정지 기간 중 운전, 적성검사미필 중 운전</li>
					<li> 중앙선침범 : 의도적 중앙선 침범 사고, 빗길과속 중앙선 침범 사고, 횡단보도에서 좌회전 중 반대방향 자동차와의 사고 등</li>
					<li> 음주 및 약물복용 운전</li>
					<li> 속도위반 : 규정속도의 초과 운전, 우천 시 감속하지 않은 경우</li>
					<li> 인도침범, 통행방법위반 : 인도침범사고, 도로 외의 곳에 출입하고자 보도를 횡단하던 중 발생한 사고</li>
					<li> 앞지르기 방법 및 금지 위반 : 커브길/병진시 앞지르기, 이중추월, 앞차의 우측으로 앞지르기, 2개차로 사이로 앞지르기</li>
					<li> 승객추락방지 의무 위반 : 승객 승하차 중 문을 닫지 않고 출발하던 중 사고</li>
					<li> 스쿨존 내 상해사고 : 어린이보호구역으로 지정된 구역에서 운행 중 발생한 어린이 상해 사고</li>
				</ol>
				<br>
				<h4>제 11 조 (회사의 의무)</h4>
				<ol>
					<li> 회사는 회사의 서비스 제공 및 보안과 관련된 설비를 지속적이고 안정적인 서비스 제공에 적합하도록 유지, 점검 또는 복구 등의 조치를 성실히 이행하여야 합니다.</li>
					<li> 회사는 이용 고객이 원하지 아니하는 영리 목적의 광고성 전자우편이나 SMS를 발송하지 않습니다.</li>
					<li> 회사는 서비스의 제공과 관련하여 알게 된 이용고객의 개인정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않고, 이를 보호하기 위하여 노력합니다. 회원의 개인정보보호에 관한 기타의 사항은 정보통신망이용촉진 및 정보보호등에 관한 법률 등 관계법령 및 회사가 별도로 정한 “개인정보취급방침”에 따릅니다.</li>
				</ol>
				<h4>제 12 조 (예약 신청)</h4>
				<ul>
					<li>회원은 FFC 앱과 웹 서비스에서 다음과 같은 방법으로 예약을 진행하게 됩니다. 회사는 회원이 예약신청할 때 다음과 같은 내용을 알기 쉽게 제공합니다.</li>
				</ul>
				<ol class="p1">
					<li> 이용	가능한 차량을 검색하고 선택하는 내용과 방법</li>
					<li> 대여약관, 비수기와 성수기에 대한 안내, 취소수수료에 관한 안내, 청약철회권이 제한되는 서비스, 대인/대물/자손 보상한도 및 자차보험료 등의 비용부담과 관련한 내용</li>
					<li> 고객 동의가 필요한 약관에 대해 안내하고 동의하거나 거부할 수 있게 선택하는 행위</li>
					<li> 차량 등의 예약신청에 대한 확인</li>
					<li> 결제 방법의 선택</li>
				</ol>
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