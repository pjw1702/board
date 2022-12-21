<!-- index.jsp(인덱스 페이지): 모든 웹 사이트에 있어서 가장 기본적으로 게시되는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<!-- 기본적으로 부트스트랩은 모바일, 컴퓨터 중 어느 기기로 접속을 해도 해상도에 맞게 알아서 변경되는 템플릿이다 -->
<!-- 반응형 웹에 적용 시킬 meta tag를 입력한다 -->
<meta http-equiv="Content-type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일 시트 참조 하는데, 그 스타일 시트 파일 경로는 css/bootstrap.css 파일이다 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<!-- 세션 값 부여 -->
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} if (userID == null) {
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
		}
	%>
	<!-- 네비게이션 구현: 하나의 웹 사이트의 전반적인 구성을 보여주는 역할-->
	<nav class="navbar navbar-default">
		<!-- 로고와 작은 화면일 때 생성되는 버튼(collapse 타입으로 토글하여 작은 화면일 때 안 보이는 매뉴를 보기 위한 버튼) 구현 부 -->
		<!-- header: 웹 페이지의 로고를 담는 영역 -->
		<div class="navbar-header">
			<!-- 세 줄짜리 줄이 있는 버튼 구현 -->
			<!-- 세 줄짜리 버튼은 모바일 같이 작은 화면일 땐 나오지만 컴퓨터 같이 큰 화면일 땐 나오지 않는다 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!-- 버튼 내의 작대기-->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- 로고를 입력하는 부분 -->
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div> 
		<!-- 세 줄짜리 버튼을 클릭했을 때 나타나게 되는 매뉴 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<!-- href="#": 현재 가리키고 있는 링크가 없다는 것을 의미 -->
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!-- class="active": 현재 선택되어있는 화면 (ex: 로그인 화면일 경우 로그인 버튼에 파란색 불이 들어온다)-->
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<!-- 사용자가 작성한 게시물은 writeAction.jsp 보내짐으로써 글이 등록됨 -->
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID %>">
				<!-- table-triped: 홀수와 짝수 라인의 행의 색상이 번갈아가면서 나타남-->
				<table class="table table-triped" style="text-align; center; border: 1px solid #dddddd">
					<!-- thead: 테이블의 제목 부분(가장 윗줄): 각각의 속성을 알려 줌 -->
					<thead>
						<!-- tr: 테이블의 각각의 행 -->
						<tr>
							<!-- th: 각각의 속성을 명시 -->
							<!-- colspan: 열 너비 -->
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 수정 양식</th>
						</tr>
					</thead>
					<!-- 테이블에 작성할 데이터 -->
					<tbody>
							<!-- tr로 각각 묶음: 글 제목과 글 내용이 각각 한 줄씩 나타나도록 함 -->
							<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
							</tr>
							<!-- textarea: 장문의 글을 작성할 때 사용 -->
							<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
							</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="수정">
			</form>
		</div>
	</div>
	<!-- 애니메이션을 담당할 자바스크립트 소스코드 파일의 경로 입력 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>