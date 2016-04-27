<%@ page contentType="text/plain; charset=euc-kr" %>
<%@ page import = "tain.kr.com.proj.cosmarter.v01.bean.SimpleBean" %>
<%@ page import = "tain.kr.com.proj.cosmarter.v01.main.client.CoBeanClient" %>
<%
	boolean flag = true;

	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");

	SimpleBean bean = new SimpleBean();
	if (flag) bean.setIpAddr("cosmarter01");
	else bean.setIpAddr("cosmarter02");
	bean.setPort("7412");
	
	bean.setName("lstps");
	bean.setCmd("ps -ef | grep kang | grep -v grep | grep -v root");
	bean.setRetInfo("uid:1, pid:1, ppid:0, cpu:0, stime:1, tty:0, time:0, cmd:1");
	bean.setSkip("1");
	
	CoBeanClient.getInstance().process(bean);
	
	String message = bean.getResult();
%>
<%= message %>
