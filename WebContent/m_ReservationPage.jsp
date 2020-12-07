<%@ page import="movie_reservation.MovieDAO"%>
<%@ page import="movie_reservation.Bean"%>
<%@ page import="movie_reservation.Movie_Res_DAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script>
	// html 이 다 로딩된 후 실행
	$(document).ready(function() {
		// 체크박스들이 변경됬을때
		$(":checkbox").change(function() {
			var cnt = $("#peo_num").val();

			// 셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disable 처리
			if (cnt == $(":checkbox:checked").length) {
				$(":checkbox:not(:checked)").attr("disabled", "disabled");
			}
			// 체크된 갯수가 다르면 활성화 시킴
			else {
				$(":checkbox").removeAttr("disabled");
			}
		});

		// 셀렉트박스에서 다른 인원수를 선택하면 초기화 시킴
		$("#peo_num").change(function() {
			$(":checkbox").removeAttr("checked");
			$(":checkbox").removeAttr("disabled");
		});
	});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mbean" class="movie_reservation.Bean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>


	<%
		String mem_id = (String) session.getAttribute("mem_id");
	Movie_Res_DAO mrdao = new Movie_Res_DAO();
	
	Bean vec = mrdao.movieInfo(mbean.getMov_code());
	
	%>
	<h1 align="center">Movie Reservation</h1>
	<form action="m_ReservationInfo.jsp" method="post">
		<table align="center" border="1">
			<tr height="40">
				<td align="center" width="200">Title</td>
				<td align="center" width="300"><%=vec.getMov_title()%></td>
			</tr>
			<tr height="220">
				<td align="center" width="200">Poster</td>
				<td align="center" width="300"><img alt=""
					src="img/<%=vec.getMov_img()%>" width="170px" height="240px"></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">Genre</td>
				<td align="center" width="300"><%=vec.getMov_genre()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">Theater</td>
				<td align="center" width="300"><%=vec.getMov_theater()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">Date</td>
				<td align="center" width="300"><%=vec.getMov_date()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">Time</td>
				<td align="center" width="300"><%=vec.getMov_time()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">People</td>
				<td align="center" width="300"><select id="peo_num"
					name="peo_num">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
				</select></td>
			</tr>

			<tr height="220">
				<td align="center" width="200">Seat</td>
				<td align="center" width="300"><p align="center">[screen]</p>
					<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;4
						&nbsp;&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;&nbsp;8</h4>
					1&nbsp;&nbsp;&nbsp;<input type="checkbox" name="res_seat"
					value="1_1"> <input type="checkbox" name="res_seat"
					value="1_2"> <input type="checkbox" name="res_seat"
					value="1_3"> <input type="checkbox" name="res_seat"
					value="1_4"> <input type="checkbox" name="res_seat"
					value="1_5"> <input type="checkbox" name="res_seat"
					value="1_6"> <input type="checkbox" name="res_seat"
					value="1_7"> <input type="checkbox" name="res_seat"
					value="1_8"> <br> 2&nbsp;&nbsp;&nbsp;<input
					type="checkbox" name="res_seat" value="2_1"> <input
					type="checkbox" name="res_seat" value="2_2"> <input
					type="checkbox" name="res_seat" value="2_3"> <input
					type="checkbox" name="res_seat" value="2_4"> <input
					type="checkbox" name="res_seat" value="2_5"> <input
					type="checkbox" name="res_seat" value="2_6"> <input
					type="checkbox" name="res_seat" value="2_7"> <input
					type="checkbox" name="res_seat" value="2_8"> <br>
					3&nbsp;&nbsp;&nbsp;<input type="checkbox" name="res_seat"
					value="3_1"> <input type="checkbox" name="res_seat"
					value="3_2"> <input type="checkbox" name="res_seat"
					value="3_3"> <input type="checkbox" name="res_seat"
					value="3_4"> <input type="checkbox" name="res_seat"
					value="3_5"> <input type="checkbox" name="res_seat"
					value="3_6"> <input type="checkbox" name="res_seat"
					value="3_7"> <input type="checkbox" name="res_seat"
					value="3_8"> <br> 4&nbsp;&nbsp;&nbsp;<input
					type="checkbox" name="res_seat" value="4_1"> <input
					type="checkbox" name="res_seat" value="4_2"> <input
					type="checkbox" name="res_seat" value="4_3"> <input
					type="checkbox" name="res_seat" value="4_4"> <input
					type="checkbox" name="res_seat" value="4_5"> <input
					type="checkbox" name="res_seat" value="4_6"> <input
					type="checkbox" name="res_seat" value="4_7"> <input
					type="checkbox" name="res_seat" value="4_8"> <br>
					5&nbsp;&nbsp;&nbsp;<input type="checkbox" name="res_seat"
					value="5_1"> <input type="checkbox" name="res_seat"
					value="5_2"> <input type="checkbox" name="res_seat"
					value="5_3"> <input type="checkbox" name="res_seat"
					value="5_4"> <input type="checkbox" name="res_seat"
					value="5_5"> <input type="checkbox" name="res_seat"
					value="5_6"> <input type="checkbox" name="res_seat"
					value="5_7"> <input type="checkbox" name="res_seat"
					value="5_8"> <br></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="2">
				<input type="hidden" name="mov_price" value="<%=vec.getMov_price() %>">
				<input type="hidden" name="mov_code" value="<%=vec.getMov_code()%>">
				<input type="hidden" name="mov_title" value="<%=vec.getMov_title() %>">
				<input type="hidden" name="mov_date" value="<%=vec.getMov_date()%>">
				<input type="hidden" name="mov_genre" value="<%=vec.getMov_genre()%>">
				<input type="hidden" name="mov_time" value="<%=vec.getMov_time() %>">
				<input type="submit" value="RESERVATION">
				&nbsp;&nbsp; <input type="button" value="LIST"
					onclick="location.href='m_List.jsp'"></td>
			</tr>

		</table>
	

	</form>
</body>
</html>