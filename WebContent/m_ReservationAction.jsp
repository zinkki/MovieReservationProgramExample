<%@ page import="movie_reservation.Movie_Res_DAO" %>
<%@ page import="movie_reservation.Bean" %>
<%@page import="java.io.PrintWriter"%>
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
		<jsp:setProperty name="mbean" property="*" />
</jsp:useBean>

<%
	String mem_id= null;
	
	if(session.getAttribute("mem_id") != null ){
	   mem_id = (String)session.getAttribute("mem_id");
	 
	    Movie_Res_DAO mrdao = new Movie_Res_DAO();
	    
		mem_id = (String)session.getAttribute("mem_id");
		int peo_num=((Integer)session.getAttribute("peo_num"));
		
		String[] res_seat = request.getParameterValues("res_seat");
		String txt_res_seat = "";
		
		for(int i=0; i<res_seat.length; i++) {
			txt_res_seat += res_seat[i];
		}
		 mbean.setRes_seat(txt_res_seat);
		
		//mov_reservation 테이블에 insert
		mrdao.movieReservation(mbean);
		
		response.sendRedirect("m_ReservationInfo.jsp");
		
	}else {
		 PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('You need Login!')");
			script.println("location.href='m_Login.jsp'");
			script.println("</script>");
	}
	
	
%>
</body>
</html>