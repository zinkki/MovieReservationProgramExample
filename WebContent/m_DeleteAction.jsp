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
		// 여기부분 문제! int 형으로 받아오깅...일단 월욜날오면 삭제부터다시하자!
		int mov_code= Integer.parseInt("mbean.getMov_code()");
		MovieDAO mdao = new MovieDAO();
		mdao.deleteMovie(mov_code);
		response.sendRedirect("m_RegistrationList.jsp");
		
	%>

</body>
</html>