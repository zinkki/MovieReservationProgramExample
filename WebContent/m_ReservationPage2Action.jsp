<%@page import="java.io.PrintWriter"%>
<%@ page import="movie_reservation.Bean"%>
<%@ page import="movie_reservation.Movie_Res_DAO"%>
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
	
	try{
		Movie_Res_DAO mrdao = new Movie_Res_DAO();

		String mem_id = (String) session.getAttribute("mem_id");
		int mov_code = ((Integer) session.getAttribute("mov_code"));
		String[] res_seat = request.getParameterValues("res_seat");	
		int mov_price = Integer.parseInt(request.getParameter("mov_price"));
		int peo_num = Integer.parseInt(request.getParameter("peo_num"));
		int res_price = peo_num*mov_price;
		
			String txt_res_seat = "";
			
			System.out.println("peo_num"+peo_num);
			System.out.println("좌석 갯수"+res_seat.length);
			
			for (int i = 0; i < res_seat.length; i++) {
				
				txt_res_seat += res_seat[i] + ", ";
						
			}
			
			System.out.println("좌석" + txt_res_seat);
			
			//아이디
			mbean.setMem_id(mem_id);
			//좌석 (전부표시)
			mbean.setRes_seat(txt_res_seat);
			//가격
			mbean.setRes_price(res_price);
			//디비 
			mrdao.movieReservation(mbean);

			response.sendRedirect("m_ReservationInfo.jsp");
		
		
	}catch(Exception e){
		 e.printStackTrace();		
	}
		
	
	%>
</body>
</html>