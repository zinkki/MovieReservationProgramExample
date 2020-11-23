<%@ page import="movie_reservation.MovieBean" %>
<%@ page import="movie_reservation.MovieDAO" %>

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
		//해결해결! request.getParameter> int형변환!
		int mov_code= Integer.parseInt(request.getParameter("mov_code"));
		MovieDAO mdao = new MovieDAO();
		mdao.deleteMovie(mov_code);
		response.sendRedirect("m_RegistrationList.jsp");
		
	%>

</body>
</html>