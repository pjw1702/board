<!-- index.jsp(인덱스 페이지): 모든 웹 사이트에 있어서 가장 기본적으로 게시되는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<!-- 해당 URL로 접속했을 경우 login.jsp 페이지로 이동하게 하는 스크립트 -->
	<!-- href: 참조를 하는  키워드 -->
	<script>
		location.href = 'main.jsp'
	</script>
</body>
</html>