<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.footer{
	width:100%;
	height:196px;
	min-width:1800px;
	display:table;
    bottom:0;
}

a{
	text-decoration:none;
	color:#6c757d;
}
a:hover { color: black; text-decoration: underline; }
.test{
	width:1400px;
	height:40px;
	font-size:18px;
	font-weight:700;
	display:table-row;
	vertical-align:middle;
}
.teg{
	width:700px;
	height:40px;
	margin:0 auto;
	padding:0px;
	display:table;
}
.teg1{
	width:140px;
	height:30px;
	text-align:center;
	vertical-align:middle;
	display:table-cell;
}
.line{
	width:150px;
	border-bottom:1px solid black;
	margin:0 auto;
}
.con{
	width:70%;
	height:108px;
	font-size:12px;
	font-weight:700;
	color:#6c757d;
	padding:0 25px;
	margin:0 auto;
}
.area1{
	width:160px;
	height:100px;
	float:left;
	margin-left:40px;
}
.area2{
	display:table-cell;
	height:108px;
	padding-top:20px;
	padding-left:20px;
}
.line1{
	width:70%;
	height:25px;
	display:table-row;
}
.content{
	width:300px;
	height:25px;
	display:table-cell;
}
.content1{
	width:200px;
	height:25px;
	display:table-cell;
}
.content2{
	width:150px;
	height:25px;
	display:table-cell;
}

</style>
<body>
<div style="width:100px; height:70px;"></div>
<div class="footer">
	<div class="test">
		<ul class="teg">
				<li class="teg1"><p class="line"><a href="https://www.daegu.ac.kr/">회사소개</a></p></li>
				<li class="teg1"><p class="line"><a href="../main/policy-privacy.jsp">개인정보처리방침</a></p></li>
				<li class="teg1"><p class="line"><a href="../main/useService.jsp">서비스이용약관</a></p></li>
		</ul>
	</div>
		<div class="con">
			<div class="area1">
				<img src="../img/ffc.jpg" style="max-width:100%; max-height:100%;">
			</div>
			<div class="area2">
				<div class="line1">
					<div class="content">주소 : 경상북도 경산시 진량읍 대구대로 201</div>
					<div class="content1">상호명 : 파프리카 (FFC)</div>
					<div class="content1">사업번호 : 123-45-67890</div>
				</div>
				<div class="line1">
					<div class="content">통신판매업신고 : 경상북도 경산시 진량읍 내리리 146</div>
					<div class="content1">&nbsp;&nbsp;대표 : 몰러 </div>
				</div>
				<div class="content2">
					<div class="content1" style="width:200px;">
						TEL : 대표) 02-123-4567
					</div>
					<div class="content1">
						고객센터) 02-345-6789
					</div>
				</div>
			</div>
		</div>
</div>
</body>
</html>