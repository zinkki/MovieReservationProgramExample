<%@ page import="movie_reservation.Movie_Res_DAO" %>
<%@ page import="movie_reservation.Bean" %>
<%@ page import="java.util.Vector" %>
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
	String mem_id = request.getParameter("mem_id");
	
	Vector<Bean> vec = mrdao.res_Mypage(mbean.getMem_id());
	
%>

	<h1 align="center"><%=mem_id %>'s Movie Page</h1>
	
	<table align="center" border="1">
	<tr height="40">
		<td width="50" align="center">NUM</td>
		<td width="100" align="center">DATE</td>
		<td width="100" align="center">TIME</td>
		<td width="200" align="center">Movie Title</td>
		<td width="150" align="center">Movie Seat</td>
		<td width="60" align="center">Movie Delete</td>
	</tr>
	
 	<%
	for(int i=0; i<vec.size();i++) {
		Bean bean = vec.get(i);
	
	%>
	<tr height="40">
		<td width="50" align="center"><%= i+1 %></td>
		<td width="100" align="center"><%= bean.getMov_date() %></td>
		<td width="100" align="center"><%= bean.getMov_time() %></td>
		<td width="200" align="center"><%= bean.getMov_title() %></td>
		<td width="150" align="center"><%=bean.getRes_seat() %></td>
		<td width="60" align="center">
		<input type="hidden" name="res_num" value="<%=bean.getRes_num() %>">
		<input type="hidden" name="mov_date" value="<%=bean.getMov_date() %>">
		<input type="hidden" name="mov_time" value="<%=bean.getMov_time() %>">
		<input type="hidden" name="mov_genre" value="<%=bean.getMov_genre() %>">
		<input type="hidden" name="mov_title" value="<%=bean.getMov_title() %>">
		<input type="hidden" name="mov_price" value="<%=bean.getMov_price() %>">
		<input type="hidden" name="mov_theater" value="<%=bean.getMov_theater() %>">
		<input type="hidden" name="peo_num" value="<%=bean.getPeo_num() %>">
		<input type="hidden" name="res_seat" value="<%=bean.getRes_seat() %>">
		<input type="hidden" name="res_price" value="<%=bean.getRes_price() %>">
		<input type="hidden" name="mov_code" value="<%=bean.getMov_code() %>">
		
		<input type="button" value="DELETE"
			onclick="if(confirm('Are you sure you want to delete it?')){
				location.href='m_myMovDeleteAction.jsp?res_num=<%=bean.getRes_num() %>'
				alert('OK');
			}else { alert('Cancele');}"></td>
		
	</tr>
	
	<% }%>
	</table><br>
	<center><button type="button" onclick="location.href='main.jsp'">MAIN</button></center>

</body>
</html>