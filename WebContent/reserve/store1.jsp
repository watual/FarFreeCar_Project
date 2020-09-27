<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>store1</title>
</head>

<style>
body{
	height:200%;
}
.leftStore_box{
	float:left;
}

.leftStore{
	width:460px;
	height:300px;
	margin-left:10px;
	
}

.leftStore .topTitle{
	font-size:14pt;
	font-weight:bold;
	text-align:center;
	margin-bottom:16px;	
}

.leftStore_box select{
		border: 1px solid #cccccc; 
		width:452px;
		height:50px;
		font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
		font-size:14px;
		color:#646464;
		padding-left:20px;
		
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	    -moz-appearance: none; 
	    appearance: none;
	    background: url("../img/liarrow2.jpg") no-repeat 99% 50%; /* 화살표 모양의 이미지 */ 
	    background-size: 35px;
	    outline:none;
	    float:left;
	    margin-bottom:10px;
		
	}
	
	select::-ms-expand { display: none; } 
	

	


.leftStore_box .box_scroll{
	overflow: scroll;
    overflow-x: hidden;
    /*width:450px;*/
    width:430px;
    height:270px;
    border: 1px solid #cccccc;
    padding:10px;
    color:#646464;
}

.leftStore_box input[type="radio"]{
	margin:13px;
	
}

.leftStore button {
    width:70px;
    height:28px;
    background-color: #ffffff;
    border: 1px solid #c2c2c2;
    color:   #939393;
    font-weight:bold;
   	padding: 3px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 2px;
    cursor: pointer;
    /*border-radius:5px;*/
    
    float:right;
    margin-right:10px;
    margin-top:5px;
	}

</style>

<body>
<form id  = "rentFrm">
	<div class = "leftStore_box">
	<div class = "leftStore">
	<div class = "topTitle">대여지점</div>
	
	<select>
		<option value = "">서울</option>
		<option value = "">서울</option>
		<option value = "">서울</option>
		<option value = "">서울</option>
	</select>
	
	<div class = "box_scroll">
		<input type = "radio" name = "rentStore" value = "강남">강남
		<button type = "button">지점안내</button>
		<br>
		
		<input type = "radio" name = "rentStore" value = "공덕">공덕
		<button type = "button">지점안내</button>
		<br>
		
		<input type = "radio" name = "rentStore" value = "관악">관악
		<button type = "button">지점안내</button>
		<br>
		
		<input type = "radio" name = "rentStore" value = "구로디지털">구로디지털
		<button type = "button">지점안내</button>
		<br>
	</div>
	
	</div>
	</div>
</form>
</body>
</html>