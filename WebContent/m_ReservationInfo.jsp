<%@ page import="java.util.Vector" %>
<%@ page import="movie_reservation.Bean" %>
<%@ page import="movie_reservation.Movie_Res_DAO" %>
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
	
	String mem_id = (String)session.getAttribute("mem_id");
	int mov_code = ((Integer)session.getAttribute("mov_code"));
	int peo_num = Integer.parseInt(request.getParameter("peo_num"));
	
	String [] res_seat = request.getParameterValues("res_seat");
	String txt_res_seat = "";
	
	for(int i=0; i<res_seat.length; i++) {
		txt_res_seat += res_seat[i]+" ";
	}
	 mbean.setRes_seat(txt_res_seat);
	 
	 mrdao.movieReservation(mbean);
	 
	 session.setAttribute("mem_id", mbean.getMem_id());
	 session.setAttribute("mov_code",mbean.getMov_code());
	 
	 session.setMaxInactiveInterval(60*2);
	 
	 response.sendRedirect("m_ReservationInfo.jsp");
%>

<h2 align="center"><%=mem_id %> 's Reservation</h2>
<table align="center">
<tr height="40">
	<td align="center">mem_id</td>
	<td align="center"><%=mem_id %></td>
</tr>

</table>

</body>
</html>


