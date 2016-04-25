<%@ page contentType="text/plain; charset=euc-kr" %>
<%@ page import = "tain.kr.com.proj.cosmarter.v01.bean.SimpleBean" %>
<%@ page import = "tain.kr.com.proj.cosmarter.v01.main.client.CoBeanClient" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");

	SimpleBean bean = new SimpleBean();
	bean.setIpAddr("cosmarter01");
	bean.setPort("7412");
	
	bean.setName("lstps");
	bean.setCmd("ps -ef");
	bean.setSkip("0");
	
	CoBeanClient.getInstance().process(bean);
	
	String message = bean.getResult();
%>
<%= message %>
