<%@ page import="java.util.Vector" %>
<%@ page import="movie_reservation.MovieDAO" %>
<%@ page import="movie_reservation.MovieBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
	int mov_code= Integer.parseInt(request.getParameter("mov_code"));
	MovieDAO mdao = new MovieDAO();
	Vector<MovieBean> vec = mdao.movieInfo(mov_code);
	
	for(int i=0; i<vec.size(); i++) {
		MovieBean mbean = vec.get(i);
%>

<h1 align="center">Movie Information</h1>
<form action="m_UpdateAction.jsp" method="post">
	<table align="center" border="1">
		<tr height="40">
			<td align="center" width="200"> MOVIE CODE </td>
			<td align="center" width="300"><input type="text" name="mov_code" value="<%=mbean.getMov_code() %>"></td>
		</tr>
		<tr height="40">
			<td align="center" width="200"> MOVIE GENRE </td>
			<td align="center" width="350" >
			 <select name="mov_genre" >
			 <option value="etc.">etc.</option>
			 <option value="romantic">romantic</option>
			 <option value="comedy">comedy</option>
			 <option value="romantic/comedy">romantic/comedy</option>
			 <option value="action">action</option>
			 <option value="noir">noir</option>
			 <option value="crime">crime</option>
			 <option value="mystery">mystery</option>
			 <option value="adventure">adventure</option>
			 <option value="horror/thriller">horror/thriller</option>
			 <option value="science/fiction">science/fiction</option>
			 <option value="fantasy">fantasy</option>
			 </select>
		 	</td>
		</tr>
		<tr height="220">
			<td align="center" width="200">Poster</td>
			<td align="center" width="300"><input type="file" name="mov_img" accept="img/jpg,img/png"></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Title</td>
			<td align="center" width="350"><input type="text" name="mov_title" value="<%=mbean.getMov_title() %>"></td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Theater</td>
			<td width="350" align="center"> 
			<select name="mov_theater">
			<option value="3F_A">3F_A</option>
			<option value="3F_B">3F_B</option>
			<option value="3F_C">3F_C</option>
			<option value="4F_A">4F_A</option>
			<option value="5F_A">5F_A</option>
			<option value="5F_B">5F_B</option>
			</select>
			</td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Date</td>
			<td width="350" align="center">
		 	<select name="mov_date">
		 	<option value="2020_11_19">2020_11_19</option>
			 <option value="2020_11_20">2020_11_20</option>
		 	<option value="2020_11_21">2020_11_21</option>
		 	<option value="2020_11_22">2020_11_22</option>
		 	<option value="2020_11_23">2020_11_23</option>
		 	<option value="2020_11_24">2020_11_24</option>
		 	<option value="2020_11_25">2020_11_25</option>
		 	<option value="2020_11_26">2020_11_26</option>
		 	</select>
		 	</td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Time</td>
			<td width="350" align="center">
			<select name="mov_time">
			<option value="09:00-11:00">09:00-11:00</option>
			<option value="10:00-12:00">10:00-12:00</option>
			<option value="11:00-13:00">11:00-13:00</option>
			<option value="13:00-15:00">13:00-15:00</option>
			<option value="14:00-16:00">14:00-16:00</option>
			<option value="15:00-17:00">15:00-17:00</option>
			<option value="16:00-18:00">16:00-18:00</option>
			<option value="17:00-19:00">17:00-19:00</option>
			<option value="19:00-21:00">19:00-21:00</option>
			<option value="20:00-22:00">20:00-22:00</option>
			<option value="21:00-23:00">21:00-23:00</option>
			<option value="22:00-24:00">22:00-24:00</option>
			</select>
			</td>
		</tr>
		<tr height="40">
			<td align="center" width="200">Price</td>
			<td align="center" width="350"><input type="text" name="mov_price" value="<%=mbean.getMov_price() %>"></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="2">
			<input type="hidden" name="mov_code" value="<%=mbean.getMov_code() %>">
			&nbsp;&nbsp;
			<input type="submit" value="UPDATE">
			&nbsp;&nbsp;
			<input type="reset" value="RESET"></td>
		</tr>
<% } %>
		
	</table>
</form>
</body>
</html>