<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>회원가입 | FFC렌터카</title>
      <link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
   <link rel="stylesheet" href="../css/style2.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
   <script src="../js/jquery-1.12.4.js"></script>
   <script src="../js/jquery-ui.js"></script>
</head>

<style>

   body{
      height:150%;
   }
   /* -----------------------페이지 루트--------------------------------*/
   .mypageLine{
      width:100%; 
      border-bottom:1px solid #c8c8c8;
      margin-top:24px;
      padding-left:10%;
   }
   
   .mypageLine .route{
      line-height:center;
      height: 33px;
   }

   .mypageLine .route > a{
      color:  #8e8d8d;
      font-size:13px;
      font-weight:lighter;
   }
   
   
   
   /* ---------------------- 루트 리스트 --------------------------------*/
   .route a {
       text-decoration: none;
       color: #000;
   }
   
   .route li {
       padding: 0px;
       list-style-type: none;
       margin-top:1px;
       color:  #8e8d8d;
      font-size:13px;
      font-weight:lighter;
   
   }
   
   .route .submenu2 li {
      padding:5px;
   }
   
   
   .route input {
       position: fixed;
       left: -9999px;      
     
   }
   
   
   /* ----------------------- memberWrite --------------------------------*/
   .memberWrite{
      background:white;
      height: 600px;
      color:black;
      margin-top: 50px;
      font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
      
   }
   
   .memberWrite h2{
   font-size:24px;
   color:#161616;

   }
   
   .memberWrite  .explain{
      color:    #2c2c2c;
      font-size:15px;
      margin-top: 45px;
      
      
   }
   
   .memberWrite  h7{
      color:red;
      font-weight:lighter;
      font-size:13px;
      
   }
   
   /************** content ******************/
   
   .memberWrite  .content{
      margin-top:100px;
      display:none;
   }
   
   
   .memberWrite  table{
      margin-top:5px;
      border-top:1px solid black;
      border-collapse: collapse;
      width:1200px;
   }
   
   .memberWrite .tag{
      border-right: 1px solid #cccccc;
      font-size: 15px;
      font-weight:bold;
      background: #fafafa;
      text-align:left;
      padding-left:10px;
   }
   
   .memberWrite td{
   height: 40px;
   font-size: 14px;
   color: #686463;
   padding-left:10px;
   }
   
   
   .memberWrite font{
      color:red;
      margin-right:3px;
   }
   
   .memberWrite  .underLine{
      border-bottom: 1px solid #cccccc;
   }
   
   .memberWrite  input{
      border: none;
      background: #f0f0f0;
   }
   
   .checkBtn {
    width:65px;
    height:25px;
    background-color: #ffffff;
    border: 1px solid #999999;
    color:   #999999;
      
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 3px;
    cursor: pointer;
    /*border-radius:5px;*/
   }
   
   .submitBtn {
    width:300px;
    height:50px;
    background-color: #f04040;
    border: none;
    color:   white;

    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 70px;
    cursor: pointer;
    /*border-radius:5px;*/
   }
   
   
   .memberWrite .bottom_box{
      border-top:1px solid black;
      border-bottom: 1px solid #cccccc;
      padding: 25px 0 25px 0;
   }
   
   
   .memberWrite input[type = "checkbox"] + label {
            display: inline-block;
            width: 15px;
            height: 15px;
            border: 1px solid #bcbcbc;
            cursor: pointer;
         }
         input[type = "checkbox"]:checked + label {
            border: 1px solid red;
            background: url(../img/ico_check.png) no-repeat;
         }
         input[type = "checkbox"] {
            display: none;
         }
</style>
   
   
<script>
$(function(){
   
   $("#cb1").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
      if($("#cb1").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
         $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
      } 
      else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
         $("input[type=checkbox]").prop("checked",false);
      }
   });

   
   $("#agreeBtn").click(function(){
      var cb2 = $("input:checkbox[id='cb2']").is(":checked");
      var cb3 = $("input:checkbox[id='cb3']").is(":checked");
      if(cb2 == true && cb3 == true){
         $("#explain").slideUp("slow");
         $("#content").show();
      }
      
      if(cb2 == false || cb3 == false){
         alert("개인정보 수집 및 이용에 대한 안내에 동의해 주세요.");
      }
      
   });

   

   


});




function fn_nicknameCheck(){
   var nickname = $.trim($("#nickname").val());
   $("#nickname").val(nickname);
   if(nickname == ""){
      alert("닉네임을 입력해주세요.");
      $("#nickname").focus;
      return false;
   }
   
   $.ajax({

      type:"POST",
      url:"nicknamecheck.jsp",
      dataType : "text",
      data: "nickname="+nickname,
      success: function(data){
         if($.trim(data) == "ok"){
            alert("사용할 수 있습니다.");
            $("#nicknameCheck2").val(nickname);
            $("#nicknameCheck3").val("1");
            
         }else{
            alert("이미사용중입니다.");
            $("#nicknameCheck2").val(nickname);
            $("#nicknameCheck3").val("0");
         }
      },
      error: function(){
         alert("에라가 발생했습니다.");
      }   
   });
}



function fn_idCheck(){
   var userid1 = $.trim($("#userid1").val());
   $("#userid1").val(userid1);
   
   if(userid1 == ""){
      
      alert("아이디을 입력해주세요.");
      $("#userid1").focus;
      return false;
   }
   
   $.ajax({

      type:"POST",
      url:"idcheck.jsp",
      dataType : "text",
      data: "userid="+userid1,
      success: function(data){
         if($.trim(data) == "ok"){
            alert("사용할 수 있습니다.");
            $("#idCheck2").val(userid1);
            $("#idCheck3").val("1");
         }else{
            alert("이미사용중입니다.");
            $("#idCheck2").val(userid1);
            $("#idCheck3").val("0");
         }
      },
      error: function(){
         alert("에라가 발생했습니다.");
      }   
   });
}







//------------------------------------------ 유효성체크 및 폼전송 
function fn_register_submit(){
   /*var f = document.frm;
   if(f.userid.value == ""){
      alert("아이디를 입력해주세요.");
      f.userid.focus();
      return false;
   }*/
   
   var username =  $.trim($("#username").val());
   $("#username").val(username);
   if( username == ""){
      alert("이름을 입력해주세요.");
      $("#username").focus();
      return false;
   }
   
   var userid1 =  $.trim($("#userid1").val());
   $("#userid1").val(userid1);
   if( userid1 == ""){
      alert("아이디를 입력해주세요.");
      $("#userid1").focus();
      return false;
   }
   
   var idCheck2 = $("#idCheck2").val();
   if(idCheck2 != userid1){
      alert("아이디중복체크를 해주세요.");
      return false;
   }
   
   var idCheck3 = $("#idCheck3").val();
   if(idCheck3 == "0"){
      alert("사용할 수 있는 아이디를 입력해주세요.");
      return false;
   }   
   
   var pass1 =  $.trim($("#pass1").val());
   $("#pass1").val(pass1);
   if( pass1 == ""){
      alert("패스워드를 입력해주세요.");
      $("#pass1").focus();
      return false;
   }
   
   var nickname =  $.trim($("#nickname").val());
   $("#nickname").val(nickname);
   if( nickname == ""){
      alert("닉네임을 입력해주세요.");
      $("#nickname").focus();
      return false;
   }
   
   var nicknameCheck2 = $("#nicknameCheck2").val();
   if(nicknameCheck2 != nickname){
      alert("닉네임중복체크를 해주세요.");
      return false;
   }
   
   var nicknameCheck3 = $("#nicknameCheck3").val();
   if(nicknameCheck3 == "0"){
      alert("사용할 수 있는 닉네임을 입력해주세요.");
      return false;
   }
   
   var mobile1 =  $.trim($("#mobile1").val());
   $("#mobile1").val(mobile1);
   if( mobile1 == ""){
      alert("휴대폰 번호를 정확히 입력해주세요.");
      $("#mobile1").focus();
      return false;
   }

   var mobile2 =  $.trim($("#mobile2").val());
   $("#mobile2").val(mobile2);
   if( mobile2 == ""){
      alert("휴대폰 번호를 정확히 입력해주세요.");
      $("#mobile2").focus();
      return false;
   }
   
   

   var mobile3 =  $.trim($("#mobile3").val());
   $("#mobile3").val(mobile3);
   if( mobile3 == ""){
      alert("휴대폰 번호를 정확히 입력해주세요.");
      $("#mobile3").focus();
      return false;
   }
   
   var year =  $.trim($("#year").val());
   $("#year").val(year);
   if( year == ""){
      alert("생일을 정확히 입력해주세요.");
      $("#year").focus();
      return false;
   }
   
   var month =  $.trim($("#month").val());
   $("#month").val(month);
   if( month == ""){
      alert("생일을 정확히 입력해주세요.");
      $("#month").focus();
      return false;
   }
   
   var date =  $.trim($("#date").val());
   $("#date").val(date);
   if( date == ""){
      alert("생일을 정확히 입력해주세요.");
      $("#date").focus();
      return false;
   }
   
   
   var gender = $('input:radio[name=gender]').is(':checked');

   if(gender == false){
      alert("성별을 선택해주세요.");
      return false;
   }
   
   
   
   var frm = $("#registerFrm").serialize();
   $.ajax({
      
      type:"POST",
      url:"registerSave.jsp",
      dataType : "text",
      data: frm,
      success: function(data){
         if($.trim(data) == "ok"){
            location = "./welcomePage.jsp";
         }else{
            alert("저장실패");
         }
      },
      error: function(){
         alert("에라가 발생했습니다.");
      }   
   });

}
</script>

<!----------------------- 우편번호--------------------------->
<script>
   function fn_zipcode(){
      var zipcode = $("#zipcode").val();
      var url = "post1.jsp";
      window.open(url,"zipcode","width=400,height=150");
   }
</script>

<!----------------------- 알파벳, 숫자만 입력--------------------------->
<script type="text/javascript">
$( function(){
   $( "#userid1" ).on("blur keyup", function() {
      $(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
   });
   $( "#mobile1" ).on("blur keyup", function() {
      $(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
   });
   $( "#mobile2" ).on("blur keyup", function() {
      $(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
   });
   $( "#mobile3" ).on("blur keyup", function() {
      $(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
   });
   $( "#year" ).on("blur keyup", function() {
      $(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
   });
   $( "#month" ).on("blur keyup", function() {
      $(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
   });
   $( "#date" ).on("blur keyup", function() {
      $(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
   });
})

</script>
   
   
   

<body>
<%@include file = "../member/login2.jsp" %>
<%@ include file="./agree1.jsp" %>
<%@ include file="./agree2.jsp" %>

<header>
   <div class = "header_container">
      <%@ include file="../include/header2.jsp" %>
   </div>
</header>

 
<section>

   <div class ="mypageLine">
      <div class = "route">
      <a href = "../main/main2.jsp">
         <img src = "../img/main_img.png" style= "width:15px; height:15px;margin-top:3px;float:left;">
      </a>
      <img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
      <a href = "../member/memberWrite.jsp" style = "float:left;margin-top:3px;"><font>회원가입</font></a>
      
      </div>
   </div>
   
   
   
   
<div class = "section_container">
   <!-- 내용을 쓰세영 ^_^ -->
   <div class ="memberWrite" >
      
  
      <h2>회원가입</h2>    
      
      <div class ="explain" id = "explain">
         <table>
            <colgroup>
               <col width = "6%"/>
               <col width = "85%"/>
               <col width = ""/>
            </colgroup>
            <tr class ="underLine">
               <th>
               <div>
                  <input type="checkbox" id="cb1">
                <label for="cb1"></label>
             </div>
             </th>
             <th align="left" style ="color:#f04040;height:70px;">전체동의</th>
               <td></td>
            </tr>
            
            <tr height="20px;"></tr>
            
            <tr>
               <th>
               <div>
                  <input type="checkbox" id="cb2">
                <label for="cb2"></label>
             </div>
             </th>
             <th align="left"  style ="height:70px;">이용약관 동의(필수)</th>
               <td><a href="javascript:call_agree1();" style = "color:#686463;"><u>자세히</u></td>
            </tr>
            
            <tr>
               <th>
               <div>
                  <input type="checkbox" id="cb3">
                <label for="cb3"></label>
             </div>
             </th>
             <th align="left" style ="height:70px;">개인정보취급방침 동의(필수)</th>
               <td><a href="javascript:call_agree2();" style = "color:#686463;"><u>자세히</u></td>
            </tr>
            
            <tr>
               <th colspan = "3">
               <button class = "submitBtn" type = "button" id= "agreeBtn">확인</button>
               </th>
            </tr>
            
         </table>
         
      </div>
       
       
    <div class = "content" id = "content">
    <h3 style = "margin-block-end:0.4em;">회원정보</h3>
    
    
    <form id = "registerFrm">
     <table>
        <colgroup>
         <col width = "10%"/>
         <col width = "90%">
        </colgroup>
     
     <tr class ="underLine"> 
      <th class = "tag"><font>*</font>이름</td>
      <td>
         <input type = "text" name = "username" id = "username">
      </td>
   </tr>
   
   <tr class ="underLine"> 
      <th class = "tag"><font>*</font>아이디</td>
      <td>
         <input type = "hidden" id = "idCheck2" value = "">
         <input type = "hidden" id = "idCheck3" value = "0">
         <input type = "text" name = "userid1" id = "userid1">
         <button type="button" class = "checkBtn" onclick = "fn_idCheck()" >중복확인</button>
      </td>
   </tr>
   
   <tr class ="underLine"> 
      <th class = "tag"><font>*</font>비밀번호</td>
      <td><input type = "password" name = "pass1" id = "pass1"></td>
   </tr>
   
   <tr class ="underLine"> 
      <th class = "tag"><font>*</font>닉네임</td>
      <td>
         <input type = "hidden" id = "nicknameCheck2" value = "">
         <input type = "hidden" id = "nicknameCheck3" value = "0">
         <input type = "text" name = "nickname" id = "nickname">
         <button type="button" class = "checkBtn" onclick = "fn_nicknameCheck()" >중복확인</button>
      </td>
   </tr>
   
   
   <tr> 
      <th class = "tag"><font>*</font>휴대폰 번호</td>
      <td>
         <input type = "text" id = "mobile1" name = "mobile1"
         maxlength="3"
         style = "width:30px;text-align:center">
         
         -&nbsp;
         
         <input type = "text" id = "mobile2"  name = "mobile2"
            maxlength="4"
            style = "width:35px;text-align:center">
         
         -&nbsp;
         
         <input type = "text" id = "mobile3" name = "mobile3"
         maxlength="4"
         style = "width:35px;text-align:center">
      </td>
   </tr>

   <tr> 
      <th class = "tag"><font>*</font>생일</td>
      <td>
         <input type = "text" id = "year" name = "year"
         maxlength="4"
         style = "width:40px;text-align:center">년
         
         
         &nbsp;&nbsp;&nbsp;
         <input type = "text" id = "month"  name = "month"
         maxlength="2"
         style = "width:40px;text-align:center">월
         
         
         &nbsp;&nbsp;&nbsp;
         <input type = "text" id = "date"  name = "date"
         maxlength="2"
         style = "width:40px;text-align:center">일
      </td>
   </tr>
   
   <tr>
      <th class ="tag"><font>*</font>성별</th>
      <td>
         <input type = "radio" name = "gender"  value = "M">남
         &nbsp;&nbsp;&nbsp;&nbsp;
         <input type = "radio" name = "gender" value = "F">여
      </td>
   </tr>
   
   <tr class ="underLine"> 
      <th class ="tag">이메일</td>
      <td><input type = "text" name = "email" id = "email" style = "width:300px;"></td>
   </tr>
   
   <tr> 
      <th class = "tag">우편번호</td>
      <td>
         <input type = "text" name = "zipcode" id = "zipcode">
         <button type="button" class= "checkBtn" style = "width:95px;" onclick = "fn_zipcode()">우편번호찾기</button>
      </td>
   </tr>

   <tr> 
      <th class = "tag underLine">주소</td>
      <td><input type = "text" name = "addr" id = "addr" style = "width:600px;"></td>
   </tr>
   
   <tr>
      <th colspan = "2">
      <button class = "submitBtn" type = "button" onclick = "fn_register_submit()">회원가입</button>
      </th>
   <tr>
  
  
  </table>
  </form>
         </div>





</div>
</div>








</section>

 
<aside>
   <div class = "aside_container">
      <!-- aside를 쓰세영 ^_^ -->
   </div>
</aside>

 
<footer>
      <div class = "footer_container">
      <!-- footer를 쓰세영 ^_^ -->
   </div>
</footer>
 
</body>
</html>








