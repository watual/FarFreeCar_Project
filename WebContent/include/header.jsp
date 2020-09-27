<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
	<nav class="gnb">
		<div class="header_top">
			<div class="container">
				<div class="header_addr">
					대구대학교 &nbsp;&nbsp;
					주소: 경상북도 경산시 진량읍 대구대로 201
				</div>
            	<!-- <a href = "../member/register.jsp" style = "float:right; margin-left:20px" >회원가입</a> -->
            	<div class="header_logReg">
    <%
	String SessionId= (String) session.getAttribute("SessionId");
	if(SessionId == null){
	%>
            		<a href = "../member/login.jsp?a=0">로그인</a>&nbsp;/&nbsp;
            		<a href = "../member/login.jsp?a=1">회원가입</a>
            		
    <%
	}else{
	%>
				
				<a href = "../member/myPage.jsp">마이페이지</a>
				<a href = "../member/logout.jsp">로그아웃</a>
				
	<%} %>
            	</div>
			</div>
		</div>
		<div class="header_menu">
			<!-- <div class="container"> -->
				<div class="header_menu_list">
					<ul>
						<li>
							<img src="../img/paprika.png" height=30px>
						</li>
						<li>
							<a href="../main/main.jsp">메인</a>
						</li>
						<li>
							<a href="../main/main.jsp">정보1</a>
						</li>
						<li>
							<a href="#">페이지</a>
							<ul class="dropdown">
								<li>
									<a href="../main/main.jsp">페이지1</a>
								</li>
								<li>
									<a href="../main/main.jsp">페이지2</a>
								</li>
								<li>
									<a href="../main/main.jsp">페이지3</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="../main/main.jsp">가나다</a>
						</li>
						<li>
							<a href="../main/main.jsp">라마바</a>
						</li>
					</ul>
				</div>
			<!-- </div> -->
		</div>
	</nav>
	</body>
</html>