<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
body{
	height:200%;
}
.rightCal_box{
	float:left;
}

.rightCal{
	width:320px;
	height:300px;
	margin-left:70px;
	
}

.rightCal .topTitle{
	font-size:14pt;
	font-weight:bold;
	text-align:center;
	margin-bottom:16px;
	
}

.rightCal a{
	color:black;
	padding:6px 13px 6.5px 13px;
}

.rightCal table{
	 width:310px;
	 border-collapse:collapse;
}

.rightCal td {
	padding:0px;
	margin:0px;
	border-collapse:collapse;
	text-align: center;
	
	width:45px;
	height:30px;
	font-size:11pt;
	border: 1px solid #bbbbbb;
}

.rightCal .prev{
	width:45px;
	height:30px;
	background-image:url('../img/btn_cal_prev.png');
	border:none;
}


.rightCal .next{
	width:45px;
	height:30px;
	background-image:url('../img/btn_cal_next.png');
	border:none;
}

.rightCal #RtbCalendarYM{
	font-size:11pt;
	color:#313131;
	border:none;
}

.rightCal .day{
	border-top: 2px solid #313131;
	color:#313131;
	font-size:11pt;
	font-weight:bold;
	
	
}

.showBox{
	margin-top:10px;
	width:314px;
	height:100px;
	background:#fdfdfd;
	border:1px solid #d5d5d5;
	margin-left:70px;
	margin-top:20px;
}

#RdateShow_box{
	text-align:center;
	width:254px;
	color:#f04040;
	height:40px;
	display:none;
	line-height:50px;
	margin-left:30px;
	font-size:12.7pt;
}

#Rtoday_box{
	text-align:center;
	width:254px;
	color:#f04040;
	height:40px;
	line-height:50px;
	margin-left:30px;
	font-size:12.7pt;
	
}

.rightCal select{
		border: 1px solid #cccccc; 
		width:125px;
		height:50px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		font-size:14px;
		padding-left:8px;
		
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	    -moz-appearance: none; 
	    appearance: none;
	    background: url("../img/liarrow2.jpg") no-repeat 95% 50%; /* 화살표 모양의 이미지 */ 
	    background-size: 35px;
	    outline:none;
	    float:left;
		
	}
	
.rightCal select::-ms-expand { display: none; } 


</style>
<script type="text/javascript">

	

	var Rtoday11 = new Date();
	var Rdate11 = new Date();
	
	var Rtoday = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();//today의 Date를 세어주는 역할

	function RprevCalendar() {//이전 달
		
		if(Rtoday.getFullYear() <= today.getFullYear() &&Rtoday.getMonth() <= today.getMonth()){
			return false;
		}else{
			Rtoday = new Date(Rtoday.getFullYear(), Rtoday.getMonth() - 1, Rtoday.getDate());
			RbuildCalendar();
		}
	
		
	}

	function RnextCalendar() {//다음 달
		Rtoday = new Date(Rtoday.getFullYear(), Rtoday.getMonth() + 1, Rtoday.getDate());
		RbuildCalendar();
	}
	
	

	function RbuildCalendar(a) {//현재 달 달력 만들기
		var showDate = a;
		
		var sd = $("#RdateShow_box").html();
		if(sd.length<11){
			var sdA = sd.split("/");
			var sdY = sdA[0];
			var sdM = sdA[1];
			var sdD = sdA[2];
			
			if(sdM.charAt(0)=="0"){
				sdM = sdM.replace("0","");
				
			}
			
			if(sdD.charAt(0)=="0"){
				sdD = sdD.replace("0","");
			}
			
			
			

		}
		
		
		var doMonth = new Date(Rtoday.getFullYear(), Rtoday.getMonth(), 1);
		var lastDate = new Date(Rtoday.getFullYear(), Rtoday.getMonth() + 1, 0);//이번 달의 마지막 날
		var tbCalendar = document.getElementById("Rcalendar");
		//날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
		var RtbCalendarYM = document.getElementById("RtbCalendarYM");
		//테이블에 정확한 날짜 찍는 변수
		//innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
		//new를 찍지 않아서 month는 +1을 더해줘야 한다. 

		RtbCalendarYM.innerHTML = Rtoday.getFullYear() + "년 "
				+ (Rtoday.getMonth() + 1) + "월";

		/*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
		while (tbCalendar.rows.length > 2) {
			//열을 지워줌
			//기본 열 크기는 body 부분에서 2로 고정되어 있다.
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
			//테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
			//30일 이후로 담을달에 순서대로 열이 계속 이어진다.
		}
		var row = null;
		row = tbCalendar.insertRow();
		//테이블에 새로운 열 삽입//즉, 초기화
		var cnt = 0;// count, 셀의 갯수를 세어주는 역할
		// 1일이 시작되는 칸을 맞추어 줌
		for (i = 0; i < doMonth.getDay(); i++) {
			/*이번달의 day만큼 돌림*/
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}
		/*달력 출력*/
		for (i = 1; i <= lastDate.getDate(); i++) {
			//1일부터 마지막 일까지 돌림
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML = 
				"<a href='javascript:RbuildCalendar(" 
						+i+ ");' class = 'Rd" + i + "'>" + i + "</a>";//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
			if (cnt % 7 == 1) {/*일요일 계산*/
				//1주일이 7일 이므로 일요일 구하기
				//월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
				cell.innerHTML = 
					"<a href='javascript:RbuildCalendar(" 
							+i+ ");' class = 'Rd" +i+ "'>" + i
						+ "</a>";
				//1번째의 cell에만 색칠
				
				$(".Rd"+i).css("color","#f04040");
			}
			if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
				//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
				cell.innerHTML = 
					"<a href='javascript:RbuildCalendar(" 
					+i+ ");' class = 'Rd" + i + "'>" + i
					+ "</a>";
				//7번째의 cell에만 색칠
				$(".Rd"+i).css("color","#0095e7");
				row = Rcalendar.insertRow();
				//토요일 다음에 올 셀을 추가
			}
			
			if(Rtoday.getFullYear()==sdY && (Rtoday.getMonth() + 1) == sdM && a== null){
				$(".Rd"+sdD).css("color","white");
				$(".Rd"+sdD).css("background","#f04040");
				
			}
			
		
			
			/*오늘의 날짜에 노란색 칠하기*/
			if (Rtoday.getFullYear() == date.getFullYear()
					&& Rtoday.getMonth() == date.getMonth()
					&& i < Rdate11.getDate()) {
				//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				
				cell.bgColor = "#f6f6f6";
				$(".Rd"+i).css("pointer-events","none");
				$(".Rd"+i).css("color","#cbcbcb");
			}
			
		
			var point1 = $("#dateShow_box").html();
			if(point1.length <11){
				var pointA = point1.split("/");
				var p = pointA[2];
				if(Rtoday.getFullYear() == today.getFullYear()
						&& Rtoday.getMonth() == today.getMonth() && i<p){
					cell.bgColor = "#f6f6f6";
					$(".Rd"+i).css("pointer-events","none");
					$(".Rd"+i).css("color","#cbcbcb");
					
				}
			}
			
			
			
			
		
			// && i>=Rdate11.getDate()
			if (i == a) {
				//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				cell.bgColor = "#f04040";//셀의 배경색을 노랑으로
				$(".Rd"+i).css("color","white");
			}
			
			
			var RdateShow_box = document.getElementById("RdateShow_box");
			
		
			var todayMonthtwo = (Rtoday11.getMonth()+1);
			var len2 = todayMonthtwo.toString().length;
			if(len2<2){
				todayMonthtwo = "0"+ todayMonthtwo;
			}
			

			Rtoday_box.innerHTML = Rtoday11.getFullYear() + "/" + todayMonthtwo
			+ "/" + Rdate11.getDate();
			
			
			var monthtwo = (Rtoday.getMonth()+1);
			var len = monthtwo.toString().length;
			if(len<2){
				monthtwo = "0"+ monthtwo;
			}
			
			
			
			if (a == null) {
				
			} else {
				$("#Rtoday_box").hide();
				$("#RdateShow_box").show();
				
				var datetwo = showDate;
				var len2 = datetwo.toString().length;
				if(len2<2){
					datetwo = "0"+ datetwo;
				}
				
				RdateShow_box.innerHTML = Rtoday.getFullYear() + "/" + monthtwo
						+ "/" + datetwo;
				
			}
			if($("#RdateShow_box").html() == "날짜를 선택해주세요."){
				if (Rtoday.getFullYear() == date.getFullYear()
		                 && Rtoday.getMonth() == date.getMonth()
		                 && i == date.getDate()) {
		                  //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
		                cell.bgColor = "#f04040";//셀의 배경색을 노랑으로 
		                $(".Rd"+i).css("color","white");
		                
		               }
				
			}
			
		
		}// 달력출력 끝 
		


	}
	
</script>


<body>

<div class = "rightCal_box">
	<div class = "rightCal">
	<div class = "topTitle">반납일시</div>
	
	
	<table id="Rcalendar" >
					<tr>
						<!-- label은 마우스로 클릭을 편하게 해줌 -->
						<td style = "border:none;"><label onclick="RprevCalendar()"><div class = "prev"></div></label></td>
						<td align="center" id="RtbCalendarYM" colspan="5">yyyy년 m월</td>
						<td style = "border:none;height:49px;"><label  onclick="RnextCalendar()"><div class = "next"></div></label></td>
					</tr>
					<tr>
						<td class = "day">일</td>
						<td class = "day">월</td>
						<td class = "day">화</td>
						<td class = "day">수</td>
						<td class = "day">목</td>
						<td class = "day">금</td>
						<td class = "day">토</td>
					</tr>
					
				</table>


				
				
	
	</div>
	
	<div class = "showBox">
					<div id="RdateShow_box">날짜를 선택해주세요.</div>
					<div id="Rtoday_box"></div>
					<select id = "Rhour_select" style = "margin-left:29px;">
					
						<%
							for(int i =0;i<24;i++){
								String a = "";
								if(i+"".length()<10){
									a = "0"+i;
								}else{
									a=i+"";
								}
								%>
								 
								<option value = "<%=a%>시"
								<%if (a.equals("10"))%>selected
								><%=a %>시</option>
								<%
							}
						%>
					
					</select>
					
						<select id = "Rmin_select" style = "margin-left:7px;">
						<%
							for(int i =0;i<=50;i=i+10){
								String a = "";
								if(i+"".length()<10){
									a = "0"+i;
								}else{
									a=i+"";
								}
								%>
								<option value = "<%=a%>분"><%=a %>분</option>
								<%
							}
						%>
					</select>
	</div>
	</div>
	
					
</body>
</html>

<script language="javascript" type="text/javascript">
	RbuildCalendar();
	
	
</script>
