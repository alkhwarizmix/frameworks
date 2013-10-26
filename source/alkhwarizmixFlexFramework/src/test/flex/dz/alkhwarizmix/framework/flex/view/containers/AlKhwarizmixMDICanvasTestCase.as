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

package dz.alkhwarizmix.framework.flex.view.containers
{

import flash.display.DisplayObject;

import dz.alkhwarizmix.framework.flex.testutils.AlkhwarizmixUITestCase;

import org.flexunit.asserts.assertNotNull;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٥ شوال ١٤٣٤ (September 1, 2013)
 */
public class AlKhwarizmixMDICanvasTestCase extends AlkhwarizmixUITestCase 
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	private var classUnderTest:AlKhwarizmixMDICanvas = null;
	
	[Before(async, ui)]
	override public function setUp():void
	{
		super.setUp();
	}
	
	override protected function getDisplayObjectUnderTest():DisplayObject
	{
		classUnderTest = new AlKhwarizmixMDICanvas();
		return classUnderTest;
	}
	
	[After(ui)]
	override public function tearDown():void
	{
		classUnderTest = null;
		
		super.tearDown();
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test01_constructor():void
	{
		assertNotNull(classUnderTest);
	}
	
} // class
} // package