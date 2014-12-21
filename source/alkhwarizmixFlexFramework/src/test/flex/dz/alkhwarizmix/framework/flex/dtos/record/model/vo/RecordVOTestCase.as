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

package dz.alkhwarizmix.framework.flex.dtos.record.model.vo
{

import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٢ صفر ١٤٣٦ (December 04, 2014)
 */
public class RecordVOTestCase extends AlKhwarizmixTestCase
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
		return RecordVO;
	}
	
	private function get utRecordVO():RecordVO
	{
		return classInstanceUnderTest as RecordVO;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test01_constructor():void
	{
		assertNotNull(utRecordVO);
	}
	
	[Test]
	public function test01_recordId_setAndGet():void {
		var valueToSet:String = "recordId1";
		utRecordVO.recordId = valueToSet;
		assertEquals(valueToSet, utRecordVO.recordId);
	}
	
	[Test]
	public function test02_schemaName_setAndGet():void {
		var valueToSet:String = "schemaName";
		utRecordVO.schemaName = valueToSet;
		assertEquals(valueToSet, utRecordVO.schemaName);
	}
	
	[Test]
	public function test03_tableName_setAndGet():void {
		var valueToSet:String = "tableName";
		utRecordVO.tableName = valueToSet;
		assertEquals(valueToSet, utRecordVO.tableName);
	}
	
	[Test]
	public function test04_action_setAndGet():void {
		var valueToSet:int = RecordVO.INSERT_ACTION;
		utRecordVO.action = valueToSet;
		assertEquals(valueToSet, utRecordVO.action);
	}
	
	[Test]
	public function test05_data_setAndGet():void {
		var valueToSet:String = ARABIC_TEXT;
		utRecordVO.data = valueToSet;
		assertEquals(valueToSet, utRecordVO.data);
	}
	
} // class
} // package
