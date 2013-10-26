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

package dz.alkhwarizmix.framework.flex.controller
{

import flexunit.framework.TestCase;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٧ شوال ١٤٣٤ (August 24, 2013)
 */
public class AlKhwarizmixMacroCommandTestCase extends TestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	private var classUnderTest:AlKhwarizmixMacroCommand = null;
	
	override public function setUp():void
	{
		super.setUp();
		
		classUnderTest = new AlKhwarizmixMacroCommand();
	}
	
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
	public function testConstructor():void
	{
		assertNotNull(classUnderTest);
	}
	
} // class
} // package