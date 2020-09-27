<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<style>
</style>

<body>
 <div class = "nav_container">
	
	<a href="../main/main2.jsp"><img src = "../img/ffc.jpg"></a>
	
	
	<div class = "header_logReg">
	<%
	String SessionId= (String) session.getAttribute("SessionId");
	if(SessionId == null){
	%>
		<a href="javascript:callFunction();" style = "color:red;">로그인</a>&nbsp;&nbsp;|&nbsp;
		<a href = "../member/memberWrite.jsp">회원가입</a>

	<%
	}else{
		String url44444 = request.getRequestURI();
	%>			
		<a href = "../member/myPage.jsp">마이페이지</a>&nbsp;&nbsp;|&nbsp;
		<a href = "../member/logout.jsp?url=<%=url44444 %>">로그아웃</a>
				
	<%} %>
	
	</div>
	
	
	<ul id = "nav">
  	<li>
  		<div class = "circle"></div>
		<a href="../main/main2.jsp">예약</a>
		
		<ul>
			<li><a href="../main/main2.jsp">간편예약</a></li>
			<li><a href="../reserve/reserveDetail.jsp">상세예약</a></li>
			<li><a href="../reserve/rentList.jsp">예약내역</a></li>
		</ul>
	</li>
	
	<li>
		<a href="../board/boardList.jsp">게시판</a>
		<div class = "circle"></div>
		<ul>
			<li><a href="../board/boardList.jsp">리뷰 게시판</a></li>
			<li><a href="../main/story.jsp">일상 이야기</a></li>
		</ul>
	</li>

	<li>
		<a href="../main/main.jsp">이벤트</a>
		<div class = "circle"></div>
		<ul>
			<li><a href="../userevent/event_ing.jsp">진행 이벤트</a></li>
			<li><a href="../userevent/event_end.jsp">종료 이벤트</a></li>
			<li><a href="../userevent/event_win.jsp">당첨자 안내</a></li>
		</ul>
	</li>

	<li>
		<a href="../service/center.jsp">고객센터</a>
		<div class = "circle"></div>
		<ul>
			<li><a href="../service/notice.jsp">공지사항</a></li>
			<li><a href="../service/faq.jsp">FAQ</a></li>
			<li><a href="../service/feedback.jsp">고객의견</a></li>
			<li><a href="../service/2.jsp">상담문의</a></li>
		</ul>
	</li>

  </ul>
 </div>
</body>
</html>