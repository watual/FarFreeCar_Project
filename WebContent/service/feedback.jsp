<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file =  "../include/dbCon.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>고객의견 | FFC렌터카</title>
   <link rel="shortcut icon" type="image⁄x-icon" href="../img/pp2.png" >
   <link rel="stylesheet" href="../css/style2.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
   <script src="../js/jquery-1.12.4.js"></script>
   <script src="../js/jquery-ui.js"></script>
</head>



<script>

/* input border focus시 색 바꾸기 */
   $(function(){
      $("#name").focus(function(){
         $(".name").css("border","1px solid red");
      });
      
      $("#name").focusout(function(){
         $(".name").css("border","1px solid  rgb(195, 195, 195)");
      });
      
      $("#email").focus(function(){
         $(".email").css("border","1px solid red");
      });
      
      $("#email").focusout(function(){
         $(".email").css("border","1px solid  rgb(195, 195, 195)");
      });
      
      $("#mobile1").focus(function(){
         $(".mobile1").css("border","1px solid red");
      });
      
      $("#mobile1").focusout(function(){
         $(".mobile1").css("border","1px solid  rgb(195, 195, 195)");
      });
      
      $("#mobile2").focus(function(){
         $(".mobile2").css("border","1px solid red");
      });
      
      $("#mobile2").focusout(function(){
         $(".mobile2").css("border","1px solid  rgb(195, 195, 195)");
      });
      
      $("#mobile3").focus(function(){
         $(".mobile3").css("border","1px solid red");
      });
      
      $("#mobile3").focusout(function(){
         $(".mobile3").css("border","1px solid  rgb(195, 195, 195)");
      });
      
      $("#title").focus(function(){
         $(".title").css("border","1px solid red");
      });
      
      $("#title").focusout(function(){
         $(".title").css("border","1px solid  rgb(195, 195, 195)");
      });
      
      $("#content").focus(function(){
         $(".content").css("border","1px solid red");
      });
      
      $("#content").focusout(function(){
         $(".content").css("border","1px solid  rgb(195, 195, 195)");
      });
      
      
      
      
      $("#feedbackSubmit").click(function(){
         var username = $("#name").val();
         if( username == ""){
            alert("이름을 입력해주세요.");
            document.frm.username.focus();
            return false;
         }
         
         var email = $("#email").val();
         if( email == ""){
            alert("이메일을 입력해주세요.");
            document.frm.email.focus();
            return false;
         }
         
         var mobile1 = $("#mobile1").val();
         var mobile2 = $("#mobile2").val();
         var mobile3 = $("#mobile3").val();
         if( mobile1 == "" || mobile2 == "" || mobile3 == ""){
            alert("휴대전화 입력해주세요.");
            document.frm.mobile1.focus();
            return false;
         }
         
         var title = $("#title").val();
         if( title == ""){
            alert("제목을 입력해주세요.");
            document.frm.title.focus();
            return false;
         }
         
         var content = $("#content").val();
         if( content == ""){
            alert("내용을 입력해주세요.");
            document.frm.content.focus();
            return false;
         }
         
         var cb3 = $("input:checkbox[id='f_agree']").is(":checked");
         if(cb3 == false){
            alert("개인정보보호를 위한 이용자 동의사항을 체크해주세요.");
            return false;
         }
         
         frm.submit();
      });
      
   });
</script>


<style>
   body{
      height:200%;
   }

   /* -----------------------페이지 루트--------------------------------*/
   
   .mypageLine{
      width:100%; 
      border-bottom:1px solid #c8c8c8;
      margin-top:24px;
      padding-left:10%;
      font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
      
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
       margin-top:17.5px;
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


   
   
   /* ----------------------- feedback --------------------------------*/
   .feedback{
      background:white;
      height: 600px;
      color:black;
      margin-top: 50px;
      font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
      
   }
   
   .feedback h2{
   font-size:24px;
   color:#161616;
   margin-block-end: 0.65em;
   }
   
   
   
   .feedback h7{
      color:red;
      font-weight:lighter;
      font-size:13px;
      
   }
   
   /************** content ******************/
   
   .feedback .content{
      
   }
   
   .explain2{
      border-top: 1px solid black; 
       color: #646464;
       
       padding: 20px 0;
       margin-bottom: 50px;
       line-height: 22px;
       
       font-size:14px;

   }
   
   
   .feedback table{
      margin-top:5px;
      border-top:1px solid black;
      border-collapse: collapse;
      width:100%;
   }
   
   .feedback .tag{
      border-right: 1px solid #cccccc;
      font-size: 15px;
      font-weight:bold;
      background: #fafafa;
      text-align:left;
      padding-left:10px;
   }
   
   .feedback td{
   height: 40px;
   font-size: 14px;
   color: black;
   padding-left:10px;
   
   }
   
   
   .feedback font{
      color:red;
      margin-right:3px;
   }
   
   .feedback .underLine{
      border-bottom: 1px solid #cccccc;
   }
   
   .feedback button {
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
   
   
   /*------------------ input -----------------*/
   .feedback input[type = "text"]{
      font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
      outline:none;
      border:none;
      width:294px;
      
   }
   .border{
      border:1px solid rgb(195, 195, 195);
      width:294px;
      padding:5px;
      
   }
   
   
   /* placeholder 컬러변경 */
   input::placeholder {
     color:rgb(195, 195, 195);
     opacity: 1; /* 파이어폭스에서 뿌옇게 나오는 현상을 방지하기 위한 css */
   }
   input::-webkit-input-placeholder {
     color:rgb(195, 195, 195);
   }
   input:-ms-input-placeholder {
     color:rgb(195, 195, 195);
   }
   input:-mos-input-placeholder {
     color:rgb(195, 195, 195);
   }
   
   
   /* textarea */
   textarea{
      width:99%; 
      border: none;
      outline:none;
      font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
      height:300px;
      resize: none;
      
   }
   
   textarea::placeholder {
     color:rgb(195, 195, 195);
     opacity: 1; /* 파이어폭스에서 뿌옇게 나오는 현상을 방지하기 위한 css */
   }
   textarea::-webkit-input-placeholder {
     color:rgb(195, 195, 195);
   }
   textarea:-ms-input-placeholder {
     color:rgb(195, 195, 195);
   }
   textarea:-mos-input-placeholder {
     color:rgb(195, 195, 195);
   }
   
   /* input 자동완성 배경색 없애기 */
   input:-webkit-autofill { -webkit-box-shadow:#f6f6f6 inset ; -webkit-text-fill-color:#000; }
   input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, input:-webkit-autofill:active {transition: background-color 5000s ease-in-out 0s;}

    }
    
   

   
</style>

<body>
<%@include file = "../member/login2.jsp" %>

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
      <a href = "../member/myPage.jsp" style = "float:left;margin-top:3px;"><font>고객센터</font></a>
      <img src = "../img/arrow_img.png" style= "width:10px; height:15px;margin:3px 18px 0 18px;float:left;">
      
       <ul class="menu2">
        <li>
            <input type="checkbox" id="menuBtn2">
            <label for="menuBtn2" class="labelBtn2" onclick=""> 고객의견
            <img class="labelBtn2" style = "width:15px; height:15px;margin-top:-15px;margin-left:50px;" src = "../img/liarrow.jpg">
            </label>
            <ul class="submenu2">
                <li><a href="./notice.jsp">공지사항</a></li>
                <li style = "background:white;"><a href="#" style = "color:#ff6767;"><b>고객의견</b></li>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">상담문의</a></li>
            </ul>
        </li>
    </ul>
      
      </div>
   </div>
   
   
   
   
<div class = "section_container">
   <!-- 내용을 쓰세영 ^_^ -->
   <div class ="feedback" >
      
    
      <h2>고객의견</h2>    
      
  
  
       
    <div class = "contentbox">    
       <p class = "explain2">
       고객님의 의견을 성실하게 반영하여 더욱 편리하게 이용하실 수 있도록 최선을 다하겠습니다.<br>
      비로그인 상태로 고객 센터에 글을 남기시는 경우는 남겨주신 유선 또는 이메일로만 답변을 받으실 수 있으며, 홈페이지에서는 답변 확인이 불가능합니다.
       </p>
       
       <div style = "font-size:14px; color:#646464;float:right;"><font>*</font>모든 항목은 필수기재입니다.</div>
       <h3 style = "margin-block-end:0.4em;">개인정보</h3>
       <form name = "frm" method = "post" action = "feedbackSave.jsp">
       <input type = "hidden" name = "f_userid" id = "f_userid" value = ""> 
       <table>
          <colgroup>
             <col width="10%"/>
          </colgroup>
          
          <tr>
             <td style = "padding-top:16px;">▪&nbsp;&nbsp;&nbsp;구분</td>
             <td style = "padding-top:16px;"> 
                <input type = "radio" name = "sort" value = "G" checked>칭찬
                <input type = "radio" name = "sort" value = "B">불만
             </td>
    
          </tr>
          
          <tr>
             <td>▪&nbsp;&nbsp;&nbsp;이름</td>
             <td>
                <div class ="border name"> 
                <input type= "text" name = "name" id = "name" placeholder = "이름을 입력하세요." value = "" >
                </div>
             </td>
          </tr>
          
          <tr>
             <td>▪&nbsp;&nbsp;&nbsp;이메일</td>
             <td>
                <div class ="border email"> 
                <input type= "text" name = "email" id = "email" placeholder = "이메일을 입력하세요.">
                </div>
             </td>
          </tr>
          
          <tr>
             <td>▪&nbsp;&nbsp;&nbsp;휴대전화</td>   
             <td>
                <div class ="border mobile1" style = "width:62px;float:left;" > 
                <input type= "text" name = "mobile1" id = "mobile1" style = "width:62px" maxlength="3">
                </div>
                <div style = "line-height:30px;padding:0 4px 0 4px;float:left;">-</div>
                
                <div class ="border mobile2" style = "width:88px;float:left;"> 
                <input type= "text" name = "mobile2" id = "mobile2" style = "width:88px" maxlength="4">
                </div>
                <div style = "line-height:30px;padding:0 4px 0 4px;float:left;">-</div>
                <div class ="border mobile3" style = "width:88px;float:left;"> 
                <input type= "text" name = "mobile3" id = "mobile3" style = "width:88px" maxlength="4">
                </div>
             
             </td>
          </tr>
          
       </table>
       
       
       
       
       <h3 style = "margin-block-end:0.4em; margin-block-start:3em;">고객 의견 내용</h3>
       
       <table>
          <colgroup>
             <col width="10%"/>
          </colgroup>
       
          
          <tr>
             <td style = "padding-top:16px; ">▪&nbsp;&nbsp;&nbsp;제목</td>
             <td style = "padding-top:16px;">
                <div class ="border title" style = "width:99%;"> 
                <input type= "text" name = "title" id = "title" placeholder = "제목을 입력하세요." style = "width:99%;">
                </div>
             </td>
          </tr>
          
          <tr>
             <td style = "height:10px;">▪&nbsp;&nbsp;&nbsp;내용</td>
             <td>
                <div class ="border content" style = "width:99%;height:300px;"> 
                <textarea type= "text" name = "content" id = "content" 
                        placeholder = "내용을 입력하세요."
                ></textarea>
                </div>
             </td>
          </tr>
          
          
          
       </table>
       </form>
   
       
       <h3 style = "margin-block-end:0.4em;margin-block-start:3em;">개인정보보호를 위한 이용자 동의사항</h3>
       
       <table>
          <colgroup>
             <col width="2%"/>
          </colgroup>
          <tr>
               <td>
               
               
                  <input type="checkbox" id="f_agree">
             
             </td>
             <td align="left"  style ="height:70px;font-size:15px;font-weight:bold;padding-bottom:0;">개인정보 수집 및 이용 동의(필수)</td>
            </tr>
            
            <tr>
               <td colspan = "2">
               <textarea 
               style = "border: 1px solid rgb(195, 195, 195);
               width:100%;
               height:130px;
               padding:30px;
               "
               readonly>본인은 FFC렌터카가 아래의 내용과 같이 본인의 개인정보를 수집 · 이용하는데 동의합니다.

개인정보의 수집 및 이용 목적
FFC렌터카 고객 센터 고객 의견 서비스 이용
수집하는 개인정보 항목
이름, 휴대전화, 이메일, 차량번호
개인정보 보유 및 이용 기간
동의일로부터 3년
귀하는 동의를 거부할 권리가 있으나, 위 사항에 동의하지 않으실 경우 롯데렌터카 견적신청, 견적회신 또는 상담 등이 불가능 할 수 있음을 알려드립니다.</textarea>
               </td>
            </tr>
            <tr>
               <td colspan = "2" style = "text-align:center;">
               <button type = "button" id = "feedbackSubmit">고객의견 접수</button>
               </td>
            </tr>
            
            </table>
         
       
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

<%

String f_userid = (String) session.getAttribute("SessionId");

if (f_userid != null){
   String sql = "select username, email, mobile  from memberInfo where userid = '"+f_userid+"'";
   ResultSet rs = stmt.executeQuery(sql);
   rs.next();
   String username = rs.getString("username");
   String email = rs.getString("email");
   String mobile = rs.getString("mobile");
   String mobileA[] = mobile.split("-");
   String mobile1 = mobileA[0];
   String mobile2 = mobileA[1];
   String mobile3 = mobileA[2];
   %>
   
   <script>
   $(function(){
      $("#f_userid").val("<%=f_userid%>");
      $("#name").val("<%=username%>");
      $("#email").val("<%=email%>");
      $("#mobile1").val("<%=mobile1%>");
      $("#mobile2").val("<%=mobile2%>");
      $("#mobile3").val("<%=mobile3%>");
   });
      
      
   </script>

<%}%>






