<%@ page import="java.util.Vector" %>
<%@ page import="movie_reservation.MovieBean" %>
<%@ page import="movie_reservation.MovieDAO" %>
<%@ page import="movie_reservation.Movie_Res_DAO" %>
<%@ page import="movie_reservation.Movie_Res_Bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mov_bean" class="movie_reservation.Movie_Res_Bean">
	<jsp:setProperty name="mov_bean" property="*"/>
</jsp:useBean>

<%
	Movie_Res_DAO rdao = new Movie_Res_DAO();
	Vector<Movie_Res_Bean> vec = rdao.res_Confirm(mov_bean.getMov_code());
	
	for(int i=0; i<vec.size(); i++) {
		Movie_Res_Bean bean = vec.get(i); 
%>
<h2 align="center">Reservation Confirm</h2>
<table align="center" border="1">
		<tr height="40">
			<td align="center" width="200">Title</td>
			<td align="center" width="300">[<%=bean.getMov_genre()%>] <%=bean.getMov_title() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Theater</td>
			<td align="center" width="300"><%=bean.getMov_theater() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Price</td>
			<td align="center" width="300"><%=bean.getMov_price() %></td> 
		</tr>
		<tr height="40">
			<td align="center" width="200">Person</td>
			<td align="center" width="300"></td>
</table>
<%
	} 
%>
</body>
</html>