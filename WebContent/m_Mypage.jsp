<%@ page import="movie_reservation.Movie_Res_DAO" %>
<%@ page import="movie_reservation.Bean" %>
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
	Movie_Res_DAO mrdao = new Movie_Res_DAO();
	String mem_id = request.getParameter("mem_id");
	Vector<Bean> vec = mrdao.res_Mypage(mem_id);
%>

	<h1 align="center">My Movie Page</h1>
	<table align="center" border="1">
	<tr height="40">
		<td width="50" align="center">NUM</td>
		<td width="150" align="center">DATE</td>
		<td width="150" align="center">TIME</td>
		<td width="200" align="center">Movie Title</td>
		<td width="50" align="center">People Num</td>
	</tr>
	
 	<%
	for(int i=0; i<vec.size();i++) {
		Bean bean = vec.get(i);
	
	%>
	<tr height="40">
		<td width="50" align="center"><%= i+1 %></td>
		<td width="150" align="center"><%= bean.getMov_date() %></td>
		<td width="150" align="center"><%= bean.getMov_time() %></td>
		<td width="200" align="center"><%= bean.getMov_title() %></td>
		<td width="50" align="center"><%= bean.getPeo_num() %></td>
	</tr>
	
	<% }%>
	</table>

</body>
</html>