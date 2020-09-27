<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file = "../include/dbCon.jsp"%>
<%
   String sort = request.getParameter("sort");
   String userid = request.getParameter("f_userid");
   String username = request.getParameter("name");
   String mobile1 = request.getParameter("mobile1");
   String mobile2 = request.getParameter("mobile2");
   String mobile3 = request.getParameter("mobile3");
   String mobile = mobile1+"-"+mobile2+"-"+mobile3;
   String email = request.getParameter("email");
   
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   
   String sql = "insert into feedback(unq,sort,userid,username,mobile,email,title,content,rdate) "
            + " values(feedback_seq.nextval,"
            + "          '"+sort+"',"
            + " '"+userid+"',"
            + " '"+username+"',"
            + " '"+mobile+"',"
            + " '"+email+"',"
            + " '"+title+"',"
            + " '"+content+"',"
            + " sysdate )";
   
   int result = stmt.executeUpdate(sql);
   
   if(result>0){
      %>
      <script>
      alert("접수가 완료되었습니다.");
      location = "../service/feedback.jsp";
      </script>
      <%
   }
   
   
   
%>