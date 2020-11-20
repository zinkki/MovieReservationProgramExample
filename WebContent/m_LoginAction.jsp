<%@ page import="java.io.PrintWriter"%>
<%@ page import="movie_reservation.MemberBean"%>
<%@ page import="movie_reservation.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="mbean" class="movie_reservation.MemberBean">
		<jsp:setProperty name="mbean" property="mem_id" />
		<jsp:setProperty name="mbean" property="mem_pass1" />
	</jsp:useBean>

	<%
	//로그인
	MemberDAO mdao = new MemberDAO();
	
	int result = mdao.login(mbean.getMem_id(), mbean.getMem_pass1());
	
	//로그인성공
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('LOGIN SUCCESS!')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		
		session.setAttribute("mem_id", mbean.getMem_id());
		session.setAttribute("mem_pass1", mbean.getMem_pass1());
		
		session.setMaxInactiveInterval(60*2);
		
		response.sendRedirect("main.jsp");
	//비밀번호 틀렸을때
	}else if(result==0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('PASSWORD IS NOT CORRECTED!!')");
		script.println("history.go(-1)");
		script.println("</script>");
	//존재하지않는아이디
	}else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('NON-EXISTENT ID')");
		script.println("history.go(-1)");
		script.println("</script>");
	//db연결실패ㅠ
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('FAILED DB CONNECTED')");
		script.println("history.go(-1)");
		script.println("</script>");
	}


%>

</body>
</html>