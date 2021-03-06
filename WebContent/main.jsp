<%@ page import="java.util.Vector"%>
<%@ page import="movie_reservation.MovieDAO"%>
<%@ page import="movie_reservation.Bean"%>
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
	Vector<Bean> vec = mdao.imgList();

	String logout = request.getParameter("logout");

	if(logout != null) {
		session.setAttribute("mem_id", null);
		session.setMaxInactiveInterval(0);
	}
	String mem_id = (String)session.getAttribute("mem_id");
	if(mem_id == null) {
		mem_id = "GUEST";
	}
%>
	
	<h1 align="center">ZINKKI'S MOVIE THEATER</h1>
<%
	if(mem_id.equals("GUEST")){
%>
		<h3 align="left">&nbsp;&nbsp;You are
		<%=mem_id %> ! </h3>
		 &nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='m_Login.jsp'">LOGIN</button> 
		 <button type="button" onclick="location.href='m_Join.jsp'">JOIN</button>

<h1 align="center">MOVIE LIST</h1>
<table align="center" width="400">
<tr>
<%
	for(int i=0; i<vec.size();i++) {
		Bean mbean = vec.get(i);
%>
<td align="center"><img src="img/<%=mbean.getMov_img() %>" width="120px" height="180px"></td>
<td align="left">[&nbsp;<%=mbean.getMov_genre() %>&nbsp;] <a href="m_DetailInfo.jsp?mov_code=<%=mbean.getMov_code()%>"><%=mbean.getMov_title() %></a> <br> <br>
	<%=mbean.getMov_date() %><br>
	<%=mbean.getMov_time() %><br><br>
	<%=mbean.getMov_theater() %><br><br>
	<%=mbean.getMov_price() %> WON	
</td>
</tr>
<%		
	}
%>
</table>


<%
	}else if(mem_id.equals("admin")){
%>
		<h2 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=mem_id %>.</h2>
		<button  type="button" value="LOGOUT" onclick="location.href='m_LogoutAction.jsp'">LOGOUT</button>
		<button  type="button" value="Movie Reservation" onclick="location.href='m_RegistrationList.jsp'">Movie Registration</button>
		

<h1 align="center">MOVIE LIST</h1>
<table align="center" width="400">
<tr>
<%
	for(int i=0; i<vec.size();i++) {
		Bean mbean = vec.get(i);
%>
<td align="center"><img src="img/<%=mbean.getMov_img() %>" width="120px" height="180px"></td>
<td align="left">[&nbsp;<%=mbean.getMov_genre() %>&nbsp;] <a href="m_DetailInfo.jsp?mov_code=<%=mbean.getMov_code()%>"><%=mbean.getMov_title() %></a> <br> <br>
	<%=mbean.getMov_date() %><br>
	<%=mbean.getMov_time() %><br><br>
	<%=mbean.getMov_theater() %><br><br>
	<%=mbean.getMov_price() %> WON	
</td>
</tr>
<%		
	}
%>
</table>

<%
	}else {
%>
		<h3 align="left"><%=mem_id %> &nbsp;, WELCOME! </h3> 
		<button type="button" value="LOGOUT" onclick="location.href='m_LogoutAction.jsp'">LOGOUT</button>
		<button type="button" value="MY_PAGE" onclick="location.href='m_Mypage.jsp?mem_id=<%=mem_id%>'">MY PAGE</button>
<h1 align="center">MOVIE LIST</h1>
<table align="center" width="400">
<tr>
<%
	for(int i=0; i<vec.size();i++) {
		Bean mbean = vec.get(i);
%>
<td align="center"><img src="img/<%=mbean.getMov_img() %>" width="120px" height="180px"></td>
<td align="left">[&nbsp;<%=mbean.getMov_genre() %>&nbsp;] <a href="m_DetailInfo.jsp?mov_code=<%=mbean.getMov_code()%>"><%=mbean.getMov_title() %></a> <br> <br>
	<%=mbean.getMov_date() %><br>
	<%=mbean.getMov_time() %><br><br>
	<%=mbean.getMov_theater() %><br><br>
	<%=mbean.getMov_price() %> WON	
	&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="location.href='m_ReservationPage.jsp?mem_id=<%=mem_id%>&mov_code=<%=mbean.getMov_code()%>'">Reservation</button>
</td>
</tr>
<%		
	}
%>
</table>
<%		
	}
%>
<br><br><br><br><br><br><br>
</body>
</html>