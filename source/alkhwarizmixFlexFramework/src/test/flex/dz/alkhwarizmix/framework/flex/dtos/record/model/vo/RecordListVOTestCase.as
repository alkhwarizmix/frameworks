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

import mx.collections.ArrayCollection;

import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٨ صفر ١٤٣٦ (December 20, 2014)
 */
public class RecordListVOTestCase extends AlKhwarizmixTestCase
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
	
	override protected function get shouldNotHaveLogger():Boolean
	{
		return true;
	}
	
	override protected function get classUnderTest():Class
	{
		return RecordListVO;
	}
	
	private function get utRecordListVO():RecordListVO
	{
		return classInstanceUnderTest as RecordListVO;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test01_constructor():void
	{
		assertNotNull(utRecordListVO);
	}
	
	[Test]
	public function test01_A_list_never_returns_null():void
	{
		assertNotNull(utRecordListVO.list);
		utRecordListVO.list = null;
		assertNotNull(utRecordListVO.list);
	}
	
	[Test]
	public function test01_B_list_setAndGet():void
	{
		var valueToSet:ArrayCollection = new ArrayCollection();
		valueToSet.addItem(new RecordVO());
		utRecordListVO.list = valueToSet;
		assertEquals(1, utRecordListVO.list.length);
		assertEquals(valueToSet, utRecordListVO.list);
	}
	
} // class
} // package
