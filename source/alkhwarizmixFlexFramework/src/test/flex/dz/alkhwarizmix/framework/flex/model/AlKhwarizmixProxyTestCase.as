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

package dz.alkhwarizmix.framework.flex.model
{

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;

import flexunit.framework.TestCase;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 30, 2013)
 */
public class AlKhwarizmixProxyTestCase extends TestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	private var classUnderTest:AlKhwarizmixProxy = null;
	
	override public function setUp():void
	{
		super.setUp();
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
	public function test01_constructor_should_throwMissingImplError():void
	{
		try
		{
			classUnderTest = new AlKhwarizmixProxy();
			assertTrue("Should throw exception before to be here", false);
		}
		catch (error:Error)
		{
			assertTrue(error is AlKhwarizmixMissingImplError);
		}
	}
	
} // class
} // package