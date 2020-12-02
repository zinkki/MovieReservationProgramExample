<%@ page import="movie_reservation.MovieDAO" %>
<%@ page import="movie_reservation.Bean" %>
<%@ page import="movie_reservation.Movie_Res_DAO" %>
<%@page import="java.io.PrintWriter"%>
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
<jsp:useBean id="mbean" class="movie_reservation.Bean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>


<%
	String mem_id=(String)session.getAttribute("mem_id");
	Movie_Res_DAO mrdao = new Movie_Res_DAO();
	
	Vector<Bean> vec = mrdao.movieInfo(mbean.getMov_code());
	
	for(int i=0; i<vec.size(); i++) {
		Bean bean = vec.get(i);
%>
<h1 align="center">Movie Reservation</h1>
<form action="m_ReservationPage2.jsp" method="post">
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
			<td align="center" colspan="2">
			<input type="button" value="NEXT"
			onclick="if(confirm('Are you sure you want to reservation it?')){
				location.href='m_ReservationPage2.jsp?mov_code=<%=bean.getMov_code() %>&mem_id=<%=mem_id %>'
				alert('OK');
			}else { alert('Cancele');}">
			&nbsp;&nbsp;
			<input type="button" value="LIST" onclick="location.href='m_List.jsp'"></td>
		</tr>
		
	</table>
<%

	} 
%>

</form>
</body>
</html>