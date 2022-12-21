<!-- 로그인을 DB와 연동하여 처리하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<!-- 자바스크립트 문장을 작성하기 위한 라이브러리-->
<%@ page import="java.io.PrintWriter" %>
<!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있음 -->
<% request.setCharacterEncoding("UTF-8");%>
<!-- 자바 Beans 사용 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<!-- user.UserDAO에서 선언한 userID와 userPassword 등의 변수에 login.jsp에 들어오는 userID와 userPassword 등의 값을 입력-->
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
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
		// 글쓰기 같은 경우에는 로그인 되어있어야 하므로 변경한다
		if (userID == null) {	// 비밀번호가 일치하지 않는 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			
			// 게시물 등록 시 어떠한 정보도 입력하지 않았을 때
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				// user 인스턴스가 join 메소드의 매개변수로 입력 됨
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				// DB 오류
				if(result == -1) {
					// PrintWriter: 스크립트 문장을 실행할 수 있게하는 클래스
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {	// 회원가입 성공 시 로그인 페이지로 이동(아이디가 이미 존재하는 경우를 제외하면 모두 회원가입 성공)
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				} 
			}
			
		}
	%>
</body>
</html>