<%@ page contentType="text/plain; charset=euc-kr" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
%>

이름은 <%= name %> 입니다.


