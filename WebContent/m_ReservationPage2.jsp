<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>



<body>
	<jsp:useBean id="bean" class="movie_reservation.Bean">
		<jsp:setProperty name="bean" property="*" />
	</jsp:useBean>
	<%
		String mem_id = (String) session.getAttribute("mem_id");
	%>
	<h2 align="center"><%=mem_id%>'s Reservation
	</h2>
	<form action="m_ReservationAction.jsp" method="post">
		<table align="center" border="1">
			
		</table>
	</form>

</body>
</html>