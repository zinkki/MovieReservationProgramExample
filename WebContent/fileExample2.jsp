<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String savePath = "C:/Users/Administrator/git/MovieReservationProgramExample/WebContent/img";
	
	int sizeLimit = 5*1024*1024; 
	MultipartRequest multi = new MultipartRequest(request,savePath,sizeLimit,"utf-8");	
	
%>
<table align="center">
	<tr>
	<td>얘는 c:어쩌구저쩌구 경로복붙한거..</td>
	<td><img src="img/<%=multi.getFilesystemName("img") %>" width="120px" height="170px"/></td>
	</tr>
	<tr>
	<td>
		<p><%=multi.getFilesystemName("img") %></p>
	</td>
	<%-- <td>얘네중에 하나만 되면됨..</td>
	<td><%=multi.getParameter("img") %></td>
	</tr>
	<tr>
	<td>하나만 나와라</td>
	<td><img src="WebContents/img/<%=multi.getParameter("img") %>"></td>
	</tr>
	<tr>
	<td>하나만걸려라</td>
	<td><%=multi.getFilesystemName("img") %></td>
	</tr>
	<tr>
	<td>ㅈㅂ</td>
	 <td><img src="WebContents/img/<%=multi.getParameter("img") %>" width="120" height="170"></td>	--%>
	</tr>

</table>
</body>
</html>