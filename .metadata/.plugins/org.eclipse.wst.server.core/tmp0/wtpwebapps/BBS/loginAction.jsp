<!-- 로그인을 DB와 연동하여 처리하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!-- 자바스크립트 문장을 작성하기 위한 라이브러리-->
<%@ page import="java.io.PrintWriter" %>
<!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있음 -->
<% request.setCharacterEncoding("UTF-8");%>
<!-- 자바 Beans 사용 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- user.UserDAO에서 선언한 userID와 userPassword 변수에 login.jsp에 들어오는 userID와 userPassword 값을 입력-->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		// 정상적으로 로그인이 된 회원의 userID 에게는 세션 값 부여
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		// 이미 로그인 되어있는 경우 동시 접속 불가
		if (userID != null) {	// 비밀번호가 일치하지 않는 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		} 
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		// 비밀번호가 일치할 경우
		if(result == 1) {
			// 로그인이 성공했을 때 세션 부여
			session.setAttribute("userID", user.getUserID());
			// PrintWriter: 스크립트 문장을 실행할 수 있게하는 클래스
			PrintWriter script = response.getWriter();
			// 스크립트 문장 실행
			script.println("<script>");
			// 링크를 삽입하여, 로그인 성공 시 main.jsp 페이지로 이동할 수 있게 한다
			script.println("location.href = 'main.jsp'");
			// 실행한 스크립트를 닫아준다
			script.println("</script>");
		} else if (result == 0) {	// 비밀번호가 일치하지 않는 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			// 이전 페이지로 돌아감(다시 로그인 페이지로 돌아감)
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -1) {	// 아이디가 존재하지 않는 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -2) {	// DB 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>