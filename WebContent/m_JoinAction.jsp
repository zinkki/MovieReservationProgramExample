<%@page import="java.io.PrintWriter"%>
<%@page import="movie_reservation.MemberDAO"%>
<%@page import="movie_reservation.Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="mbean" class="movie_reservation.Bean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>

	<%
 	String mem_id= null;
  if(session.getAttribute("mem_id") != null ){
	  mem_id = (String)session.getAttribute("mem_id");
  }
  if(mem_id != null) {
	  PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('Already logged in')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
  } 
  
  MemberDAO mdao = new MemberDAO();
  //입력안된사항있을때
  if(mbean.getMem_id()==null || mbean.getMem_name()==null || mbean.getMem_email()==null || mbean.getMem_pass1()==null || mbean.getMem_pass2()==null || 
 mbean.getMem_resNum()==null || mbean.getMem_tel()==null) {
	  PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('There is an empty spot!')");
		script.println("history.go(-1)");
		script.println("</script>");
	
	//비밀번호확인이 다를때
  }else if(!mbean.getMem_pass1().equals(mbean.getMem_pass2())){
	  PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('PASSWORD IS NOT CORRECTED!!')");
		script.println("history.go(-1)");
		script.println("</script>");
	//가입 성공했을때
  }else {
	  PrintWriter script = response.getWriter();
	 
	  	mdao.insertMember(mbean);
	    
		
		script.println("<script>");
		script.println("alert('JOIN SUCCESS!!')");
		script.println("location.href='main.jsp'");
		script.println("</script");
		
		session.setAttribute("mem_id", mbean.getMem_id());
		session.setAttribute("mem_pass1", mbean.getMem_pass1());
		
		session.setMaxInactiveInterval(60);
		
		response.sendRedirect("main.jsp");
  }
%>

</body>
</html>