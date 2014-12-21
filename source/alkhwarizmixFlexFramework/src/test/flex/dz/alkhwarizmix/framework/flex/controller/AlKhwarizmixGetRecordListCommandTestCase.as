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

package dz.alkhwarizmix.framework.flex.controller
{

import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٤ صفر ١٤٣٦ (December 06, 2014)
 */
public class AlKhwarizmixGetRecordListCommandTestCase extends AlKhwarizmixTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		// NOOP
	}
	
	override protected function tearDown():void
	{
		// NOOP
	}
	
	override protected function get classUnderTest():Class
	{
		return AlKhwarizmixGetRecordListCommand;
	}
	
	private function get utAlKhwarizmixGetRecordListCommand():AlKhwarizmixGetRecordListCommand
	{
		return classInstanceUnderTest as AlKhwarizmixGetRecordListCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_A_constructor():void
	{
		assertNotNull(utAlKhwarizmixGetRecordListCommand);
	}
	
	[Test]
	public function test00_B_should_extend_AlKhwarizmixBlazeDSGetDataCommand():void
	{
		assertTrue(utAlKhwarizmixGetRecordListCommand is AlKhwarizmixBlazeDSGetDataCommand);
	}
	
	[Test]
	public function test01_destination_should_be_same_as_backend_blazeds():void
	{
		assertEquals("recordBlazeDS", utAlKhwarizmixGetRecordListCommand.destination);
	}
	
	[Test]
	public function test02_operationName_should_be_same_as_backend_blazeds():void
	{
		assertEquals("getRecordList", utAlKhwarizmixGetRecordListCommand.operationName);
	}
	
	[Test]
	public function test03_proxyName_should_be_same_as_RecordProxy_NAME():void
	{
		assertEquals("RecordProxy", utAlKhwarizmixGetRecordListCommand.proxyName);
	}
	
} // class
} // package
