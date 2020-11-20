<%@ page import="java.util.Vector"%>
<%@ page import="movie_reservation.MovieDAO"%>
<%@ page import="movie_reservation.MovieBean"%>
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

	<br>
	<br>
	<br>
	<h1 align="center">ZINKKI'S MOVIE THEATER</h1>
	<br>

	<h2 align="center">
		<%
	if(mem_id.equals("GUEST")){
%>
		You are
		<%=mem_id %>
		! <br> <a href="m_Login.jsp">Go to Login!</a> &nbsp;&nbsp; <a
			href="m_Join.jsp">Go to Join!</a>
		<%
	}else if(mem_id.equals("admin")){
%>
		<%=mem_id %>. <br> <a href="m_LogoutAction.jsp">Logout</a><br>
		<br> <a href="m_RegistrationList.jsp">Go to Movie
			Registration!</a>
		<%
	}else {
%>
		<%=mem_id %>
		&nbsp;, WELCOME! <br> <a href="m_LogoutAction.jsp">Logout</a>
		<%		
	}
%>
	</h2>

	<table align="center" border="1">
		<tr height="40">
			<td width="100" align="center"><img src="img/movie1.jpg"
				width="100px" height="150px"></td>
		<tr>
	</table>

</body>
</html>