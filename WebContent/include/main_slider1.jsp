<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Untitled Document</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="../js/jquery.bxslider.min.js"></script>
<link href="../css/jquery.bxslider.css" rel="stylesheet" />
<script>
$(document).ready(function(){
	var slider = $('.bxslider').bxSlider({
			auto: true, mode:'fade',
		});
	var slider_01 =	$('.bxslider_01').bxSlider({
			auto: true,autoControls: true, mode:'vertical',
		});
	var slider_02 =	$('.bxslider_02').bxSlider({
			auto: true,
		});
		// 클릭시 멈춤 현상 해결 //
		$(document).on('click','.bx-next, .bx-prev,  #bx-pager1',function() {
		slider.stopAuto();
		slider.startAuto();
		slider_01.stopAuto();
		slider_01.startAuto();
		slider_02.stopAuto();
		slider_02.startAuto();
	});	
});
</script>
<style>
#s_banner_wrap {width:291px; height:370px; position: relative; margin:10px 0}

/* 사용자 페이징 위치와 모양을 자유롭게 변형 */
#bx-pager1 {position: absolute; bottom:10px;}
#bx-pager1 a{float:left; margin:0 5px;display: block; width:20px; height:20px; font-size:12px; line-height:18px; text-align:center; background:#999; color:#333}
#bx-pager1 a:hover, .bx-pager1 a:active{ background: #000; color: #CCC;}

/* 엑티브상태에 대한 속성값 지정 */
#bx-pager1 a.active{ background: #000; color: #CCC;}
</style>
</head>
<body>
<div id="s_banner_wrap">
	<ul class="bxslider_02">
    <a href ="#"> <img style="width:291px; height:370px;" src = "../img/banner2.jpg"></img></a>
    <a href ="#"> <img style="width:291px; height:365px;" src = "../img/banner4.jpg"></img></a>
    <a href ="#"> <img style="width:291px; height:365px;" src = "../img/banner0.png"></img></a>
     
    </ul>
</div>


</body>
</html>
