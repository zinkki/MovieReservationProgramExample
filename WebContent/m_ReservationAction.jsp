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
	if(session.getAttribute("mem_id") != null) {
		mem_id = (String)session.getAttribute("mem_id");
	}
	String peo_num = request.getParameter("peo_num");
	String res_seat = request.getParameter("res_seat");

%>

<table align="center" border="1">
	<tr height="40">
		<td align="center">Peo_num</td>
		<td align="center"><%=peo_num %></td>
	</tr>
</table>

</body>
</html>