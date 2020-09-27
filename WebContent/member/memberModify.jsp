<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file =  "../include/dbCon.jsp"%>

<%

String userid = (String) session.getAttribute("SessionId");


String sql = "SELECT username, nickname, mobile," 
         + " to_char(birthday,'yyyy-mm-dd') birthday , gender, email, zipcode, addr "
           + " FROM memberInfo where userid = '"+userid+"'";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
String nickname = rs.getString("nickname");
String username = rs.getString("username");
String birthday = rs.getString("birthday");
String gender = rs.getString("gender");
String email = rs.getString("email");
String mobile = rs.getString("mobile");
String zipcode = rs.getString("zipcode");
String addr = rs.getString("addr");

String mobileArr[] = mobile.split("-"); 
String mobile1 = mobileArr[0];
String mobile2 = mobileArr[1];
String mobile3 = mobileArr[2];

String birthArr[] = birthday.split("-"); 
String year = birthArr[0];
String month = birthArr[1];
String date = birthArr[2];



%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>회원정보 수정 | FFC렌터카</title>
   <link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
   <link rel="stylesheet" href="../css/style2.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
   <script src="../js/jquery-1.12.4.js"></script>
   <script src="../js/jquery-ui.js"></script>
</head>



<script>

</script>


<style>
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
   
   .route label {
       cursor: pointer;
       color:  #8e8d8d;
      font-size:13px;
      font-weight:lighter;
      
      
   }
   
   .menu2 > li {
       list-style-type: none;
       float: left;
       position: relative;  
       width: 100px;
   }
   
   .menu2 .submenu2 {
       position: absolute;
       width: 120px;
   
       transform: scaleY(0);
       transform-origin: top;
       transition: all 0.3s;
       background: white;
       padding:0;
       border: 1px solid #c8c8c8;
       border: 1px solid #c8c8c8;
       margin-top:15px;
       margin-left:-10px;
   }
   
   
   .menu2 #menuBtn2:checked ~ .submenu2 {
       transform: scaleY(1);
   }
   
   
   
   .menu2 .submenu2 li:hover {
      background:#ff6767;
   }
   
   .menu2 .submenu2 li:hover a {
      color:white;
   }


   
   
   /* ----------------------- memberModify --------------------------------*/
   .memberModify{
      background:white;
      height: 600px;
      color:black;
      margin-top: 50px;
      font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
      
   }
   
   .memberModify h2{
   font-size:24px;
   color:#161616;

   }
   
   .memberModify .explain{
      color:    #2c2c2c;
      font-size:15px;
      margin-top: 45px;
      
      
   }
   
   .memberModify h7{
      color:red;
      font-weight:lighter;
      font-size:13px;
      
   }
   
   /************** content ******************/
   
   .memberModify .content{
      margin-top:100px;
   }
   
   
   .memberModify table{
      margin-top:5px;
      border-top:1px solid black;
      border-collapse: collapse;
      width:1200px;
   }
   
   .memberModify .tag{
      border-right: 1px solid #cccccc;
      font-size: 15px;
      font-weight:bold;
      background: #fafafa;
      text-align:left;
      padding-left:10px;
   }
   
   .memberModify td{
   height: 40px;
   font-size: 14px;
   color: #686463;
   padding-left:10px;
   }
   
   
   .memberModify font{
      color:red;
      margin-right:3px;
   }
   
   .memberModify .underLine{
      border-bottom: 1px solid #cccccc;
   }
   
   .memberModify input{
      border: none;
      background: #f0f0f0;
   }
   
   .memberModify .checkBtn {
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
   
   .memberModify button {
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
   
   
   
   .memberModify .changePass_Area{
      float:left;
   }
   
   .memberModify .deleteMemberShip_Area{
      float:right;
      text-align:center;
   }
   
   .memberModify .bottom_box{
      border-top:1px solid black;
      border-bottom: 1px solid #cccccc;
      padding: 25px 0 25px 0;
   }
</style>
   
   
<script>
function fn_nicknameCheck2(){
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
            if(nickname=="<%=nickname%>"){
               alert("사용할 수 있습니다.(현재닉넴)");
               $("#nicknameCheck2").val(nickname);
               $("#nicknameCheck3").val("1");
            }else{
               alert("다른 유저가 이미 사용중인 닉네임입니다.");
               $("#nicknameCheck2").val(nickname);
               $("#nicknameCheck3").val("0");
            }
            
         }
      },
      error: function(){
         alert("에라가 발생했습니다.");
      }   
   });
}


//------------------------------------------ 유효성체크 및 폼전송 
function fn_submit2Btn(){
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
   
   
   
   
   
   var frm = $("#registerModifyFrm").serialize();
   $.ajax({
      type:"POST",
      url:"registerModifySave.jsp",
      dataType : "text",
      data: frm,
      success: function(data){
         if($.trim(data) == "ok"){
            alert('수정성공');
         }else{
            alert("수정실패");
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
      <a href = "../member/myPage.jsp" style = "float:left;margin-top:3px;"><font>마이페이지</font></a>
      <img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
      
       <ul class="menu2">
        <li>
            <input type="checkbox" id="menuBtn2">
            <label for="menuBtn2" class="labelBtn2" onclick="">회원정보 변경
            <img class="labelBtn2" style = "width:15px; height:15px;margin-top:-15px;margin-left:85px;" src = "../img/liarrow.jpg">
            </label>
            <ul class="submenu2">
                <li style = "background:white;"><a href="#" style = "color:#ff6767;"><b>회원정보 변경</b></li>
                <li><a href="../reserve/rentList.jsp">예약내역</a></li>
                <li><a href="#">쿠폰등록</a></li>
                <li><a href="#">리뷰</a></li>
            </ul>
        </li>
    </ul>
      
      </div>
   </div>
   
   
   
   
<div class = "section_container">
   <!-- 내용을 쓰세영 ^_^ -->
   <div class ="memberModify" >
      
      <div class = "memberModify_Area">    
      <h2>회원정보 변경</h2>    
      
      <div class ="explain">
         <p style = "margin-block-end: 0.5em;">*는 필수입력항목입니다. 회원정보를 정확히 입력해 주세요.</p>
         <p style = "margin-block-start: 0.5em";>기본 정보 변경 시, 파프리카 회원정보에 적용됩니다.</p>
      </div>
       
       
    <div class = "content">
    <h3 style = "margin-block-end:0.4em;">회원정보</h3>
    
    
    
    
    
    
    
    
    
    <form id = "registerModifyFrm">
     <table>
        <colgroup>
         <col width = "10%"/>
         <col width = "90%">
        </colgroup>
     
     <tr class ="underLine"> 
      <th class = "tag"><font>*</font>이름</td>
      <td>
         <input type = "text" name = "username" id = "username" value = "<%=username %>">
      </td>
   </tr>
   
   <tr class ="underLine"> 
      <th class = "tag"><font>*</font>아이디</td>
      <td><%=userid %></td>
   </tr>
   
   <tr class ="underLine"> 
      <th class = "tag">비밀번호</td>
      <td>*********</td>
   </tr>
   
   <tr class ="underLine"> 
      <th class = "tag"><font>*</font>닉네임</td>
      <td>
         <input type = "hidden" id = "nicknameCheck2" value = "<%=nickname%>">
         <input type = "hidden" id = "nicknameCheck3" value = "1">
         <input type = "text" name = "nickname" id = "nickname" value = "<%=nickname %>">
         <button type="button" class = "checkBtn" onclick = "fn_nicknameCheck2()" >중복확인</button>
      </td>
   </tr>
   
   
   <tr> 
      <th class = "tag"><font>*</font>휴대폰 번호</td>
      <td>
         <input type = "text" name = "mobile1" id = "mobile1" value ="<%=mobile1 %>" 
         maxlength="3"
         style = "width:30px;text-align:center">
         
         -&nbsp;
         
         <input type = "text" name = "mobile2" id = "mobile2" 
            value ="<%=mobile2 %>" 
            maxlength="4"
            style = "width:35px;text-align:center">
         
         -&nbsp;
         
         <input type = "text" name = "mobile3" id = "mobile3" value ="<%=mobile3 %>" 
         maxlength="4"
         style = "width:35px;text-align:center">
      </td>
   </tr>

   <tr> 
      <th class = "tag"><font>*</font>생일</td>
      <td>
         <input type = "text" name = "year" id = "year" value ="<%=year %>" 
         maxlength="4"
         style = "width:40px;text-align:center">년
         
         
         &nbsp;&nbsp;&nbsp;
         <input type = "text" name = "month" id = "month" value ="<%=month %>" 
         maxlength="2"
         style = "width:40px;text-align:center">월
         
         
         &nbsp;&nbsp;&nbsp;
         <input type = "text" name = "date" id = "date" value ="<%=date %>" 
         maxlength="2"
         style = "width:40px;text-align:center">일
      </td>
   </tr>
   
   <tr>
      <th class ="tag"><font>*</font>성별</th>
      <td>
         <input type = "radio" name = "gender" value = "M"
         <%if(gender.equals("M")){%>checked<%} %>
          >남
         &nbsp;&nbsp;&nbsp;&nbsp;
         <input type = "radio" name = "gender" value = "F"
         <%if(gender.equals("F")){%>checked<%} %>
         >여
      </td>
   </tr>
   
   <tr class ="underLine"> 
      <th class ="tag">이메일</td>
      <td><input type = "text" name = "email" value ="<%=email %>" style = "width:300px;"></td>
   </tr>
   
   <tr> 
      <th class = "tag">우편번호</td>
      <td>
         <input type = "text" name = "zipcode" id = "zipcode" value = "<%=zipcode %>">
         <button type="button" class= "checkBtn" style = "width:95px;" onclick = "fn_zipcode()">우편번호찾기</button>
      </td>
   </tr>

   <tr> 
      <th class = "tag underLine">주소</td>
      <td><input type = "text" name = "addr" value ="<%=addr %>" style = "width:600px;"></td>
   </tr>
   
   <tr>
      <th colspan = "2">
      <button class = "submitBtn" type = "button" onclick = "fn_submit2Btn()">회원정보 변경</button>
      </th>
   <tr>
  
  
  </table>
  </form>
         </div>


</div>


<div class ="changePass_Area">
<h3 style = "margin-block-end:0.4em;text-align:left;">비밀번호 변경</h3>
   <div class = "bottom_box">
   비밀번호 변경을 원할 경우 비밀번호 변경 절차를 진행해주세요.
   </div>
   <button style = "text-align:center;">비밀번호 변경</button>
</div>


<div class ="deleteMemberShip_Area">
<h3 style = "margin-block-end:0.4em;text-align:left;">회원탈퇴</h3>
   <div class = "bottom_box">
   파프리카 렌탈 서비스를 더 이상 이용하지 않을 경우 회원탈퇴 절차를 진행해 주세요.
   </div>
   <button style = "">회원탈퇴</button>

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








