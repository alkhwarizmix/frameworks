////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٧ هجري، فارس بلحواس (Copyright 2016 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.winrak.flex.controller
{

import dz.alkhwarizmix.winrak.flex.testutils.WinrakPureMVCTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;

/**
 *  <p>
 *  Test for WinrakLoginCommand
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٥ ربيع الثاني ١٤٣٧ (January 31, 2016)
 */
public class WinrakLoginCommandTestCase extends WinrakPureMVCTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		super.setUp();
	}
	
	override protected function tearDown():void
	{
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return WinrakLoginCommand;
	}
	
	private function get moqawalatiLoginCommand():WinrakLoginCommand
	{
		return classInstanceUnderTest as WinrakLoginCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(moqawalatiLoginCommand);
	}
	
	[Test]
	public function test01_destination():void
	{
		assertEquals("userService", moqawalatiLoginCommand.destination);
	}
	
	[Test]
	public function test02_operationName():void
	{
		assertEquals("login", moqawalatiLoginCommand.operationName);
	}
	
	[Test]
	public function test03_proxyName():void
	{
		assertEquals("WinrakLoginUserProxy", moqawalatiLoginCommand.proxyName);
	}
	
} // class
} // package
