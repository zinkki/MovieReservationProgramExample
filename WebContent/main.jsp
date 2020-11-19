<%@ page import="java.util.Vector" %>
<%@ page import="movie_reservation.MovieDAO" %>
<%@ page import="movie_reservation.MovieBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
</head>
<body>

<%
	MovieDAO mdao = new MovieDAO();
	//Vector<MovieBean> vec = mdao.movieList();
%>

<br><br><br><h1 align="center">ZINKKI'S MOVIE THEATER</h1><br><br>
	<h3 align="center"><a href="m_Join.jsp">Go to Join</a></h3>
	<table align="center" border="1">
		<tr height="40">
			<td width="100" align="center"><img src="img/movie1.jpg" width="100px" height="150px"></td>
		<tr>
	</table>	
</body>
</html>