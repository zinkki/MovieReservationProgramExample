<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="movie_reservation.MovieDAO" %>
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

<%-- <jsp:useBean id="bean" class="movie_reservation.MovieBean">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>

<%
	MovieDAO mdao = new MovieDAO();
	Vector<MovieBean> v = mdao.imgList();
%>
	
<table width="800">
	<tr height="240">
		<%
			for(int i=0;i<v.size();i++) {
				MovieBean mbean = v.get(i);
		%>
	<td width="220" align="center">
	<img alt="" src="img/<%=mbean.getMov_img() %>" width="300" height="220">
		<%
			}
		%>
	
</table> --%>

 <form action="fileExample2.jsp" method="post" enctype="multipart/form-data">
<table align="center">
<tr>
	<td>내가보낼 이미지 : </td>
	<td><input type="file" name="img" accept="img/jpg,img/png"></td> 
</tr>
<tr>
 	<td>내가 보낼 글자...:</td>
 	<td><input type="text" name="text"></td>
</tr>
<tr>
	<td><input type="submit" value="전송"></td>
</tr> 
</table> 
</form>







</body>
</html>