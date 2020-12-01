<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.Vector" %>
<%@page import="java.io.PrintWriter"%>
<%@ page import="movie_reservation.MovieDAO"%>
<%@ page import="movie_reservation.Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="movbean" class="movie_reservation.Bean">
		<jsp:setProperty name="movbean" property="*" />
	</jsp:useBean>

<%
	
	MovieDAO mdao = new MovieDAO(); 

	if(movbean.getMov_code()<=0 || movbean.getMov_genre()==null || movbean.getMov_title()==null ||
	movbean.getMov_theater()==null || movbean.getMov_date()==null || movbean.getMov_time()==null || movbean.getMov_price()<=0)
	{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('There is ann empty spot')");
	script.println("history.go(-1)");
	script.println("</script>");
	}else {
	PrintWriter script = response.getWriter();

	mdao.updateMovieInfo(movbean);
	
	script.println("<script>");
	script.println("alert('Update Success!')");
	script.println("</script>");
	
	response.sendRedirect("m_RegistrationList.jsp");
}
%>
</body>
</html>