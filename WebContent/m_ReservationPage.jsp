<%@ page import="movie_reservation.MovieDAO" %>
<%@ page import="movie_reservation.MovieBean" %>
<%@ page import="java.util.Vector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mov_bean" class="movie_reservation.MovieBean">
	<jsp:setProperty name="mov_bean" property="*"/>
</jsp:useBean>
<%
	MovieDAO mdao = new MovieDAO();
	Vector<MovieBean> vec = mdao.movieInfo(mov_bean.getMov_code());
	
	for(int i=0; i<vec.size(); i++) {
		MovieBean bean = vec.get(i);
%>
<h1 align="center">Movie Information</h1>
	<table align="center" border="1">
		<tr height="40">
			<td align="center" width="200">Title</td>
			<td align="center" width="300"><%=bean.getMov_title() %></td>
		</tr>
		<tr height="220">
			<td align="center" width="200">Poster</td>
			<td align="center" width="300"><img alt="" src="img/<%=bean.getMov_img() %>" width="170px" height="240px"></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Genre</td>
			<td align="center" width="300"><%=bean.getMov_genre() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Theater</td>
			<td align="center" width="300"><%=bean.getMov_theater() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Date</td>
			<td align="center" width="300"><%=bean.getMov_date() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Time</td>
			<td align="center" width="300"><%=bean.getMov_time() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Price</td>
			<td align="center" width="300"><%=bean.getMov_price() %></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="2">
			<input type="button" value="RESERVATION"
			onclick="if(confirm('Are you sure you want to reservation it?')){
				location.href='m_ReservationAction.jsp?mov_code=<%=bean.getMov_code() %>'
				alert('OK');
			}else { alert('Cancele');}">
			&nbsp;&nbsp;
			<input type="button" value="LIST" onclick="location.href='m_List.jsp'"></td>
		</tr>
		
	</table>
<%
	}
%>
</body>
</html>