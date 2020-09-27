<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file =  "../include/dbCon.jsp"%>
<%
String where = request.getParameter("where");
if(where == null){
	where = "";
}

// 대여일시: rentdate1, 반납일시: returndate1, 대여지점: rentStoreName, 반납지점: returnStoreName, 차량유형:carSize 

// 대여일시: 2020/12/30 (공백4개) 10시 00분 -> 2020/12/30 10:00
String rentdate = request.getParameter("rentdate");
String rentdate1 = rentdate.replace("&nbsp;&nbsp;&nbsp;&nbsp;"," ");
rentdate1 = rentdate1.replace("시&nbsp;",":");
rentdate1 = rentdate1.replace("분","");

// 반납일시: 2020/12/30 (공백4개) 10시 00분 -> 2020/12/30 10:00
String returndate = request.getParameter("returndate");
String returndate1 = returndate.replace("&nbsp;&nbsp;&nbsp;&nbsp;"," ");
returndate1 = returndate1.replace("시&nbsp;",":");
returndate1 = returndate1.replace("분","");

// 대여지점, 반납지점, 차량유형
String rentStoreName = request.getParameter("rentStoreName");
String returnStoreName = request.getParameter("returnStoreName");
String carSize = request.getParameter("carSize");
if(carSize == null) {
	carSize = "";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>대여신청 | FFC렌터카</title>
	<link rel="stylesheet" href="../css/detailSearchStyle.css" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
	<link rel="stylesheet" href="../css/style2.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
	<script src="../js/jquery-1.12.4.js"></script>
	<script src="../js/jquery-ui.js"></script>
</head>



<script>
$(function(){
	
	
	/*----------원단위 체크     ex) 10,000 ----------  */
	/*주의 !! 차량목록리스트뽑을때 while 문 돌릴때 같이 돌아가게 해야함 ! -> 아니면 첫번째 가격만 원단위 체크됨*/
	/*현재 클래스가 .p1 인 가격만 체크되게 해 놓았음 */
	var sale = $(".p1").html();
	var sale2 = sale.replace(/[^0-9]/g,'');
	sale2 = Number(sale2);
	sale2 = sale2.toLocaleString();
	sale2 = sale2+"원";
	$(".p1").html(sale2);
	
	
	/*--------- 재검색 버튼 누를 시  --------------------*/
	$("#detailRentBtn").click(function(){
		var where = "";
		var andplz = 0;
		var orplz = 0;
		alert("1");
		if(($("#myc-1").is(":checked") == true) || ($("#myc-2").is(":checked") == true) || ($("#myc-3").is(":checked") == true) ) {
			where += "(";
		}
		if($("#myc-1").is(":checked") == true) {
			where += "brand='현대'";
			orplz = 1;
		}
		if($("#myc-2").is(":checked") == true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "brand='기아'";
			orplz = 1;
		}
		alert("222222222222222");
		if($("#myc-3").is(":checked") == true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "brand='쉐보레'";
		}
		if(($("#myc-1").is(":checked") == true)||($("#myc-2").is(":checked") == true)||($("#myc-3").is(":checked") == true)) {
			where += ")";
			andplz = 1;
			orplz = 0;
		}
		if(($("#myo-1").is(":checked") == true)||($("#myo-2").is(":checked") == true)||($("#myo-3").is(":checked") == true)) {
			if(andplz == 1) {
				where += " and ";
			}
			where += "(";
		}
		if($("#myo-1").is(":checked")==true) {
			where += "oiltype='경유'";
			orplz = 1;
		}
		if($("#myo-2").is(":checked")==true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "oiltype='휘발유'";
			orplz = 1;
		}
		if($("#myo-3").is(":checked")==true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "oiltype='LPG'";
		}
		if(($("#myo-1").is(":checked") == true)||($("#myo-2").is(":checked") == true)||($("#myo-3").is(":checked") == true)) {
			where += ")";
			orplz = 0;
		}

		alert("33333333333333333");
		if(($("#myw-1").is(":checked") == true)||($("#myw-2").is(":checked") == true)||($("#myw-3").is(":checked") == true)||($("#myw-4").is(":checked") == true)||($("#myw-5").is(":checked") == true)||($("#myw-6").is(":checked") == true)) {
			if(andplz == 1) {
				where += " and ";
			}
			where += "(";
		}
		if($("#myw-1").is(":checked")==true) {
			where += "sizeclass='경차'";
			orplz = 1;
		}
		if($("#myw-2").is(":checked")==true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "sizeclass='소형차'";
			orplz = 1;
		}
		if($("#myw-3").is(":checked")==true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "sizeclass='준중형차'";
			orplz = 1;
		}
		if($("#myw-4").is(":checked")==true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "sizeclass='중형차'";
			orplz = 1;
		}
		if($("#myw-5").is(":checked")==true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "sizeclass='준대형차'";
			orplz = 1;
		}
		if($("#myw-6").is(":checked")==true) {
			if(orplz == 1) {
				where += " or ";
			}
			where += "sizeclass='대형차'";
			orplz = 0;
		}
		if(($("#myw-1").is(":checked") == true)||($("#myw-2").is(":checked") == true)||($("#myw-3").is(":checked") == true)||($("#myw-4").is(":checked") == true)||($("#myw-5").is(":checked") == true)||($("#myw-6").is(":checked") == true)) {
			where += ")";
			
		}

		alert("44444444444444444444444");
		
		
		$("#where").val(where);
		var rentdate = $("#startD").html();
		$("#rentdate").val(rentdate);

		var returndate = $("#endD").html();
		$("#returndate").val(returndate);
		
		var rentStore = $("#rentStore").html();
		$("#rentStoreName").val(rentStore);
		
		var returnStore = $("#returnStore").html();
		$("#returnStoreName").val(returnStore);
		$("#frm2").submit();
	});
	
	$(".a").click(function(){
			alert("a");
	});
	
});



function fn_rent(carno){
	location = "rentCheck.jsp?carno='"+carno+"'&rentdate='"+$("#rentdate").html()+"'&returndate='"+$("#returndate").html()+"'&rentStoreName='"+$("#rentStoreName").html()+"'&returnStoreName='"+$("#returnStoreName").html()+"'";
}
	
$(function() {
	
});

	
</script>


	
	

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
<div class = "detailSearch_pageLine">
	<div class ="mypageLine">
		<div class = "route">
		<a href = "../main/main2.jsp">
			<img src = "../img/main_img.png" style= "width:15px; height:15px;margin-top:3px;float:left;">
		</a>
		<img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
		
		
		 <ul class="menu2">
        <li>
            <input type="checkbox" id="menuBtn2">
            <label for="menuBtn2" class="labelBtn2" onclick="">예약
            	<img class="labelBtn2" style = "width:15px; height:15px;margin-top:4px;margin-left:10px;margin-right:45px;float:right;" src = "../img/liarrow.jpg">
            </label>
            <ul class="submenu2">
            	<li><a href="#">간편예약</a></li>
                <li style = "background:white;"><a href="#" style = "color:#ff6767;"><b>상세예약</b></li>
                <li><a href="../reserve/rentList.jsp">예약내역</a></li>
            </ul>
        </li>
    </ul>
		
		</div>
	</div>
	
	
</div>
	
<div class = "section_container">
	<!-- 내용을 쓰세영 ^_^ -->
	<div class ="detailRent pageBack" >
	<h2>상세 예약</h2>	 
<div class ="detail_top">
	<div class="box">
		<div class = "f_top"><font size="3pt">
			01</font>&nbsp;&nbsp;&nbsp;차량선택
		</div>
		<div class = "f_cont-box"></div>
	</div>
	
	<div class="box" style = "left:260px;">
		<div class = "left"></div>
		<div class = "middle">
			<font size="3pt">02</font>&nbsp;&nbsp;&nbsp;예약확인
		</div>
		<div class = "right"></div>
	</div>
	
	<div class="box" style = "left:570px;">
		<div class = "left"></div>
		<div class = "middle">
				<font size="3pt">03</font>&nbsp;&nbsp;&nbsp;결제
		</div>
		<div class = "right"></div>
	</div>
	
	<div class="box" style = "left:880px;">
		<div class = "left"></div>
		<div class = "middle" style = "border-radius: 0 0 0 15px;">
				<font size="3pt">04</font>&nbsp;&nbsp;&nbsp;예약완료
		</div>
	</div>
	

</div>



<!-- 									sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss -->








<style>
     .left_box .subtitle_box{
      		margin-top:25px;
      }
      
       .left_box .subtitle{
      	font-size:11.5pt;
      	font-weight:bold;
      	margin-bottom:8px;
      }
      




.c-1 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.c-1-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.c-1-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.c-1-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.c-1-inner:before, .c-1-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.c-1-inner:before {
    content: "현대";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.c-1-inner:after {
    content: "현대";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.c-1-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.c-1-checkbox:checked + .c-1-label .c-1-inner {
    margin-left: 0;
}
.c-1-checkbox:checked + .c-1-label .c-1-switch {
    right: 0px; 
}
</style>



<style>
.c-2 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.c-2-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.c-2-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.c-2-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.c-2-inner:before, .c-2-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.c-2-inner:before {
    content: "기아";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.c-2-inner:after {
    content: "기아";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.c-2-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.c-2-checkbox:checked + .c-2-label .c-2-inner {
    margin-left: 0;
}
.c-2-checkbox:checked + .c-2-label .c-2-switch {
    right: 0px; 
}
</style>

<style>
.c-3 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.c-3-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.c-3-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.c-3-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.c-3-inner:before, .c-3-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.c-3-inner:before {
    content: "쉐보레";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.c-3-inner:after {
    content: "쉐보레";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.c-3-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.c-3-checkbox:checked + .c-3-label .c-3-inner {
    margin-left: 0;
}
.c-3-checkbox:checked + .c-3-label .c-3-switch {
    right: 0px; 
}
</style>

<!-- 																c----------------------------------------ccccccccccccccccccccccccccccccccccccccccccccccc -->
<style>
.o-1 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.o-1-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.o-1-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.o-1-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.o-1-inner:before, .o-1-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.o-1-inner:before {
    content: "경유";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.o-1-inner:after {
    content: "경유";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.o-1-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.o-1-checkbox:checked + .o-1-label .o-1-inner {
    margin-left: 0;
}
.o-1-checkbox:checked + .o-1-label .o-1-switch {
    right: 0px; 
}
</style>

<style>
.o-2 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.o-2-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.o-2-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.o-2-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.o-2-inner:before, .o-2-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.o-2-inner:before {
    content: "휘발유";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.o-2-inner:after {
    content: "휘발유";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.o-2-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.o-2-checkbox:checked + .o-2-label .o-2-inner {
    margin-left: 0;
}
.o-2-checkbox:checked + .o-2-label .o-2-switch {
    right: 0px; 
}
</style>

<style>
.o-3 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.o-3-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.o-3-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.o-3-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.o-3-inner:before, .o-3-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.o-3-inner:before {
    content: "LPG";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.o-3-inner:after {
    content: "LPG";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.o-3-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.o-3-checkbox:checked + .o-3-label .o-3-inner {
    margin-left: 0;
}
.o-3-checkbox:checked + .o-3-label .o-3-switch {
    right: 0px; 
}
</style>
<!-- 																oil----------------------------------------------------oil -->
<style>
.w-1 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.w-1-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.w-1-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.w-1-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.w-1-inner:before, .w-1-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.w-1-inner:before {
    content: "경차";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.w-1-inner:after {
    content: "경차";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.w-1-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.w-1-checkbox:checked + .w-1-label .w-1-inner {
    margin-left: 0;
}
.w-1-checkbox:checked + .w-1-label .w-1-switch {
    right: 0px; 
}
</style>

<style>
.w-2 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.w-2-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.w-2-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.w-2-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.w-2-inner:before, .w-2-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.w-2-inner:before {
    content: "소형차";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.w-2-inner:after {
    content: "소형차";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.w-2-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.w-2-checkbox:checked + .w-2-label .w-2-inner {
    margin-left: 0;
}
.w-2-checkbox:checked + .w-2-label .w-2-switch {
    right: 0px; 
}
</style>

<style>
.w-3 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.w-3-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.w-3-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.w-3-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.w-3-inner:before, .w-3-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 13px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.w-3-inner:before {
    content: "준중형차";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.w-3-inner:after {
    content: "준중형차";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.w-3-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.w-3-checkbox:checked + .w-3-label .w-3-inner {
    margin-left: 0;
}
.w-3-checkbox:checked + .w-3-label .w-3-switch {
    right: 0px; 
}
</style><style>
.w-4 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.w-4-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.w-4-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.w-4-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.w-4-inner:before, .w-4-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.w-4-inner:before {
    content: "중형차";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.w-4-inner:after {
    content: "중형차";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.w-4-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.w-4-checkbox:checked + .w-4-label .w-4-inner {
    margin-left: 0;
}
.w-4-checkbox:checked + .w-4-label .w-4-switch {
    right: 0px; 
}
</style><style>
.w-5 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.w-5-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.w-5-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.w-5-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.w-5-inner:before, .w-5-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 13px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.w-5-inner:before {
    content: "준대형차";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.w-5-inner:after {
    content: "준대형차";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.w-5-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.w-5-checkbox:checked + .w-5-label .w-5-inner {
    margin-left: 0;
}
.w-5-checkbox:checked + .w-5-label .w-5-switch {
    right: 0px; 
}
</style><style>
.w-6 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.w-6-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.w-6-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.w-6-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.w-6-inner:before, .w-6-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.w-6-inner:before {
    content: "대형차";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.w-6-inner:after {
    content: "대형차";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.w-6-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.w-6-checkbox:checked + .w-6-label .w-6-inner {
    margin-left: 0;
}
.w-6-checkbox:checked + .w-6-label .w-6-switch {
    right: 0px; 
}
</style>






<!--                                              wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww -->

<style>
.p-1 {
    position: relative; width: 185px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.p-1-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.p-1-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.p-1-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.p-1-inner:before, .p-1-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 10px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.p-1-inner:before {
    content: "7,000원 미만";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.p-1-inner:after {
    content: "7,000원 미만";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.p-1-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 151px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.p-1-checkbox:checked + .p-1-label .p-1-inner {
    margin-left: 0;
}
.p-1-checkbox:checked + .p-1-label .p-1-switch {
    right: 0px; 
}
</style>

<style>
.p-2 {
    position: relative; width: 185px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.p-2-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.p-2-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.p-2-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.p-2-inner:before, .p-2-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 10px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.p-2-inner:before {
    content: "7,000원 이상 8,000원 미만";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.p-2-inner:after {
    content: "7,000원 이상 8,000원 미만";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.p-2-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 151px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.p-2-checkbox:checked + .p-2-label .p-2-inner {
    margin-left: 0;
}
.p-2-checkbox:checked + .p-2-label .p-2-switch {
    right: 0px; 
}
</style>

<style>
.p-3 {
    position: relative; width: 185px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.p-3-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.p-3-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.p-3-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.p-3-inner:before, .p-3-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 10px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.p-3-inner:before {
    content: "8,000원 이상 9,000원 미만";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.p-3-inner:after {
    content: "8,000원 이상 9,000원 미만";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.p-3-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 151px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.p-3-checkbox:checked + .p-3-label .p-3-inner {
    margin-left: 0;
}
.p-3-checkbox:checked + .p-3-label .p-3-switch {
    right: 0px; 
}
</style><style>
.p-4 {
    position: relative; width: 185px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.p-4-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.p-4-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.p-4-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.p-4-inner:before, .p-4-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 10px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.p-4-inner:before {
    content: "9,000원 이상 10,000원 미만";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.p-4-inner:after {
    content: "9,000원 이상 10,000원 미만";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.p-4-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 151px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.p-4-checkbox:checked + .p-4-label .p-4-inner {
    margin-left: 0;
}
.p-4-checkbox:checked + .p-4-label .p-4-switch {
    right: 0px; 
}
</style><style>
.p-5 {
    position: relative; width: 185px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.p-5-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.p-5-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.p-5-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.p-5-inner:before, .p-5-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 10px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.p-5-inner:before {
    content: "10,000원 이상 ";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.p-5-inner:after {
    content: "10,000원 이상 ";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.p-5-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 151px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.p-5-checkbox:checked + .p-5-label .p-5-inner {
    margin-left: 0;
}
.p-5-checkbox:checked + .p-5-label .p-5-switch {
    right: 0px; 
}
</style>

<style>
.p-6 {
    position: relative; width: 185px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.p-6-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.p-6-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.p-6-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.p-6-inner:before, .p-6-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 10px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.p-6-inner:before {
    content: "11,000원 이상";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.p-6-inner:after {
    content: "11,000원 이상";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.p-6-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 151px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.p-6-checkbox:checked + .p-6-label .p-6-inner {
    margin-left: 0;
}
.p-6-checkbox:checked + .p-6-label .p-6-switch {
    right: 0px; 
}
</style>










<!--  ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp -->

<style>
.a-1 {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.a-1-checkbox {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}
.a-1-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.a-1-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.a-1-inner:before, .a-1-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.a-1-inner:before {
    content: "전체선택";
    padding-left: 10px;
    background-color: #f04040; color: #FFFFFF;
}
.a-1-inner:after {
    content: "전체선택";
    padding-right: 10px;
    background-color: #EEEEEE; color: #999999;
    text-align: right;
}
.a-1-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.a-1-checkbox:checked + .a-1-label .a-1-inner {
    margin-left: 0;
}
.a-1-checkbox:checked + .a-1-label .a-1-switch {
    right: 0px; 
}
</style>

<!-- everyeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee -->

<style>

.fuck {
	background:linear-gradient(to bottom, ##f04040 5%, ##f04040 100%);
	background-color:#eeeeee;
	border-radius:6px;
	border:2px solid #999999;
	display:inline-block;
	cursor:pointer;
	color:#999999;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	
}
.fuck:hover {
	background:#f04040;
	background-color:#f04040;
	color:white;
}
.fuck:active {
	position:relative;
	top:1px;
}





</style>




<!--  everyeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee -->







<form name="frm_check"  method="checkbox" action="">


<table border="0">

	<tr>
		<th style="font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif; width:77px;">
		차량 브랜드
		</th>
		
		<td width="80">
	<div class="c-1">
	    <input type="checkbox" name="c-1" class="c-1-checkbox" id="myc-1" tabindex="0">
	    <label class="c-1-label" for="myc-1">
	        <span class="c-1-inner"></span>
	        <span class="c-1-switch"></span>
	    </label>
	</div>
		</td>
		
		<td>
	<div class="c-2">
	    <input type="checkbox" name="c-2" class="c-2-checkbox" id="myc-2" tabindex="0">
	    <label class="c-2-label" for="myc-2">
	        <span class="c-2-inner"></span>
	        <span class="c-2-switch"></span>
	    </label>
	</div>
		</td>
		
		<td>
	<div class="c-3">
	    <input type="checkbox" name="c-3" class="c-3-checkbox" id="myc-3" tabindex="0">
	    <label class="c-3-label" for="myc-3">
	        <span class="c-3-inner"></span>
	        <span class="c-3-switch"></span>
	    </label>
	</div>
		</td>	
		
		
	</tr>



	
	<tr>
			<th style="font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;">
		기름 종류
		</th>
		
		<td width="80">
	<div class="o-1">
	    <input type="checkbox" name="o-1" class="o-1-checkbox" id="myo-1" tabindex="0">
	    <label class="o-1-label" for="myo-1">
	        <span class="o-1-inner"></span>
	        <span class="o-1-switch"></span>
	    </label>
	</div>
		</td>
		
		<td>
	<div class="o-2">
	    <input type="checkbox" name="o-2" class="o-2-checkbox" id="myo-2" tabindex="0">
	    <label class="o-2-label" for="myo-2">
	        <span class="o-2-inner"></span>
	        <span class="o-2-switch"></span>
	    </label>
	</div>
		</td>
		
		<td>
	<div class="o-3">
	    <input type="checkbox" name="o-2" class="o-3-checkbox" id="myo-3" tabindex="0">
	    <label class="o-3-label" for="myo-3">
	        <span class="o-3-inner"></span>
	        <span class="o-3-switch"></span>
	    </label>
	</div>
		</td>	
		
		
	</tr>
	
	<tr>
			<th style="font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;">
		차량 유형
		</th>
		
		<td width="80">
	<div class="w-1">
	    <input type="checkbox" name="w-1" class="w-1-checkbox" id="myw-1" tabindex="0">
	    <label class="w-1-label" for="myw-1">
	        <span class="w-1-inner"></span>
	        <span class="w-1-switch"></span>
	    </label>
	</div>
		</td>
		
		<td>
	<div class="w-2">
	    <input type="checkbox" name="w-2" class="w-2-checkbox" id="myw-2" tabindex="0">
	    <label class="w-2-label" for="myw-2">
	        <span class="w-2-inner"></span>
	        <span class="w-2-switch"></span>
	    </label>
	</div>
		</td>
		
		<td>
	<div class="w-3">
	    <input type="checkbox" name="w-2" class="w-3-checkbox" id="myw-3" tabindex="0">
	    <label class="w-3-label" for="myw-3">
	        <span class="w-3-inner"></span>
	        <span class="w-3-switch"></span>
	    </label>
	</div>
		</td>	
		
			<td>
	<div class="w-4">
	    <input type="checkbox" name="w-4" class="w-4-checkbox" id="myw-4" tabindex="0">
	    <label class="w-4-label" for="myw-4">
	        <span class="w-4-inner"></span>
	        <span class="w-4-switch"></span>
	    </label>
	</div>
		</td>
		
		<td>
	<div class="w-5">
	    <input type="checkbox" name="w-5" class="w-5-checkbox" id="myw-5" tabindex="0">
	    <label class="w-5-label" for="myw-5">
	        <span class="w-5-inner"></span>
	        <span class="w-5-switch"></span>
	    </label>
	</div>
		</td>
		
		<td>
	<div class="w-6">
	    <input type="checkbox" name="w-6" class="w-6-checkbox" id="myw-6" tabindex="0">
	    <label class="w-6-label" for="myw-6">
	        <span class="w-6-inner"></span>
	        <span class="w-6-switch"></span>
	    </label>
	</div>
		</td>	
	</tr>	
	

	
		<tr>
			<th style="font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;">
		가격 범위<br>(시간당)
		</th>
		
		<td colspan="2">
	<div class="p-1">
	    <input type="checkbox" name="p-1" class="p-1-checkbox" id="myp-1" tabindex="0">
	    <label class="p-1-label" for="myp-1">
	        <span class="p-1-inner"></span>
	        <span class="p-1-switch"></span>
	    </label>
	</div>
		</td>
		
		<td colspan="2">
	<div class="p-2">
	    <input type="checkbox" name="p-2" class="p-2-checkbox" id="myp-2" tabindex="0">
	    <label class="p-2-label" for="myp-2">
	        <span class="p-2-inner"></span>
	        <span class="p-2-switch"></span>
	    </label>
	</div>
		</td>
		
		<td colspan="2">
	<div class="p-3">
	    <input type="checkbox" name="p-2" class="p-3-checkbox" id="myp-3" tabindex="0">
	    <label class="p-3-label" for="myp-3">
	        <span class="p-3-inner"></span>
	        <span class="p-3-switch"></span>
	    </label>
	</div>
		</td>	
		
			<td colspan="2">
	<div class="p-4">
	    <input type="checkbox" name="p-4" class="p-4-checkbox" id="myp-4" tabindex="0">
	    <label class="p-4-label" for="myp-4">
	        <span class="p-4-inner"></span>
	        <span class="p-4-switch"></span>
	    </label>
	</div>
		</td>
		
		<td colspan="2">
	<div class="p-5">
	    <input type="checkbox" name="p-5" class="p-5-checkbox" id="myp-5" tabindex="0">
	    <label class="p-5-label" for="myp-5">
	        <span class="p-5-inner"></span>
	        <span class="p-5-switch"></span>
	    </label>
	</div>
		</td>
		
	
		
		
		
	</tr>	
	
	
	
	

	<tr>
			<th style="font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;">
		직접입력
		</th>
		
		<td width="80" colspan="12" style="font-size:13px; font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;">
<input type="text" title="최소가격 입력" value=""/ >원</span>
<span class="filter_range_at__2lrFq">~</span>
<span class="filter_range_input__2pQ5b">
<input type="text" value="" title="최대가격 입력"/>원</span>
<button type="button" class="fuck">가격대 검색</button>
		</td>
		
		
	</tr>	

	
	
	
	
	
	
	
	
	
	
	
	
	
</table>





</form>



<!-- eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee-->



<div class = "detailRent_left">

<div class = "subtitle_box">
				<div class ="subtitle">기간 선택</div>
				<div>
					<a href = "javascript:callCal();">
						<div class = "box rent" id = "startD"><%=rentdate %></div>
					</a>
					
					<a href = "javascript:callCal();">
						<div class = "box rent" id = "endD" style = "margin-left:215px"><%=returndate %></div>
					</a>
					
					<div style = "width:100px;height:58px"></div>
					<h7>▪ &nbsp;대여시간이 24시간 이상인 경우에만 할인이 적용됩니다.</h7>				
				</div>
			</div>
			
			
			<div class = "subtitle_box">
				<div class ="subtitle">지점선택</div>
				<div>
					<a href = "javascript:callStore();">
						<div class = "box rent" id = "rentStore"><%=rentStoreName %></div>
					</a>
					
					<a href = "javascript:callStore();">
						<div class = "box rent" id = "returnStore" style = "margin-left:215px"><%=returnStoreName %></div>
					</a>
					
					<div style = "width:100px;height:58px"></div>
					<h7>▪ &nbsp;대여지점과 다른 지점으로 반납하실 경우 별도의 수수료가 부과됩니다.</h7>				
				</div>
			</div>
			
			<div class = "subtitle_box">
				
				
			<form id = "frm2" name = "frm2" method = "post" action = "../reserve/detailSearch.jsp">
				
				<input type ="hidden" id = "rentdate" name = "rentdate" value = "">
				<input type ="hidden" id = "returndate" name = "returndate" value = "">
				
				<input type ="hidden" id = "rentStoreName" name = "rentStoreName" value = "">
				<input type ="hidden" id = "returnStoreName" name = "returnStoreName" value = "">
				<input type="hidden" id="where" name="where" value="">
				<button id="detailRentBtn" type ="button">재검색</button>
			</form>
			
			</div>
</div>





<div class = "detailRent_right">
	

	<div class ="result">결과</div>
	
	<div class = "box_scroll">
		
		<%
		String sql = "select * from carinfo";
		if(carSize != "") {
			System.out.println(carSize);
			if(carSize.equals("1")){
				sql += " where sizeclass='경차'";
			} else if(carSize.equals("2")) {
				sql += " where sizeclass='소형차'";
			} else if(carSize.equals("3")) {
				sql += " where sizeclass='중형차'";
			} else if(carSize.equals("4")) {
				sql += " where sizeclass='준대형차'";
			} else if(carSize.equals("5")) {
				sql += " where sizeclass='대형차'";
			} else if(carSize.equals("6")) {
				sql += " where sizeclass='승합차'";
			} else if(carSize.equals("7")) {
				sql += " where sizeclass='SUV' or sizeclass='RV'";
			} else if(carSize.equals("8")) {
				sql += " where sizeclass='전기차'";
			} else if(carSize.equals("9")) {
				sql += " where sizeclass='수입차'";
			}
		}
		if(where != ""){
			sql+=" where ";
		}
		System.out.println(sql+where);
		ResultSet rs = stmt.executeQuery(sql+where);
		
		while(rs.next()) {
			String carname = rs.getString("carname");
			String carno = rs.getString("carno");
			String sizeclass = rs.getString("sizeclass");
			String price = rs.getString("price");
			String oiltype = rs.getString("oiltype");
			String fueleff  = rs.getString("fueleff");
			String residualOil  = rs.getString("residualOil");
			String brand  = rs.getString("brand");
			%>
			<div class ="car_list">
			<img class = "car_img" src = ""></img> <!-- *** 차 이미지 *** -->
			<div class = "car_list_right1">
				<div class = "carname"><%=carname %></div> <!-- *** 차 이름 *** -->
				<div class = "price p1"><%=price %></div> <!-- *** 가격 *** -->
			</div>
				
			<div class = "inner_div"></div> <!-- 여백div -->
			&nbsp;&nbsp;&nbsp;&nbsp;<%=sizeclass %>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=oiltype %>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=fueleff %>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=residualOil %>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=brand %>
			<img class = "fuel_img" src = "../img/ico_lpg_new.png"></img> <!-- *** 기름종류 *** -->
			
			<div class = "inner_div"></div> <!-- 여백div -->
			
			<!-- 예약버튼 임시로 onclick으로 해놨음 바꿔도 상관 x -->  <!-- 매개변수 값 임시로 1넣어둠 -->
			<button type = "button" onclick = "fn_rent(<%=carno%>)">예약</button>
		</div>
			
			
			
			<%
		}
		%>
	</div>

</div>





</div>
</div>








</section>


 
<footer>
		<div class = "footer_container">
			<%@include file="../include/footer.jsp" %>
	</div>
</footer>
 
</body>
</html>









