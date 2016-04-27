<%@ page contentType="text/plain; charset=euc-kr" %>
<%@ page import = "tain.kr.com.proj.cosmarter.v01.bean.SimpleBean" %>
<%@ page import = "tain.kr.com.proj.cosmarter.v01.main.client.CoBeanClient" %>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");

	SimpleBean bean = new SimpleBean();
	if (true) bean.setIpAddr("cosmarter01");
	else bean.setIpAddr("cosmarter02");
	bean.setPort("7412");
	
	bean.setName("lstps");
	bean.setCmd("ps -ef");
	bean.setRetInfo("uid:1, pid:1, ppid:1, cpu:0, stime:1, tty:1, time:1, cmd:1");
	bean.setSkip("1");
	
	CoBeanClient.getInstance().process(bean);
	
	String message = bean.getResult();
%>
<%= message %>
