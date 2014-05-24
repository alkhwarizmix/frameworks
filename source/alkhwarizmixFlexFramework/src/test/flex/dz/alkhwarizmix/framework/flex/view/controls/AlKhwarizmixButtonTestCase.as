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
public class AlKhwarizmixButtonTestCase extends AlKhwarizmixUITestCase 
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
		return AlKhwarizmixButton;
	}
	
	private function get alKhwarizmixButton():AlKhwarizmixButton
	{
		return classInstanceUnderTest as AlKhwarizmixButton;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test01_constructor():void
	{
		assertNotNull(alKhwarizmixButton);
	}
	
	[Test]
	public function test02_should_implement_IAlKhwarizmixLocalizable():void
	{
		assertTrue(alKhwarizmixButton is IAlKhwarizmixLocalizable);
	}
	
	[Test]
	public function test03_localize_function_should_not_be_null():void
	{
		assertNotNull(alKhwarizmixButton.localize);
	}
	
	[Test]
	public function test04_localize_function_should_call_resource_localize():void
	{
		assertEquals("dz.alkhwarizmix.i18n.AlKhwarizmixButtonTestCaseKey.0",
			alKhwarizmixButton.localize("AlKhwarizmixButtonTestCaseKey"));
		assertEquals("dz.alkhwarizmix.i18n.AlKhwarizmixButtonTestCaseKey.1",
			alKhwarizmixButton.localize("AlKhwarizmixButtonTestCaseKey", [0]));
	}
	
} // class
} // package