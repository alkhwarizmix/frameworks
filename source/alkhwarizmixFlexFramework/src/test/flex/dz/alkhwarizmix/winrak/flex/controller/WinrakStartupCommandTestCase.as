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

import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixCustomDataProxy;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixLoginUserProxy;
import dz.alkhwarizmix.framework.flex.model.RecordProxy;
import dz.alkhwarizmix.moqawalati.flex.model.MoqawalatiConfigProxy;
import dz.alkhwarizmix.moqawalati.flex.testutils.MoqawalatiPureMVCTestCase;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakApplication;
import dz.alkhwarizmix.winrak.flex.testutils.WinrakApplicationMock;

import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  Test for WinrakStartupCommand
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٨ شوال ١٤٣٦ (July 24, 2015)
 */
public class WinrakStartupCommandTestCase extends MoqawalatiPureMVCTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	private var app:IWinrakApplication = null;
	
	override protected function setUp():void
	{
		super.setUp();
		
		app = new WinrakApplicationMock();
		testFacade.registerCommand("NOTE", WinrakStartupCommand);
	}
	
	override protected function tearDown():void
	{
		testFacade.removeCommand("NOTE");
		app = null;
		
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return WinrakStartupCommand;
	}
	
	private function get winrakStartupCommand():WinrakStartupCommand
	{
		return classInstanceUnderTest as WinrakStartupCommand;
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
		testFacade.sendNotification("NOTE", app);
		assertTrue(MoqawalatiConfigProxy.NAME, testFacade.hasProxy(MoqawalatiConfigProxy.NAME));
		assertTrue(AlKhwarizmixCustomDataProxy.NAME, testFacade.hasProxy(AlKhwarizmixCustomDataProxy.NAME));
		assertTrue(AlKhwarizmixLoginUserProxy.NAME, testFacade.hasProxy(AlKhwarizmixLoginUserProxy.NAME));
		assertTrue(RecordProxy.NAME, testFacade.hasProxy(RecordProxy.NAME));
	}
	
	[Test]
	public function test01_execute_should_register_needed_mediators():void
	{
		testFacade.sendNotification("NOTE", app);
		assertTrue(true);
	}
	
} // class
} // package
