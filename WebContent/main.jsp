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
	<h3 align="right">
		<%
	if(mem_id.equals("GUEST")){
%>
		You are
		<%=mem_id %>
		! <br> <button type="button" onclick="location.href='m_Login.jsp'">LOGIN</button> &nbsp;&nbsp; 
			   <button type="button" onclick="location.href='m_Join.jsp'">JOIN</button>
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
	</h3>

	<h1 align="center">ZINKKI'S MOVIE THEATER</h1>
	<br>
	
	<h1 align="center">MOVIE LIST</h1>
<table align="center">
	<tr>
		<td align="center"><img src="img/28days.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/28week.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/us2.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/dontbreath.jpg" width="170px" height="240px"></td>
	</tr>
	<tr height="40">
		<td align="center"><a href="#">28 DAYS LATER</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">28 WEEKS LATER</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">US</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">DON'T BREATHE</a></td>
	</tr>
	<tr>
		<td align="center"><img src="img/lalaland.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/notebook.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/happydeath1.png" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/avengers.jpg" width="170px" height="240px"></td>
	</tr>
	<tr height="40">
		<td align="center"><a href="#">LALALAND</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">NOTEBOOK</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">HAPPY DEATH DAY</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">AVENGERS END-GAME</a></td>
	</tr>
	<tr>
		<td align="center"><img src="img/fantasyIsland.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/frozen1.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/frozen2.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/tomorrow.jpg" width="170px" height="240px"></td>
	</tr>
	<tr height="40">
		<td align="center"><a href="#">FANTASY ISLAND</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">FROZEN 1</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">FROZEN 2</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">TOMORROW</a></td>
	</tr>
	<tr>
		<td align="center"><img src="img/secretss.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/phoenix.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/blood.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/deathly1.jpg" width="170px" height="240px"></td>
	</tr>
	<tr height="40">
		<td align="center"><a href="#">HARRY POTTER 2</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">HARRY POTTER 5</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">HARRY POTTER 6</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">HARRY POTTER 7</a></td>
	</tr>
	<tr>
		<td align="center"><img src="img/fantasticbeasts.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/grindelwald.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/whitechicks.jpg" width="170px" height="240px"></td>
		<td width="20"></td>
		<td align="center"><img src="img/warz.jpg" width="170px" height="240px"></td>
	</tr>
	<tr height="40">
		<td align="center"><a href="#">FANTASTIC BEASTS</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">CRIMES OF GRINDEWWALD</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">WHITE CHICKS</a></td>
		<td width="20"></td>
		<td align="center"><a href="#">WORLD WAR Z</a></td>
	</tr>
</table>
<br><br><br><br><br><br>




</body>
</html>