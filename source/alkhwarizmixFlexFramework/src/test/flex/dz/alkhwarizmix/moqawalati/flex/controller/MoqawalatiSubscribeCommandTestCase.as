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

package dz.alkhwarizmix.moqawalati.flex.controller
{

import dz.alkhwarizmix.moqawalati.flex.testutils.MoqawalatiPureMVCTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;

/**
 *  <p>
 *  Test for MoqawalatiSubscribeCommand
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٥ ربيع الثاني ١٤٣٧ (January 31, 2016)
 */
public class MoqawalatiSubscribeCommandTestCase extends MoqawalatiPureMVCTestCase
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
		return MoqawalatiSubscribeCommand;
	}
	
	private function get moqawalatiSubscribeCommand():MoqawalatiSubscribeCommand
	{
		return classInstanceUnderTest as MoqawalatiSubscribeCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(moqawalatiSubscribeCommand);
	}
	
	[Test]
	public function test01_destination():void
	{
		assertEquals("userService", moqawalatiSubscribeCommand.destination);
	}
	
	[Test]
	public function test02_operationName():void
	{
		assertEquals("login", moqawalatiSubscribeCommand.operationName);
	}
	
	[Test]
	public function test03_proxyName():void
	{
		assertEquals("MoqawalatiSubscribeUserProxy", moqawalatiSubscribeCommand.proxyName);
	}
	
} // class
} // package
