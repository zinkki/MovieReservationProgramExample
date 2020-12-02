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

	String[] res_seat = request.getParameterValues("res_seat");
	String txt_res_seat = "";
	
	for(int i=0; i<res_seat.length; i++) {
		txt_res_seat += res_seat[i];
	}
	 mbean.setRes_seat(txt_res_seat);
	 mrdao.movieReservation(mbean);
	 
	 response.sendRedirect("m_ReservationInfo.jsp");
%>
</body>
</html>