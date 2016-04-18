<%@ page contentType="text/plain; charset=euc-kr" %>
<%@ page import = "tain.kr.common.Version" %>
<%@ page import = "tain.kr.cosmarter.client.v01.CSN00001" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String version = Version.getInstance().getDesc();
	
	String message = CSN00001.getInstance().getMessage();
%>

이름은 <%= name %> 입니다. <%= version %>
<%= message %>

