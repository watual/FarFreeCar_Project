<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/dbCon.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String carno = request.getParameter("carno");
	String rentdate = request.getParameter("rentdate");
	String returndate = request.getParameter("returndate");
	String rentStoreName = request.getParameter("rentStoreName");
	String returnStoreName = request.getParameter("returnStoreName");
	System.out.println(carno);
	System.out.println(returnStoreName);
	String sql = "select * from carinfo where carno="+carno;
	System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String carnumber = rs.getString("carnumber");
	String sizeclass = rs.getString("sizeclass");
	String price = rs.getString("price");
	String oiltype = rs.getString("oiltype");
	String fueleff = rs.getString("fueleff");
	String residualoil = rs.getString("residualoil");
	String carname = rs.getString("carname");
	String brand = rs.getString("brand");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여신청 | FFC렌터카</title>
<link rel="stylesheet" href="../css/rentCheckStyle.css" type="text/css">
<link rel="stylesheet" href="../css/detailSearchStyle.css"
	type="text/css">
<link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png">
<link rel="stylesheet" href="../css/style2.css" type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/jquery-ui.js"></script>
</head>


<script>
/*---- 원단위 체크 -----*/
$(function(){
	var sale = $(".i_price").html();
	var sale2 = sale.replace(/[^0-9]/g,'');
	sale2 = Number(sale2);
	sale2 = sale2.toLocaleString();
	sale2 = sale2+"원";
	$(".i_price").html(sale2);

	
	
/*---- submit 유효성체크-----*/	
	$("#rentCheck_submit").click(function(){
		var i_agree1 = $("input:checkbox[id='i_agree1']").is(":checked");
		var i_agree2 = $("input:checkbox[id='i_agree2']").is(":checked");
		
		
		if(i_agree1 == false || i_agree2 == false){
			alert("예약완료를 위한 이용자 동의사항을 모두 동의해 주세요.");
			return false;
		}
		
		location= "clearRent.jsp";
	});
		
	

	
	
	
});




	
</script>




<body>
	<%@include file="../member/login2.jsp"%>
	<%@include file="../reserve/cal.jsp"%>
	<%@include file="../reserve/store.jsp"%>
	<header>
		<div class="header_container">
			<%@ include file="../include/header2.jsp"%>
		</div>
	</header>

<!-- ****************************  페이지 라인  ******************************************* -->
	<section>
		<div class="detailSearch_pageLine">
			<div class="mypageLine">
				<div class="route">
					<a href="../main/main2.jsp"> <img src="../img/main_img.png"
						style="width: 15px; height: 15px; margin-top: 3px; float: left;">
					</a> <img src="../img/arrow_img.png"
						style="width: 10px; height: 15px; margin: 3px 18px 0 18px; float: left;">


					<ul class="menu2">
						<li><input type="checkbox" id="menuBtn2"> <label
							for="menuBtn2" class="labelBtn2" onclick="">예약 <img
								class="labelBtn2"
								style="width: 15px; height: 15px; margin-top: 4px; margin-left: 10px; margin-right: 45px; float: right;"
								src="../img/liarrow.jpg">
						</label>
							<ul class="submenu2">
								<li><a href="#">간편예약</a></li>
								<li style="background: white;"><a href="#" style="color: #ff6767;">
								<b>상세예약</b>
								</li>
								<li><a href="../reserve/rentList.jsp">예약내역</a></li>
							</ul></li>
					</ul>

				</div>
			</div>


		</div>

		<div class="section_container">
			<!-- 내용을 쓰세영 ^_^ -->
			<div class="pageBack">
				<h2>상세 예약</h2>

				<div class="page_top">
					<div class="box">
						<div class="f_top">
							<font size="3pt"> 01</font>&nbsp;&nbsp;&nbsp;차량선택
						</div>
						<div class="f_cont-box"></div>
					</div>

					<div class="box" style="left: 260px;">
						<div class="left" style="border-bottom: 47px solid #f04040;"></div>
						<div class="middle" style="background: #f04040;">
							<font size="3pt">02</font>&nbsp;&nbsp;&nbsp;예약확인
						</div>
						<div class="right" style="border-bottom: 47px solid #f04040;"></div>
					</div>

					<div class="box" style="left: 570px;">
						<div class="left"></div>
						<div class="middle">
							<font size="3pt">03</font>&nbsp;&nbsp;&nbsp;결제
						</div>
						<div class="right"></div>
					</div>

					<div class="box" style="left: 880px;">
						<div class="left"></div>
						<div class="middle" style="border-radius: 0 0 0 15px;">
							<font size="3pt">04</font>&nbsp;&nbsp;&nbsp;예약완료
						</div>
					</div>

				</div>







<!-- ****************************  content 시작   ******************************************* -->

				<div class="info_left">

					<div class="car_info_top">
						<div class="car_name"><%=carname %></div>
						<img class="car_img" src="../img/car_sample1.png">
						<div class="explain">실제 대여하는 차량과 외관, 색상, 옵션 등에서 차이가 있을 수
							있습니다.</div>
					</div>
					<table>
						<colgroup>
							<col width="30%" />

						</colgroup>

						<tr class="underLine">
							<th class="tag">대여
							</td>
							<td><%=rentdate %><br> <%=rentStoreName %>
							</td>
						</tr>

						<tr class="underLine">
							<th class="tag">반납
							</td>
							<td><%=returndate %><br> <%=returnStoreName %>
							</td>
						</tr>

						<tr class="underLine">
							<th class="tag">가격
							</td>
							<td class="i_price"><%=price %>원</td>
						</tr>
					</table>
				</div>
				<!-- info_left -->




<!--  **************************** info_right ****************************************8 -->

				<div class="info_right">
					<div class="i_agree">
						<h3
							style="padding-bottom: 5px; border-bottom: 1px solid black; margin-block-end: 0.5em;">예약완료를
							위한 이용자 동의사항</h3>
						<table>
							<tr>
								<td><input type="checkbox" id="i_agree1"></td>
								<td class="agree_title">예약완료를 위한 이용 동의(필수)</td>
							</tr>
							<tr>
								<td colspan="2"><textarea readonly>제 1장(총칙)
대여자격
소/중형/7/9인승 승합차 - 만 21세 이상, 운전경력 1년 이상
10인승 이상 승합차 - 만 21세 이상, 운전경력 1년 이상
운전면허 적성검사 유효기간이 대여기간 內 남아있어야 대여가 가능함
제 2운전자 등록을 원하실 경우 차량 픽업시 운전면허증을 지참하시어 동행하신 경우에 한해 등록이 가능함
외국인일 경우 본인확인을 위한 여권 및 국제운전면허증 필수 지참
(차량운전자가 위의 대여자격조건에 맞지 않을 경우 현장에서 차량인수가 불가할 수도 있으니 필히 대여자격을 확인해 주시기 바랍니다.)
운전면허
운전면허증(차량인수시 필히 지참)
도로교통법상 유효한 운전면허소지자
외국인일 경우 국제운전면허증 소지자(B등급 이상 - 9인승 이하차량만 대여가능)
보험
전 차량 자동차 종합보험(대인,대물,자손)에 가입되어 있으며 자차손해 면책제도(CDW)는 선택 사항으로 차량인수시 해당지점에서 추가로 가입이 가능합니다.
결제 조건
대여요금 결제시에는 신용카드 결제(임차인 본인신용카드)를 우선하며, 현금결제시에는 신용 정보조회 후 이상이 없는 경우에만 차량대여가 가능합니다.
차량예약 후에도 신용정보조회시 불량거래 내역등이 있을 경우 현장에서 차량대여가 불가능 할 수도 있습니다.
신용정보조회는 고객님의 동의하에 가능하며, 신용정보조회시 고객님의 금용거래 등에 영향을 미칠 수 있습니다.
사전 연락없이 예약시간까지 지점에 방문하지 않으실 경우, 예약이 취소되며 1,000포인트가 차감됩니다.</textarea></td>
							</tr>
						</table>

					</div>

					
					
<!-- ******************************* agree2 ******************************** -->
					
					<div class="i_agree">
						<table>
							<tr>
								<td><input type="checkbox" id="i_agree2"></td>
								<td class="agree_title">차량 대여를 위한 개인정보 수집 / 이용 동의(필수)</td>
							</tr>
							<tr>
								<td colspan="2"><textarea readonly>개인정보의 수집 및 이용 목적
롯데렌터카는 렌터카 예약서비스 이용
개인정보 수집 항목
성명, 생년월일, 성별, 이메일주소, 휴대전화번호
개인정보 이용 및 보유 기간
이용자가 제공한 개인정보는 렌터카 서비스 이용 종료 후 5년간 회사가 보유 이용하게 됩니다.
동의 체크박스에 클릭할 경우, 개인정보 수집/이용 동의에 동의한 것으로 간주합니다.
동의를 거부할 권리가 있으나, 위 사항에 동의하지 않으실 경우 렌터카 대여가 불가능 할 수 있음을 알려드립니다.</textarea></td>
							</tr>
						</table>

					</div>



				</div>
				<!-- info_right -->

				<div class="button"
					style="width: 100%; height: 100px; float: left; text-align: center;">
					<button id="rentCheck_submit" type="button">예약하기</button>
				</div>





			</div>




		</div>
		<!-- section -->


	</section>


	<aside>
		<div class="aside_container">
			<!-- aside를 쓰세영 ^_^ -->
		</div>
	</aside>


	<footer>
		<div class="footer_container">
			<!-- footer를 쓰세영 ^_^ -->
		</div>
	</footer>

</body>
</html>









