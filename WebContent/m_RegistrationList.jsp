<%@page import="java.util.Vector"%>
<%@ page import="movie_reservation.MovieDAO"%>
<%@ page import="movie_reservation.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<%
	MovieDAO mdao = new MovieDAO();
	Vector<MovieBean> vec = mdao.movieRegistrationList();
%>

	<h1 align="center">Movie Registration List</h1>
	<table align="center" width="600" border="1">
		<tr height="40">
			<td width="50" align="center">NUM</td>
			<td width="150" align="center">Movie Code</td>
			<td width="150" align="center">Movie Date</td>
			<td width="250" align="center">Movie Title</td>
		</tr>

		<%
	for(int i=0; i<vec.size(); i++){
		MovieBean mbean = vec.get(i);
%>
		<tr height="40">
			<td width="50" align="center"><%=i+1 %></td>
			<td width="150" align="center"><a href="m_Info.jsp?mov_code=<%=mbean.getMov_code()%>"><%=mbean.getMov_code() %></a></td>
			<td width="150" align="center"><%=mbean.getMov_date() %></td>
			<td width="250" align="center"><%=mbean.getMov_title() %></td>
		</tr>
		<%
	}
%>
		<tr height="40">
			<td align="center" colspan="4"><input type="button"
				align="center" value="Add to Movie"
				onclick="location.href='m_Registration.jsp'"> &nbsp;&nbsp; 
				<input type="button" align="center" value="Go to Main"
				onclick="location.href='main.jsp'"></td>
		</tr>
	</table>
	<br>
</body>
</html>