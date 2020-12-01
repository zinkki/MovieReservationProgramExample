<%@page import="movie_reservation.Bean" %>
<%@page import="movie_reservation.MovieDAO" %>
<%@page import="java.util.Vector"%>
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
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>

<%
	MovieDAO mdao = new MovieDAO();
	mdao.movieRegistrationList();
	response.sendRedirect("m_RegistrationList.jsp");
%>
</body>
</html>