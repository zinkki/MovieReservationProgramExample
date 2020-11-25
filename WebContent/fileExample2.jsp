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
	String savePath = "C:/Users/Administrator/git/MovieReservationProgramExample/WebContent/fileupload";
	
	int sizeLimit = 1024*1024*15;
	MultipartRequest multi = new MultipartRequest(request,savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());	
	
%>
<table align="center">
	<tr>
	<td>이미지 파일: </td>
	<td><img src="../img/<%=multi.getParameter("img") %>" width="300" height="210"></td>
	</tr>
	<tr>
	<td>대충 암꺼나 ... :</td>
	<td><%=multi.getParameter("text") %></td>
	</tr>
	
</table>
</body>
</html>