////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٥ هجري، فارس بلحواس (Copyright 2014 Fares Belhaouas)  
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
 *  Test for AlKhwarizmixMenuBar
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٧ رجب ١٤٣٥ (May 26, 2014)
 */
public class AlKhwarizmixMenuBarTestCase extends AlKhwarizmixUITestCase 
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
		return AlKhwarizmixMenuBar;
	}
	
	private function get alKhwarizmixMenuBar():AlKhwarizmixMenuBar
	{
		return classInstanceUnderTest as AlKhwarizmixMenuBar;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test01_constructor():void
	{
		assertNotNull(alKhwarizmixMenuBar);
	}
	
	[Test]
	public function test02_should_implement_IAlKhwarizmixLocalizable():void
	{
		assertTrue(alKhwarizmixMenuBar is IAlKhwarizmixLocalizable);
	}
	
	[Test]
	public function test03_localize_function_should_not_be_null():void
	{
		assertNotNull(alKhwarizmixMenuBar.localize);
	}
	
	[Test]
	public function test04_localize_function_should_call_resource_localize():void
	{
		assertEquals("dz.alkhwarizmix.i18n.AlKhwarizmixMenuBarTestCaseKey.0",
			alKhwarizmixMenuBar.localize("AlKhwarizmixMenuBarTestCaseKey"));
		assertEquals("dz.alkhwarizmix.i18n.AlKhwarizmixMenuBarTestCaseKey.1",
			alKhwarizmixMenuBar.localize("AlKhwarizmixMenuBarTestCaseKey", [0]));
	}
	
	[Test]
	public function test05_resourceKeyPath_should_return_the_default_alkhwarizmix_path():void
	{
		assertEquals("dz.alkhwarizmix.i18n.", alKhwarizmixMenuBar.resourceKeyPath);
	}
	
} // class
} // package
