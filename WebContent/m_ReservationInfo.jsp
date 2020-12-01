<%@ page import="java.util.Vector" %>
<%@ page import="movie_reservation.Bean" %>
<%@ page import="movie_reservation.MovieDAO" %>
<%@ page import="movie_reservation.Movie_Res_DAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mov_bean" class="movie_reservation.Bean">
	<jsp:setProperty name="mov_bean" property="*"/>
</jsp:useBean>

<%
	String mem_id=(String)session.getAttribute("mem_id");

	MovieDAO mdao = new MovieDAO();
	Vector<Bean> vec = mdao.movieInfo(mov_bean.getMov_code());
	
	int peo_num = Integer.parseInt(request.getParameter("peo_num"));

	for(int i=0; i<vec.size(); i++) {
		Bean bean = vec.get(i); 
		
%>
<h2 align="center"><%=mem_id %>'s Reservation</h2>
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
			<td align="center" width="200">People Number</td>
			<td align="center" width="300"><%=peo_num %></td>
</table>
<%
	} 
%>
</body>
</html>