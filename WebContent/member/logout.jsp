<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//url=/teamProject/service/notice.jsp
   String logOutUrl = request.getParameter("url");
   String urlArr[] = logOutUrl.split("/");

   session.removeAttribute("SessionId");
   int num = urlArr.length - 1;
   String url = "../"+urlArr[num-1]+"/"+urlArr[num];
   
   if(urlArr[num-1].equals("member") || urlArr[num-1].equals("reserve")) {
      url = "../main/main2.jsp";
   }
%>
<script>
   location = "<%=url%>";
</script>