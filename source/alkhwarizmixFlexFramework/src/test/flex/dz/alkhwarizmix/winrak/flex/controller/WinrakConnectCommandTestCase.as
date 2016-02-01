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
 *  Test for WinrakConnectCommand
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٥ ربيع الثاني ١٤٣٧ (January 31, 2016)
 */
public class WinrakConnectCommandTestCase extends WinrakPureMVCTestCase
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
		return WinrakConnectCommand;
	}
	
	private function get winrakConnectCommand():WinrakConnectCommand
	{
		return classInstanceUnderTest as WinrakConnectCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(winrakConnectCommand);
	}
	
	[Test]
	public function test01_destination():void
	{
		assertEquals("userService", winrakConnectCommand.destination);
	}
	
	[Test]
	public function test02_operationName():void
	{
		assertEquals("login", winrakConnectCommand.operationName);
	}
	
	[Test]
	public function test03_proxyName():void
	{
		assertEquals("WinrakConnectUserProxy", winrakConnectCommand.proxyName);
	}
	
} // class
} // package
