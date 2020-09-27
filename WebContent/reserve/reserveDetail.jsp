<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="description" content="rentcar reserving system">
		<meta name="keywords" content="rentcar, reserve, car rent, reserve rentcar, rentcar reserving">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="../css/style.css" type="text/css"><link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Single+Day&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	</head>
	<script>
	$(function() {
		$(document).keydown(function(key) {
			if(key.keyCode == 13) {
				event.preventDefault();
				//포커싱 위치에 따라 엔터가 다르게 작용
				if( $("#frmTag [name]").is(":focus") == true ) {
					var s_data = "s_data=";
					
					if( $("#frmTag [name='brand']:checked").length > 0 ){
						s_data += "(";
						$("#frmTag [name='brand']:checked").each(function() {
							s_data += "brand='" + $(this).val() + "' or ";
						})
						s_data = s_data.substring(0, (s_data.length-4) );
						s_data += ")";
					}
					if( $("#frmTag [name='sizeclass']:checked").length > 0 ){
						if( s_data.length > 7 ){
							s_data += " and ";
						}
						s_data += "(";
						$("#frmTag [name='sizeclass']:checked").each(function() {
							s_data += "sizeclass='" + $(this).val() + "' or ";
						})
						s_data = s_data.substring(0, (s_data.length-4) );
						s_data += ")";
					}
					if( $("#frmTag [name='oiltype']:checked").length > 0 ){
						if( s_data.length > 7 ){
							s_data += " and ";
						}
						s_data += "(";
						$("#frmTag [name='oiltype']:checked").each(function() {
							s_data += "oiltype='" + $(this).val() + "' or ";
						})
						s_data = s_data.substring(0, (s_data.length-4) );
						s_data += ")";
					}
					
					
					alert(s_data);
					$.ajax({
						type: "POST",
						url: "reserveSearch.jsp",
						dataType: "html",
						data: s_data,
						success: function(data) {
							$("#tagResult").html(data);
						},
						error: function() {
							alert("error~");
						}
					});
					return false;
				}
			}
		});
	});
	</script>
	<body class="mainbody">
		<header>
			<%@ include file="../include/header2.jsp" %>
		</header>
		<section>
			<div class="reserveDetail">
				<div class="container">
					<div class="tag">
					<form id="frmTag">
						<div class="car_brand">
							<div class="car_brand_title">
								브랜드
							</div>
							<div class="car_brand_tag">
								<input type="checkbox" name="brand" value="기아">기아 
								<input type="checkbox" name="brand" value="현대">현대 
								<input type="checkbox" name="brand" value="아우디">아우디 
								<input type="checkbox" name="brand" value="쉐보레">쉐보레 
							</div>
						</div>
						<div class="car_sizeclass">
							<div class="car_sizeclass_title">
								차종
							</div>
							<div class="car_sizeclass_tag">
								<input type="checkbox" name="sizeclass" value="소형차">소형차
								<input type="checkbox" name="sizeclass" value="준중형차">준중형차
								<input type="checkbox" name="sizeclass" value="중형차">중형차
								<input type="checkbox" name="sizeclass" value="대형차">대형차
							</div>
						</div>
						<div class="car_oiltype">
							<div class="car_oiltype_title">
								유종
							</div>
							<div class="car_oiltype_tag">
								<input type="checkbox" name=oiltype value="휘발유">휘발유 
								<input type="checkbox" name=oiltype value="경유">경유 
							</div>
						</div>
						<div class="car_residualOil">
							<div class="car_residualOil_title">
								연비
							</div>
							<div class="car_residualOil_tag">
								<input type="range" name="range">
							</div>
						</div>
						<div class="car_store">
							<div class="car_store_title">
								위치
							</div>
							<div class="car_store_tag">
								<input type="text" name="store">
							</div>
							
						</div>
						<div class="car_price">
							<div class="car_price_title">
								가격
							</div>
						</div>
					</form>
					</div>
					<div id="tagResult">
					</div>
				</div>
			</div>
		</section>
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<footer>
			<%@ include file="../include/footer.jsp" %>
		</footer>
	</body>
</html>