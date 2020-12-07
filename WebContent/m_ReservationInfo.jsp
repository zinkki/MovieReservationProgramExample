<%@page import="java.io.PrintWriter"%>
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
	Bean bean = new Bean();
	String mem_id=(String)session.getAttribute("mem_id");
	int mov_code = (Integer)session.getAttribute("mov_code");
	String[] res_seat = request.getParameterValues("res_seat");	
	int mov_price = Integer.parseInt(request.getParameter("mov_price"));
	int peo_num = Integer.parseInt(request.getParameter("peo_num"));
	int res_price = peo_num*mov_price;
	
	if(mbean.getRes_seat()==null || mbean.getPeo_num()==0) {
	//선택안한사항이있을때 못넘어가게하기
	PrintWriter script= response.getWriter();
	script.println("<script>");
	script.println("alert('There is an empty spot!')");
	script.println("history.go(-1)");
	script.println("</script>");
	
	}else {
	//성공적인예약~
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
	}
%>


<h2 align="center"><%=mem_id %> 's Reservation</h2>
<table align="center" border="1">

<tr height="80">
	<td align="center" width="150">Date / Time</td>
	<td align="center" width="350"><%=mbean.getMov_date() %> &nbsp; [<%=mbean.getMov_time() %>]</td>
</tr>
<tr height="80">
	<td align="center" width="150">Movie Title</td>
	<td align="center" width="350">[<%=mbean.getMov_genre() %>]&nbsp; <%=mbean.getMov_title() %></td>
</tr>
<tr height="80">
	<td align="center" width="150">Seat</td>
	<td align="center" width="350"><%=mbean.getRes_seat() %></td>
</tr>
<tr height="80">
	<td align="center" width="150">Price</td>
	<td align="center" width="350"><%=mbean.getRes_price() %>
</tr>
<tr>
<tr height="50">
	<td align="center" colspan="2">
	<input type="button" value="MAIN" onclick="location.href='main.jsp'">
	</td>

</table>

</body>
</html>


