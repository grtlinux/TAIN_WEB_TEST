----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
1. Windows7 환경에서 EclispeEE luna와 Tomcat7 실행

	먼저 아래의 프로그램들을 설치한다. 압축을 풀거나 등등
	
		apache-tomcat-7.0.68-x64
		
		eclipse-jee-luna-SR2-win32-x86_64
		
		jdk1.7.0_79
	
	위 프로그램을 적당히 설정을 하고 다음을 진행한다.
	Eclipse > Server 탭에서 [No servers are available. Click this link to create a new server.]를 선택하여
	apache-tomcat-7.0.68-x64 폴더를 선택한다.
	그리고, [Add and Remove] 다이얼로그에서 왼쪽에서 적당한 프로젝트를 선택하여 오른쪽 박스로 옮겨 놓는다.
	[Finish] 버튼을 클릭하여 마친다.

	브라우저로 확인한다.
	
		http://localhost:8080/WEB_TEST

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
[참조] http://linuxism.tistroy.com/252


2. Windows7 환경에서 Tomcat7을 manual로 실행

	먼저 아래의 환경변수를 잡는다.
	
		set CATALINA=M:\PROG\apache-tomcat-7.0.68-x64
		
	아래의 파일을 검토한다.
	
		%CATALINA%/conf/server.xml   : 전체 서블릿에 대한 공통 설정을 하는 파일
		
		%CATALINA%/conf/context.xml  : server.xml의 <context> 요소를 밖으로 빼낸 것
		
		%CATALINA%/conf/web.xml      : 서블릿과 URI 매핑하는 파일
		
			[추가설명]
			Tomcat5 이후부터 server.xml에 <Context> 요소를 직접 기술하지 않도록 추천하고 있다.
			그 이유로는 <Context> 요소는 자주 수정될 가능성이 있으나,
			server.xml은 서버를 재기동하지 않는 한 수정되더라도 재 인식 되지 않기 때문이다.
			
			$CATALINA_BASE/conf/context.xml
				모든 webapps에 적용된다.
			
			$CATALINA_BASE/conf/[enginename]/[hostname]/context.xml.default
				해당 머신의 모든 webapps에 적용된다.

			$CATALINA_BASE/conf/[enginename]/[hostname]/
				위의 디렉토리의 "context-path" xml 형식의 파일은 해당 context-path에만 적용된다.
				WAR package/META-INF/context.xml 파일이 자동으로 이 디렉토리에 복사된다고 한다.
				하지만 파일이 있으면 더이상 복사하지 않는다고 한다.



	다음 파일을 실행한다.
	
		%CATALINA%/bin/startup.bat
	
	브라우저로 확인한다.
	
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
3. Linux BT5r2 환경에서 Tomcat7을 manual로 실행

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
4. SVN 을 사용하여 작업


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
5. GitHub 를 사용하여 작업



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
[ server.xml의 이해 ]

	구조
	
		<Server port="8005" shutdown="SHUTDOWN">                                     : server.xml의 root element, server의 shutdown port를 지정함
		
			<Service name="Catalina">                                                : server는 1개 이상의 service를 가질 수 있지만, 보통은 server.xml을 분리해서 관리. service는 독립적인 톰캣의 서비스. 
		
				<Connector port="8080" protocol="HTTP/1.1">                          : Connector에는 HTTP, AJP(Apache Jserv Protocol), client와 요청을 주고 응답을 받는 interface이다.
		
				<Connector port="8009" protocol="AJP/1.3">                           : Apache Jserv Protocol
		
					<Engine name="Catalina" defaultHost="localhost">                 : Engine은 적절한 Host로 처리를 넘기는 역할을 한다.
		
						<Realm>                                                      : Realm, Valve Component를 이용하면 database연결, Single Sign On
		
						<Valve>
		
						<Logger>                                                     : Access Log등 부가기능을 이용 할 수 있다.
		
						<Host appBase="webapps">                                     : 가상 호스트를 정의
		
							<Context path="" docBase="C:\workspace\project\WIKI">    : 가상 호스트에서 동작하는 하나의 웹 어플리케이션
		
							<Valve>
		
							<Realm>
		
							<Logger>
			



----------------------------------------------------------------------------------------------------
[ 톰캣의 기본 Document Root ]

	- 톰캣의 기본 Document Root는 webapps/ROOT 이다
	- server.xml의 <Host> 캐그는 아래와 같이설정되어 있고, <Context>태그는 생략되어 있다.
	- appBase는 $CATALINA_HOE 디렉토리 믿 상대경로를 기본 인자로 받는다.
	- <Context> 태그가 생략되어 있으면 기본적인 루트는 ROOT 디렉토리 밑이 된다.
	- 즉 기본적인 Document Root는 $CATALINA_HOME/webapps/ROOT 가 된다.


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

