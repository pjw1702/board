/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.69
 * Generated at: 2022-12-20 04:43:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.PrintWriter;
import bbs.Bbs;
import bbs.BbsDAO;

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("bbs.Bbs");
    _jspx_imports_classes.add("bbs.BbsDAO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!-- index.jsp(인덱스 페이지): 모든 웹 사이트에 있어서 가장 기본적으로 게시되는 페이지 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<!-- 기본적으로 부트스트랩은 모바일, 컴퓨터 중 어느 기기로 접속을 해도 해상도에 맞게 알아서 변경되는 템플릿이다 -->\r\n");
      out.write("<!-- 반응형 웹에 적용 시킬 meta tag를 입력한다 -->\r\n");
      out.write("<meta http-equiv=\"Content-type\" content=\"text/html\" charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width\" initial-scale=\"1\">\r\n");
      out.write("<!-- 스타일 시트 참조 하는데, 그 스타일 시트 파일 경로는 css/bootstrap.css 파일이다 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.css\">\r\n");
      out.write("<title>JSP 게시판 웹 사이트</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<!-- 세션 값 부여 -->\r\n");
      out.write("	");

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
	
      out.write("\r\n");
      out.write("	<!-- 네비게이션 구현: 하나의 웹 사이트의 전반적인 구성을 보여주는 역할-->\r\n");
      out.write("	<nav class=\"navbar navbar-default\">\r\n");
      out.write("		<!-- 로고와 작은 화면일 때 생성되는 버튼(collapse 타입으로 토글하여 작은 화면일 때 안 보이는 매뉴를 보기 위한 버튼) 구현 부 -->\r\n");
      out.write("		<!-- header: 웹 페이지의 로고를 담는 영역 -->\r\n");
      out.write("		<div class=\"navbar-header\">\r\n");
      out.write("			<!-- 세 줄짜리 줄이 있는 버튼 구현 -->\r\n");
      out.write("			<!-- 세 줄짜리 버튼은 모바일 같이 작은 화면일 땐 나오지만 컴퓨터 같이 큰 화면일 땐 나오지 않는다 -->\r\n");
      out.write("			<button type=\"button\" class=\"navbar-toggle collapsed\"\r\n");
      out.write("				data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\"\r\n");
      out.write("				aria-expanded=\"false\">\r\n");
      out.write("				<!-- 버튼 내의 작대기-->\r\n");
      out.write("				<span class=\"icon-bar\"></span>\r\n");
      out.write("				<span class=\"icon-bar\"></span>\r\n");
      out.write("				<span class=\"icon-bar\"></span>\r\n");
      out.write("			</button>\r\n");
      out.write("			<!-- 로고를 입력하는 부분 -->\r\n");
      out.write("			<a class=\"navbar-brand\" href=\"main.jsp\">JSP 게시판 웹 사이트</a>\r\n");
      out.write("		</div> \r\n");
      out.write("		<!-- 세 줄짜리 버튼을 클릭했을 때 나타나게 되는 매뉴 -->\r\n");
      out.write("		<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("			<ul class=\"nav navbar-nav\">\r\n");
      out.write("				<li><a href=\"main.jsp\">메인</a></li>\r\n");
      out.write("				<li class=\"active\"><a href=\"bbs.jsp\">게시판</a></li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			<ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("				<li class=\"dropdown\">\r\n");
      out.write("					<!-- href=\"#\": 현재 가리키고 있는 링크가 없다는 것을 의미 -->\r\n");
      out.write("					<a href=\"#\" class=\"dropdown-toggle\"\r\n");
      out.write("						data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\r\n");
      out.write("						aria-expanded=\"false\">회원관리<span class=\"caret\"></span></a>\r\n");
      out.write("					<ul class=\"dropdown-menu\">\r\n");
      out.write("						<!-- class=\"active\": 현재 선택되어있는 화면 (ex: 로그인 화면일 경우 로그인 버튼에 파란색 불이 들어온다)-->\r\n");
      out.write("						<li><a href=\"logoutAction.jsp\">로그아웃</a></li>\r\n");
      out.write("					</ul>\r\n");
      out.write("				</li>\r\n");
      out.write("			</ul>\r\n");
      out.write("		</div>\r\n");
      out.write("	</nav>\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<!-- 사용자가 작성한 게시물은 writeAction.jsp 보내짐으로써 글이 등록됨 -->\r\n");
      out.write("			<form method=\"post\" action=\"updateAction.jsp?bbsID=");
      out.print(bbsID );
      out.write("\">\r\n");
      out.write("				<!-- table-triped: 홀수와 짝수 라인의 행의 색상이 번갈아가면서 나타남-->\r\n");
      out.write("				<table class=\"table table-triped\" style=\"text-align; center; border: 1px solid #dddddd\">\r\n");
      out.write("					<!-- thead: 테이블의 제목 부분(가장 윗줄): 각각의 속성을 알려 줌 -->\r\n");
      out.write("					<thead>\r\n");
      out.write("						<!-- tr: 테이블의 각각의 행 -->\r\n");
      out.write("						<tr>\r\n");
      out.write("							<!-- th: 각각의 속성을 명시 -->\r\n");
      out.write("							<!-- colspan: 열 너비 -->\r\n");
      out.write("							<th colspan=\"2\" style=\"background-color: #eeeeee; text-align: center;\">게시판 수정 양식</th>\r\n");
      out.write("						</tr>\r\n");
      out.write("					</thead>\r\n");
      out.write("					<!-- 테이블에 작성할 데이터 -->\r\n");
      out.write("					<tbody>\r\n");
      out.write("							<!-- tr로 각각 묶음: 글 제목과 글 내용이 각각 한 줄씩 나타나도록 함 -->\r\n");
      out.write("							<tr>\r\n");
      out.write("							<td><input type=\"text\" class=\"form-control\" placeholder=\"글 제목\" name=\"bbsTitle\" maxlength=\"50\" value=\"");
      out.print( bbs.getBbsTitle() );
      out.write("\"></td>\r\n");
      out.write("							</tr>\r\n");
      out.write("							<!-- textarea: 장문의 글을 작성할 때 사용 -->\r\n");
      out.write("							<tr>\r\n");
      out.write("							<td><textarea class=\"form-control\" placeholder=\"글 내용\" name=\"bbsContent\" maxlength=\"2048\" style=\"height: 350px;\">");
      out.print( bbs.getBbsContent() );
      out.write("</textarea></td>\r\n");
      out.write("							</tr>\r\n");
      out.write("					</tbody>\r\n");
      out.write("				</table>\r\n");
      out.write("				<input type=\"submit\" class=\"btn btn-primary pull-right\" value=\"수정\">\r\n");
      out.write("			</form>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<!-- 애니메이션을 담당할 자바스크립트 소스코드 파일의 경로 입력 -->\r\n");
      out.write("	<script src=\"https://code.jquery.com/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("	<script src=\"js/bootstrap.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
