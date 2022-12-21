<!-- 로그인을 DB와 연동하여 처리하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<!-- 자바스크립트 문장을 작성하기 위한 라이브러리-->
<%@ page import="java.io.PrintWriter" %>
<!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있음 -->
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
		} 
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		} if (bbsID == 0) {		// 현재 수정하고 하는 게시물의 번호가 입력되지 않았을 때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		// 수정하고자 하는 글의 작성자가 본인이 아닌 경우
		if(!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		} else {
			
			// 게시물 수정 시 어떠한 정보도 입력하지 않았을 때
			// 게시물의 제목과 내용 입력 시 null 값 혹은 빈칸인지 체크
			if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null 
			|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				// user 인스턴스가 join 메소드의 매개변수로 입력 됨
				int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
				// DB 오류
				if(result == -1) {
					// PrintWriter: 스크립트 문장을 실행할 수 있게하는 클래스
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
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