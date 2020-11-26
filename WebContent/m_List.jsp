<%@ page import="movie_reservation.MovieDAO" %>
<%@ page import="movie_reservation.MovieBean" %>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	MovieDAO mdao = new MovieDAO();
	Vector<MovieBean> vec = mdao.imgList();
	
%>

<h1 align="center">MOVIE LIST</h1>
<table align="center" width="400">
<tr>
<%
	for(int i=0; i<vec.size();i++) {
	MovieBean mbean = vec.get(i);
%>
<td align="center"><img src="img/<%=mbean.getMov_img() %>" width="120px" height="180px"></td>
<td align="left">[<%=mbean.getMov_genre() %>] <a href="m_DetailInfo.jsp?mov_code=<%=mbean.getMov_code()%>"><%=mbean.getMov_title() %></a> <br> <br>
	<%=mbean.getMov_date() %><br>
	<%=mbean.getMov_time() %><br><br>
	<%=mbean.getMov_theater() %><br><br>
	<%=mbean.getMov_price() %> WON	
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='m_ReservationPage.jsp?mov_code=<%=mbean.getMov_code()%>'">Reservation</button>
</td>
</tr>
<%		
	}
%>

</table>
</body>
</html>