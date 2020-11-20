<%@ page import="movie_reservation.MemberBean"%>
<%@ page import="movie_reservation.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PAGE</title>
</head>
<body>
	<h2 align="center">JOIN PAGE</h2>
	<form action="m_JoinAction.jsp" method="post">
		<table align="center" width="500" border="1">
			<tr height="50">
				<td width="150" align="center">NAME</td>
				<td width="350" align="center"><input type="text"
					name="mem_name" size="40" placeholder="NAME"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">I D</td>
				<td width="350" align="center"><input type="text" name="mem_id"
					size="40" placeholder="I D"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">PASSWORD</td>
				<td width="350" align="center"><input type="password"
					name="mem_pass1" size="40" placeholder="PASSWORD"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">PASSWORD CONFIRM</td>
				<td width="350" align="center"><input type="password"
					name="mem_pass2" size="40" placeholder="PASSWORD CONFIRM"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">TEL</td>
				<td width="350" align="center"><input type="tel" name="mem_tel"
					size="40" placeholder="TEL"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">E-MAIL</td>
				<td width="350" align="center"><input type="email"
					name="mem_email" size="40" placeholder="E-MAIL"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">RegisterNum</td>
				<td width="350" align="center"><input type="text"
					name="mem_resNum" size="40" placeholder="RegisterNum"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2"><input type="reset"
					value="RESET">&nbsp;&nbsp; <input type="submit"
					value="JOIN"></td>
			</tr>
		</table>
	</form>
</body>
</html>