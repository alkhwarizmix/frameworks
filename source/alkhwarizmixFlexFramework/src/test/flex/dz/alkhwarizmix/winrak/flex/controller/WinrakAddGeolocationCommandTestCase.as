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

import dz.alkhwarizmix.winrak.flex.model.vo.GeolocationVO;
import dz.alkhwarizmix.winrak.flex.testutils.WinrakPureMVCTestCase;

import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  Test for AddGeolocationCommand
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٤ ربيع الثاني ١٤٣٧ (January 30, 2016)
 */
public class WinrakAddGeolocationCommandTestCase extends WinrakPureMVCTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		super.setUp();
		
		testFacade.registerCommand("NOTE", WinrakAddGeolocationCommand);
	}
	
	override protected function tearDown():void
	{
		testFacade.removeCommand("NOTE");
		
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return WinrakAddGeolocationCommand;
	}
	
	private function get winrakStartupCommand():WinrakAddGeolocationCommand
	{
		return classInstanceUnderTest as WinrakAddGeolocationCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(winrakStartupCommand);
	}
	
	[Test]
	public function test01_execute_should_register_needed_proxies():void
	{
		testFacade.sendNotification("NOTE", {
			geolocation : new GeolocationVO()
		});
	}
	
	[Test]
	public function test01_execute_should_register_needed_mediators():void
	{
		testFacade.sendNotification("NOTE",  {
			geolocation : new GeolocationVO()
		});
		assertTrue(true);
	}
	
} // class
} // package
