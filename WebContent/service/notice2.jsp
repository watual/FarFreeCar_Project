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
      
    
      <h2>공지사항</h2>    
      
  <article class="board">
			<h3>공지사항</h3>
			<div class="board_content">
				<div class="board_search">
					<select class="searchCondition" name="searchCondition">
						<option value="0" selected>전체</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">작성자</option>
					</select>
					<input class="searchKeyword" name="searchKeyword" type="text" value="">
					<button type="button" id="btn_search">검색</button>
				</div>
				<table class="board_list" border="1">
					<colgroup>
						<col width="8%">
						<col width="*">
						<col width="8%">
						<col width="11%">
						<col width="8%">
					</colgroup>
					<tr class="board_list_top">
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
					</tr>
					<%
					String sql = "select b.* from "
							+" (select rownum rn, a.* from "
							+" (select unq, title, userid, gid, pass, to_char(rdate,'yyyy-mm-dd') rdate from notice order by unq desc) a "
							+" ) b";
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()) {
						int rn = rs.getInt("rn");
						int unq = rs.getInt("unq");
						String title = rs.getString("title");
						String userid = rs.getString("userid");
						String pass = rs.getString("pass");
						String rdate = rs.getString("rdate");
						%>
						<tr>
							<td><%=rn %></td>
							<td><a href="noticePost.jsp?unq=<%=unq %>"><%=title %></a></td>
							<td><%=userid %></td>
							<td><%=rdate %></td>
						</tr>
						<%
					}
					%>
				</table>
			</div>
		</article>


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







