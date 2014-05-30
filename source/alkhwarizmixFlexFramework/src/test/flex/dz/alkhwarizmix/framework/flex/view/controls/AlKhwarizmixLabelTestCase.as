////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٤ هجري، فارس بلحواس (Copyright 2013 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.framework.flex.view.controls
{

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixLocalizable;
import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixUITestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٥ شوال ١٤٣٤ (September 1, 2013)
 */
public class AlKhwarizmixLabelTestCase extends AlKhwarizmixUITestCase 
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	[Before(async, ui)]
	override public function setUp():void
	{
		super.setUp();
	}
	
	[After(ui)]
	override public function tearDown():void
	{
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return AlKhwarizmixLabel;
	}
	
	private function get alKhwarizmixLabel():AlKhwarizmixLabel
	{
		return classInstanceUnderTest as AlKhwarizmixLabel;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test01_constructor():void
	{
		assertNotNull(alKhwarizmixLabel);
	}
	
	[Test]
	public function test02_should_implement_IAlKhwarizmixLocalizable():void
	{
		assertTrue(alKhwarizmixLabel is IAlKhwarizmixLocalizable);
	}
	
	[Test]
	public function test03_localize_function_should_not_be_null():void
	{
		assertNotNull(alKhwarizmixLabel.localize);
	}
	
	[Test]
	public function test04_localize_function_should_call_resource_localize():void
	{
		assertEquals("dz.alkhwarizmix.i18n.AlKhwarizmixLabelTestCaseKey.0",
			alKhwarizmixLabel.localize("AlKhwarizmixLabelTestCaseKey"));
		assertEquals("dz.alkhwarizmix.i18n.AlKhwarizmixLabelTestCaseKey.1",
			alKhwarizmixLabel.localize("AlKhwarizmixLabelTestCaseKey", [0]));
	}
	
	[Test]
	public function test05_resourceKeyPath_should_return_the_default_alkhwarizmix_path():void
	{
		assertEquals("dz.alkhwarizmix.i18n.", alKhwarizmixLabel.resourceKeyPath);
	}
	
} // class
} // package