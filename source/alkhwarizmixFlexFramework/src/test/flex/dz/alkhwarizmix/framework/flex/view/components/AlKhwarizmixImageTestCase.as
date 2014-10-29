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

package dz.alkhwarizmix.framework.flex.view.components
{

import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixUITestCase;

import org.flexunit.asserts.assertNotNull;

/**
 *  <p>
 *  Test for AlKhwarizmixImage
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٥ رمضان ١٤٣٥ (July 23, 2014)
 */
public class AlKhwarizmixImageTestCase extends AlKhwarizmixUITestCase 
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUpAsyncUI():void
	{
		// NOOP
	}
	
	override protected function tearDownUI():void
	{
		// NOOP
	}
	
	override protected function get classUnderTest():Class
	{
		return AlKhwarizmixImage;
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
