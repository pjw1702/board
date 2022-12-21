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
<!-- user.UserDAO에서 선언한 userID와 userPassword 등의 변수에 login.jsp에 들어오는 userID와 userPassword 등의 값을 입력-->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		// 로그인이 된 사람은 회원가입 페이지에 접속 불가
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
		// 입력이 안된 사항이 있을 경우
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			// user 인스턴스가 join 메소드의 매개변수로 입력 됨
			int result = userDAO.join(user);
			// 비밀번호가 일치할 경우
			if(result == -1) {
				// PrintWriter: 스크립트 문장을 실행할 수 있게하는 클래스
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {	// 회원가입 성공 시 로그인 페이지로 이동(아이디가 이미 존재하는 경우를 제외하면 모두 회원가입 성공)
				// 회원가입 성공 시 세션 부여
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				// 이전 페이지로 돌아감(다시 로그인 페이지로 돌아감)
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			} 
		}
	%>
</body>
</html>