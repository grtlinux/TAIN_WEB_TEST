<%@ page contentType="text/plain; charset=euc-kr" %>
<%@ page import = "tain.kr.common.Version" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String version = Version.getInstance().getDesc();
%>

�̸��� <%= name %> �Դϴ�. <%= version %>

