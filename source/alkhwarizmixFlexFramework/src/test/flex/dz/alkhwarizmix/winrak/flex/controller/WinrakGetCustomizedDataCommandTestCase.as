////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٦ هجري، فارس بلحواس (Copyright 2015 Fares Belhaouas)  
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
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٤ شوال ١٤٣٦ (July 20, 2015)
 */
public class WinrakGetCustomizedDataCommandTestCase extends WinrakPureMVCTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		super.setUp();
		
		registerWinrakConfigProxy();
	}
	
	override protected function tearDown():void
	{
		removeWinrakConfigProxy();
		
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return WinrakGetCustomizedDataCommand;
	}
	
	private function get winrakGetCustomizedDataCommand():WinrakGetCustomizedDataCommand
	{
		return classInstanceUnderTest as WinrakGetCustomizedDataCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(winrakGetCustomizedDataCommand);
	}
	
	[Test]
	public function test01_destination():void
	{
		assertEquals("customizerService", winrakGetCustomizedDataCommand.destination);
	}
	
	[Test]
	public function test02_operationName():void
	{
		assertEquals("getCustomData", winrakGetCustomizedDataCommand.operationName);
	}
	
	[Test]
	public function test03_proxyName():void
	{
		assertEquals("WinrakCustomDataProxy", winrakGetCustomizedDataCommand.proxyName);
	}
	
} // class
} // package
