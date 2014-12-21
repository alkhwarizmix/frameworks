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
 *  @since  ٢٥ صفر ١٤٣٦ (December 17, 2014)
 */
public class AlKhwarizmixCommitRecordListCommandTestCase extends AlKhwarizmixTestCase
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
		return AlKhwarizmixCommitRecordListCommand;
	}
	
	private function get utAlKhwarizmixCommitRecordListCommand():AlKhwarizmixCommitRecordListCommand
	{
		return classInstanceUnderTest as AlKhwarizmixCommitRecordListCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_A_constructor():void
	{
		assertNotNull(utAlKhwarizmixCommitRecordListCommand);
	}
	
	[Test]
	public function test00_B_should_extend_AlKhwarizmixBlazeDSGetDataCommand():void
	{
		assertTrue(utAlKhwarizmixCommitRecordListCommand is AlKhwarizmixBlazeDSGetDataCommand);
	}
	
	[Test]
	public function test01_destination_should_be_same_as_backend_blazeds():void
	{
		assertEquals("recordBlazeDS", utAlKhwarizmixCommitRecordListCommand.destination);
	}
	
	[Test]
	public function test02_operationName_should_be_same_as_backend_blazeds():void
	{
		assertEquals("commitRecordList", utAlKhwarizmixCommitRecordListCommand.operationName);
	}
	
	[Test]
	public function test03_proxyName_should_be_same_as_RecordProxy_NAME():void
	{
		assertEquals("RecordProxy", utAlKhwarizmixCommitRecordListCommand.proxyName);
	}
	
} // class
} // package
