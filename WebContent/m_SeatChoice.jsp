<%@ page import="java.util.Vector" %>
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
<jsp:useBean id="mov_bean" class="movie_reservation.MovieBean">
	<jsp:setProperty name="mov_bean" property="*"/>
</jsp:useBean>

<%
	MovieDAO mdao = new MovieDAO();
	Vector<MovieBean> vec = mdao.movieInfo(mov_bean.getMov_code());
	
	for(int i=0; i<vec.size(); i++) {
		MovieBean bean = vec.get(i);
%>
<h2 align="center">Seat Reservation</h2>
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
		<tr height="220">
			<td align="center" width="200">Seat</td>
			<td align="center" width="300"><p align="center">[screen]</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;4
			&nbsp;&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;&nbsp;8</p>
			1&nbsp;&nbsp;&nbsp;<input type="checkbox" name="res_seat" value="1_1">
			<input type="checkbox" name="res_seat" value="1_2">
			<input type="checkbox" name="res_seat" value="1_3">
			<input type="checkbox" name="res_seat" value="1_4">
			<input type="checkbox" name="res_seat" value="1_5">
			<input type="checkbox" name="res_seat" value="1_6">
			<input type="checkbox" name="res_seat" value="1_7">
			<input type="checkbox" name="res_seat" value="1_8">
			<br>
			2&nbsp;&nbsp;&nbsp;<input type="checkbox" name="res_seat" value="2_1">
			<input type="checkbox" name="res_seat" value="2_2">
			<input type="checkbox" name="res_seat" value="2_3">
			<input type="checkbox" name="res_seat" value="2_4">
			<input type="checkbox" name="res_seat" value="2_5">
			<input type="checkbox" name="res_seat" value="2_6">
			<input type="checkbox" name="res_seat" value="2_7">
			<input type="checkbox" name="res_seat" value="2_8">
			<br>
			3&nbsp;&nbsp;&nbsp;<input type="checkbox" name="res_seat" value="3_1">
			<input type="checkbox" name="res_seat" value="3_2">
			<input type="checkbox" name="res_seat" value="3_3">
			<input type="checkbox" name="res_seat" value="3_4">
			<input type="checkbox" name="res_seat" value="3_5">
			<input type="checkbox" name="res_seat" value="3_6">
			<input type="checkbox" name="res_seat" value="3_7">
			<input type="checkbox" name="res_seat" value="3_8">
			<br>
			4&nbsp;&nbsp;&nbsp;<input type="checkbox" name="res_seat" value="4_1">
			<input type="checkbox" name="res_seat" value="4_2">
			<input type="checkbox" name="res_seat" value="4_3">
			<input type="checkbox" name="res_seat" value="4_4">
			<input type="checkbox" name="res_seat" value="4_5">
			<input type="checkbox" name="res_seat" value="4_6">
			<input type="checkbox" name="res_seat" value="4_7">
			<input type="checkbox" name="res_seat" value="4_8">
			<br>
			5&nbsp;&nbsp;&nbsp;<input type="checkbox" name="res_seat" value="5_1">
			<input type="checkbox" name="res_seat" value="5_2">
			<input type="checkbox" name="res_seat" value="5_3">
			<input type="checkbox" name="res_seat" value="5_4">
			<input type="checkbox" name="res_seat" value="5_5">
			<input type="checkbox" name="res_seat" value="5_6">
			<input type="checkbox" name="res_seat" value="5_7">
			<input type="checkbox" name="res_seat" value="5_8">
			<br>
			</td>
		</tr>
</table>
<%
	} 
%>
</body>
</html>