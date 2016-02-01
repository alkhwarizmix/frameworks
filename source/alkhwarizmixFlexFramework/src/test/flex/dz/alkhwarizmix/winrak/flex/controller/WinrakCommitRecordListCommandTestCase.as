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

import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakCommand;
import dz.alkhwarizmix.winrak.flex.testutils.WinrakPureMVCTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٥ ربيع الثاني ١٤٣٧ (January 31, 2016)
 */
public class WinrakCommitRecordListCommandTestCase extends WinrakPureMVCTestCase
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
		return WinrakCommitRecordListCommand;
	}
	
	private function get utWinrakCommitRecordListCommand():WinrakCommitRecordListCommand
	{
		return classInstanceUnderTest as WinrakCommitRecordListCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_A_constructor():void
	{
		assertNotNull(utWinrakCommitRecordListCommand);
	}
	
	[Test]
	public function test00_B_should_extend_WinrakCommitRecordListCommand():void
	{
		assertTrue(utWinrakCommitRecordListCommand is WinrakCommitRecordListCommand);
	}
	
	[Test]
	public function test00_C_should_implement_IWinrakCommand():void
	{
		assertTrue(utWinrakCommitRecordListCommand is IWinrakCommand);
	}
	
	[Test]
	public function test01_destination_should_be_same_as_backend_blazeds():void
	{
		assertEquals("recordBlazeDS", utWinrakCommitRecordListCommand.destination);
	}
	
	[Test]
	public function test02_operationName_should_be_same_as_backend_blazeds():void
	{
		assertEquals("commitRecordList", utWinrakCommitRecordListCommand.operationName);
	}
	
	[Test]
	public function test03_proxyName_should_be_same_as_RecordProxy_NAME():void
	{
		assertEquals("RecordProxy", utWinrakCommitRecordListCommand.proxyName);
	}
	
	[Test]
	public function test04_amfURI():void
	{
		winrakConfigProxy.appParameters.appURL = "http://dz.winrak.com/winrak.swf";
		assertEquals("http://dz.winrak.com/messagebroker/amf",
			utWinrakCommitRecordListCommand.amfURI);
	}
	
} // class
} // package
