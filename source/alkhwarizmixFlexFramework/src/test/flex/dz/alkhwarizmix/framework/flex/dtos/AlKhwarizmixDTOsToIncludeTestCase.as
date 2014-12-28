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

package dz.alkhwarizmix.framework.flex.dtos
{

import dz.alkhwarizmix.framework.flex.dtos.customize.model.vo.CustomDataVO;
import dz.alkhwarizmix.framework.flex.dtos.record.model.vo.RecordListVO;
import dz.alkhwarizmix.framework.flex.dtos.record.model.vo.RecordVO;
import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixTestCase;

import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٨ صفر ١٤٣٦ (December 20, 2014)
 */
public class AlKhwarizmixDTOsToIncludeTestCase extends AlKhwarizmixTestCase
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
		return AlKhwarizmixDTOsToInclude;
	}
	
	private function get utAlKhwarizmixDTOsToInclude():AlKhwarizmixDTOsToInclude
	{
		return classInstanceUnderTest as AlKhwarizmixDTOsToInclude;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(utAlKhwarizmixDTOsToInclude);
	}
	
	[Test]
	public function test01_CustomDataVO_was_registered():void
	{
		assertTrue(utAlKhwarizmixDTOsToInclude.isClassRegistered(CustomDataVO));
	}
	
	[Test]
	public function test02_RecordVO_was_registered():void
	{
		assertTrue(utAlKhwarizmixDTOsToInclude.isClassRegistered(RecordVO));
	}
	
	[Test]
	public function test02_RecordListVO_was_registered():void
	{
		assertTrue(utAlKhwarizmixDTOsToInclude.isClassRegistered(RecordListVO));
	}
	
} // class
} // package
