----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
1. Windows7 ȯ�濡�� EclispeEE luna�� Tomcat7 ����

	���� �Ʒ��� ���α׷����� ��ġ�Ѵ�. ������ Ǯ�ų� ���
	
		apache-tomcat-7.0.68-x64
		
		eclipse-jee-luna-SR2-win32-x86_64
		
		jdk1.7.0_79
	
	�� ���α׷��� ������ ������ �ϰ� ������ �����Ѵ�.
	Eclipse > Server �ǿ��� [No servers are available. Click this link to create a new server.]�� �����Ͽ�
	apache-tomcat-7.0.68-x64 ������ �����Ѵ�.
	�׸���, [Add and Remove] ���̾�α׿��� ���ʿ��� ������ ������Ʈ�� �����Ͽ� ������ �ڽ��� �Ű� ���´�.
	[Finish] ��ư�� Ŭ���Ͽ� ��ģ��.

	�������� Ȯ���Ѵ�.
	
		http://localhost:8080/WEB_TEST

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
[����] http://linuxism.tistroy.com/252


2. Windows7 ȯ�濡�� Tomcat7�� manual�� ����

	���� �Ʒ��� ȯ�溯���� ��´�.
	
		set CATALINA=M:\PROG\apache-tomcat-7.0.68-x64
		
	�Ʒ��� ������ �����Ѵ�.
	
		%CATALINA%/conf/server.xml   : ��ü ������ ���� ���� ������ �ϴ� ����
		
		%CATALINA%/conf/context.xml  : server.xml�� <context> ��Ҹ� ������ ���� ��
		
		%CATALINA%/conf/web.xml      : ������ URI �����ϴ� ����
		
			[�߰�����]
			Tomcat5 ���ĺ��� server.xml�� <Context> ��Ҹ� ���� ������� �ʵ��� ��õ�ϰ� �ִ�.
			�� �����δ� <Context> ��Ҵ� ���� ������ ���ɼ��� ������,
			server.xml�� ������ ��⵿���� �ʴ� �� �����Ǵ��� �� �ν� ���� �ʱ� �����̴�.
			
			$CATALINA_BASE/conf/context.xml
				��� webapps�� ����ȴ�.
			
			$CATALINA_BASE/conf/[enginename]/[hostname]/context.xml.default
				�ش� �ӽ��� ��� webapps�� ����ȴ�.

			$CATALINA_BASE/conf/[enginename]/[hostname]/
				���� ���丮�� "context-path" xml ������ ������ �ش� context-path���� ����ȴ�.
				WAR package/META-INF/context.xml ������ �ڵ����� �� ���丮�� ����ȴٰ� �Ѵ�.
				������ ������ ������ ���̻� �������� �ʴ´ٰ� �Ѵ�.



	���� ������ �����Ѵ�.
	
		%CATALINA%/bin/startup.bat
	
	�������� Ȯ���Ѵ�.
	
		http://localhost:8080/
		

		startup.bat
		catalina.bat
		setclasspath.bat
		
		startup.bat
		start "Tomcat" "M:\PROG\jdk1.7.0_79\jre\bin\java.exe" -Djava.util.logging.config.file="M:\PROG\apache-tomcat-7.0.68-x64\conf\logging.properties" -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.endorsed.dirs="M:\PROG\apache-tomcat-7.0.68-x64\endorsed" -classpath "M:\PROG\apache-tomcat-7.0.68-x64\bin\bootstrap.jar;M:\PROG\apache-tomcat-7.0.68-x64\bin\tomcat-juli.jar" -Dcatalina.base="M:\PROG\apache-tomcat-7.0.68-x64" -Dcatalina.home="M:\PROG\apache-tomcat-7.0.68-x64" -Djava.io.tmpdir="M:\PROG\apache-tomcat-7.0.68-x64\temp" org.apache.catalina.startup.Bootstrap start

		shutdown.bat
		               "M:\PROG\jdk1.7.0_79\jre\bin\java.exe" -Djava.util.logging.config.file="M:\PROG\apache-tomcat-7.0.68-x64\conf\logging.properties" -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.endorsed.dirs="M:\PROG\apache-tomcat-7.0.68-x64\endorsed" -classpath "M:\PROG\apache-tomcat-7.0.68-x64\bin\bootstrap.jar;M:\PROG\apache-tomcat-7.0.68-x64\bin\tomcat-juli.jar" -Dcatalina.base="M:\PROG\apache-tomcat-7.0.68-x64" -Dcatalina.home="M:\PROG\apache-tomcat-7.0.68-x64" -Djava.io.tmpdir="M:\PROG\apache-tomcat-7.0.68-x64\temp" org.apache.catalina.startup.Bootstrap  stop





----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
3. Linux BT5r2 ȯ�濡�� Tomcat7�� manual�� ����

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
4. SVN �� ����Ͽ� �۾�


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
5. GitHub �� ����Ͽ� �۾�



----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
[ server.xml�� ���� ]

	����
	
		<Server port="8005" shutdown="SHUTDOWN">                                     : server.xml�� root element, server�� shutdown port�� ������
		
			<Service name="Catalina">                                                : server�� 1�� �̻��� service�� ���� �� ������, ������ server.xml�� �и��ؼ� ����. service�� �������� ��Ĺ�� ����. 
		
				<Connector port="8080" protocol="HTTP/1.1">                          : Connector���� HTTP, AJP(Apache Jserv Protocol), client�� ��û�� �ְ� ������ �޴� interface�̴�.
		
				<Connector port="8009" protocol="AJP/1.3">                           : Apache Jserv Protocol
		
					<Engine name="Catalina" defaultHost="localhost">                 : Engine�� ������ Host�� ó���� �ѱ�� ������ �Ѵ�.
		
						<Realm>                                                      : Realm, Valve Component�� �̿��ϸ� database����, Single Sign On
		
						<Valve>
		
						<Logger>                                                     : Access Log�� �ΰ������ �̿� �� �� �ִ�.
		
						<Host appBase="webapps">                                     : ���� ȣ��Ʈ�� ����
		
							<Context path="" docBase="C:\workspace\project\WIKI">    : ���� ȣ��Ʈ���� �����ϴ� �ϳ��� �� ���ø����̼�
		
							<Valve>
		
							<Realm>
		
							<Logger>
			



----------------------------------------------------------------------------------------------------
[ ��Ĺ�� �⺻ Document Root ]

	- ��Ĺ�� �⺻ Document Root�� webapps/ROOT �̴�
	- server.xml�� <Host> ĳ�״� �Ʒ��� ���̼����Ǿ� �ְ�, <Context>�±״� �����Ǿ� �ִ�.
	- appBase�� $CATALINA_HOE ���丮 �� ����θ� �⺻ ���ڷ� �޴´�.
	- <Context> �±װ� �����Ǿ� ������ �⺻���� ��Ʈ�� ROOT ���丮 ���� �ȴ�.
	- �� �⺻���� Document Root�� $CATALINA_HOME/webapps/ROOT �� �ȴ�.


----------------------------------------------------------------------------------------------------
	
----------------------------------------------------------------------------------------------------

[ M:/PROG/apache-tomcat-7.0.68-x64/conf/server.xml ]
	<?xml version='1.0' encoding='utf-8'?>
	<!--
	  Licensed to the Apache Software Foundation (ASF) under one or more
	  contributor license agreements.  See the NOTICE file distributed with
	  this work for additional information regarding copyright ownership.
	  The ASF licenses this file to You under the Apache License, Version 2.0
	  (the "License"); you may not use this file except in compliance with
	  the License.  You may obtain a copy of the License at
	
	      http://www.apache.org/licenses/LICENSE-2.0
	
	  Unless required by applicable law or agreed to in writing, software
	  distributed under the License is distributed on an "AS IS" BASIS,
	  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	  See the License for the specific language governing permissions and
	  limitations under the License.
	-->
	<!-- Note:  A "Server" is not itself a "Container", so you may not
	     define subcomponents such as "Valves" at this level.
	     Documentation at /docs/config/server.html
	 -->
	<Server port="8005" shutdown="SHUTDOWN">
	  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
	  <!-- Security listener. Documentation at /docs/config/listeners.html
	  <Listener className="org.apache.catalina.security.SecurityListener" />
	  -->
	  <!--APR library loader. Documentation at /docs/apr.html -->
	  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
	  <!--Initialize Jasper prior to webapps are loaded. Documentation at /docs/jasper-howto.html -->
	  <Listener className="org.apache.catalina.core.JasperListener" />
	  <!-- Prevent memory leaks due to use of particular java/javax APIs-->
	  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
	  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
	  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />
	
	  <!-- Global JNDI resources
	       Documentation at /docs/jndi-resources-howto.html
	  -->
	  <GlobalNamingResources>
	    <!-- Editable user database that can also be used by
	         UserDatabaseRealm to authenticate users
	    -->
	    <Resource name="UserDatabase" auth="Container"
	              type="org.apache.catalina.UserDatabase"
	              description="User database that can be updated and saved"
	              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
	              pathname="conf/tomcat-users.xml" />
	  </GlobalNamingResources>
	
	  <!-- A "Service" is a collection of one or more "Connectors" that share
	       a single "Container" Note:  A "Service" is not itself a "Container",
	       so you may not define subcomponents such as "Valves" at this level.
	       Documentation at /docs/config/service.html
	   -->
	  <Service name="Catalina">
	
	    <!--The connectors can use a shared executor, you can define one or more named thread pools-->
	    <!--
	    <Executor name="tomcatThreadPool" namePrefix="catalina-exec-"
	        maxThreads="150" minSpareThreads="4"/>
	    -->
	
	
	    <!-- A "Connector" represents an endpoint by which requests are received
	         and responses are returned. Documentation at :
	         Java HTTP Connector: /docs/config/http.html (blocking & non-blocking)
	         Java AJP  Connector: /docs/config/ajp.html
	         APR (HTTP/AJP) Connector: /docs/apr.html
	         Define a non-SSL HTTP/1.1 Connector on port 8080
	    -->
	    <Connector port="8080" protocol="HTTP/1.1"
	               connectionTimeout="20000"
	               redirectPort="8443" />
	    <!-- A "Connector" using the shared thread pool-->
	    <!--
	    <Connector executor="tomcatThreadPool"
	               port="8080" protocol="HTTP/1.1"
	               connectionTimeout="20000"
	               redirectPort="8443" />
	    -->
	    <!-- Define a SSL HTTP/1.1 Connector on port 8443
	         This connector uses the BIO implementation that requires the JSSE
	         style configuration. When using the APR/native implementation, the
	         OpenSSL style configuration is required as described in the APR/native
	         documentation -->
	    <!--
	    <Connector port="8443" protocol="org.apache.coyote.http11.Http11Protocol"
	               maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
	               clientAuth="false" sslProtocol="TLS" />
	    -->
	
	    <!-- Define an AJP 1.3 Connector on port 8009 -->
	    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" />
	
	
	    <!-- An Engine represents the entry point (within Catalina) that processes
	         every request.  The Engine implementation for Tomcat stand alone
	         analyzes the HTTP headers included with the request, and passes them
	         on to the appropriate Host (virtual host).
	         Documentation at /docs/config/engine.html -->
	
	    <!-- You should set jvmRoute to support load-balancing via AJP ie :
	    <Engine name="Catalina" defaultHost="localhost" jvmRoute="jvm1">
	    -->
	    <Engine name="Catalina" defaultHost="localhost">
	
	      <!--For clustering, please take a look at documentation at:
	          /docs/cluster-howto.html  (simple how to)
	          /docs/config/cluster.html (reference documentation) -->
	      <!--
	      <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster"/>
	      -->
	
	      <!-- Use the LockOutRealm to prevent attempts to guess user passwords
	           via a brute-force attack -->
	      <Realm className="org.apache.catalina.realm.LockOutRealm">
	        <!-- This Realm uses the UserDatabase configured in the global JNDI
	             resources under the key "UserDatabase".  Any edits
	             that are performed against this UserDatabase are immediately
	             available for use by the Realm.  -->
	        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
	               resourceName="UserDatabase"/>
	      </Realm>
	
	      <!-- root base -->
	      <Host name="localhost"  appBase="M:/WORK/WEB/webapps" unpackWARs="true" autoDeploy="true">
	
			<!-- Context path="" docBase="ROOT" reloadable="true"/ --> <!-- default context -->
			<Context path="" docBase="ROOT" reloadable="true"/>
			
			
	        <!-- SingleSignOn valve, share authentication between web applications
	             Documentation at: /docs/config/valve.html -->
	        <!--
	        <Valve className="org.apache.catalina.authenticator.SingleSignOn" />
	        -->
	
	        <!-- Access log processes all example.
	             Documentation at: /docs/config/valve.html
	             Note: The pattern used is equivalent to using pattern="common" -->
	        <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
	               prefix="localhost_access_log." suffix=".txt"
	               pattern="%h %l %u %t &quot;%r&quot; %s %b" />
	
	      </Host>
	    </Engine>
	  </Service>
	</Server>
	

----------------------------------------------------------------------------------------------------

[ M:/PROG/apache-tomcat-7.0.68-x64/conf/Catalina/localhost/WEB_TEST01.xml ]

	<Context
		path="/WEB_TEST01"
		docBase="M:/WORK/WEB/WEB_CONTEXT/WEB_TEST01"
		debug="0"
		reloadable="true"
		privileged="true"
		autoDeploy="true">
	
		<Logger
			className="org.apache.catalina.logger.FileLogger"
			directory="logs"
			prefix="localhost_WEB_TEST."
			suffix=".log"
			timestamp="true"/>
		
	    <!-- Default set of monitored resources -->
	
	    <!-- Uncomment this to disable session persistence across Tomcat restarts -->
	    <!--
	    <Manager pathname="" />
	    -->
	
	    <!-- Uncomment this to enable Comet connection tacking (provides events
	         on session expiration as well as webapp lifecycle) -->
	    <!--
	    <Valve className="org.apache.catalina.valves.CometConnectionManagerValve" />
	    -->
	
	</Context>


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

