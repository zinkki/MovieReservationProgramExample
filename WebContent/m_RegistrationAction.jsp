<%@ page import="movie_reservation.MovieBean" %>
<%@ page import="movie_reservation.MovieDAO" %>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="mbean" class="movie_reservation.MovieBean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>

<%
	MovieDAO mdao = new MovieDAO();
	
	
	//입력안된사항있을때!
	if(mbean.getMov_code()==0 || mbean.getMov_theater()==null || mbean.getMov_title()==null ||
			mbean.getMov_genre()==null || mbean.getMov_date()==null || mbean.getMov_time()==null || mbean.getMov_price()==0)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('There is ann empty spot')");
		script.println("history.go(-1)");
		script.println("</script>");
	}else {
		PrintWriter script = response.getWriter();
		
		mdao.insertMovie(mbean);
		
		script.println("<script>");
		script.println("alert('Registration Success! :)')");
		script.println("</script>");
		
		response.sendRedirect("m_RegistrationList.jsp");
	}

%>

</body>
</html>