////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٦ هجري، فارس بلحواس (Copyright 2014 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.moqawalati.flex.controller
{

import dz.alkhwarizmix.moqawalati.flex.interfaces.IMoqawalatiCommand;
import dz.alkhwarizmix.moqawalati.flex.testutils.MoqawalatiPureMVCTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٥ صفر ١٤٣٦ (December 17, 2014)
 */
public class MoqawalatiCommitRecordListCommandTestCase extends MoqawalatiPureMVCTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		super.setUp();
		
		registerMoqawalatiConfigProxy();
	}
	
	override protected function tearDown():void
	{
		removeMoqawalatiConfigProxy();
		
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return MoqawalatiCommitRecordListCommand;
	}
	
	private function get utMoqawalatiCommitRecordListCommand():MoqawalatiCommitRecordListCommand
	{
		return classInstanceUnderTest as MoqawalatiCommitRecordListCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_A_constructor():void
	{
		assertNotNull(utMoqawalatiCommitRecordListCommand);
	}
	
	[Test]
	public function test00_B_should_extend_MoqawalatiCommitRecordListCommand():void
	{
		assertTrue(utMoqawalatiCommitRecordListCommand is MoqawalatiCommitRecordListCommand);
	}
	
	[Test]
	public function test00_C_should_implement_IMoqawalatiCommand():void
	{
		assertTrue(utMoqawalatiCommitRecordListCommand is IMoqawalatiCommand);
	}
	
	[Test]
	public function test01_destination_should_be_same_as_backend_blazeds():void
	{
		assertEquals("recordBlazeDS", utMoqawalatiCommitRecordListCommand.destination);
	}
	
	[Test]
	public function test02_operationName_should_be_same_as_backend_blazeds():void
	{
		assertEquals("commitRecordList", utMoqawalatiCommitRecordListCommand.operationName);
	}
	
	[Test]
	public function test03_proxyName_should_be_same_as_RecordProxy_NAME():void
	{
		assertEquals("RecordProxy", utMoqawalatiCommitRecordListCommand.proxyName);
	}
	
	[Test]
	public function test04_amfURI():void
	{
		moqawalatiConfigProxy.appParameters.appURL = "http://dz.moqawalati.com/moqawalati.swf";
		assertEquals("http://dz.moqawalati.com/messagebroker/amf",
			utMoqawalatiCommitRecordListCommand.amfURI);
	}
	
} // class
} // package
