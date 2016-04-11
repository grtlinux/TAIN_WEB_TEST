/**
 * Copyright 2014, 2015, 2016 TAIN, Inc. all rights reserved.
 *
 * Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3, 29 June 2007 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.gnu.org/licenses/
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * -----------------------------------------------------------------
 * Copyright 2014, 2015, 2016 TAIN, Inc.
 *
 */
package tain.kr.common;

import java.util.ResourceBundle;

import org.apache.log4j.Logger;

/**
 * Code Templates > Comments > Types
 *
 * <PRE>
 *   -. FileName   : Version.java
 *   -. Package    : tain.kr.common
 *   -. Comment    :
 *   -. Author     : taincokr
 *   -. First Date : 2016. 3. 29. {time}
 * </PRE>
 *
 * @author taincokr
 *
 */
public class Version {

	private static boolean flag = true;

	private static final Logger log = Logger.getLogger(Version.class);

	///////////////////////////////////////////////////////////////////////////////////////////////
	
	private String clsName = null;
	
	private String desc = null;
	
	private Version() throws Exception {
		
		if (flag) {
			this.clsName = this.getClass().getName();
			
			ResourceBundle rb = ResourceBundle.getBundle(this.clsName.replace('.', '/'));
			
			this.desc = rb.getString("tain.kr.common.version.desc");
		}
	}
	
	public String getDesc() throws Exception {
		
		return this.desc;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	
	private static Version instance = null;
	
	public static synchronized Version getInstance() throws Exception {
		
		if (instance == null) {
			instance = new Version();
		}
		
		return instance;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////

	private static void test01(String[] args) throws Exception {
		
		if (flag) {
			log.debug(">>>>> " + Version.getInstance().getDesc());
		}
	}
	
	private static void test02(String[] args) throws Exception {
		
		if (flag) {
			try {
				System.out.println("Running...");         // 1
				throw new Exception("Hello, error.");    // 2
			} catch (Exception e) {
				System.out.println("Exception...");       // 3
				throw e;                                 // 5
			} finally {
				System.out.println("Finally");            // 4
			}
		}
	}
	
	public static void main(String[] args) throws Exception {
		
		if (flag) log.info(">>>>> " + new Object(){}.getClass().getEnclosingClass().getName());
		
		if (flag) test01(args);
		if (!flag) test02(args);
	}
}
