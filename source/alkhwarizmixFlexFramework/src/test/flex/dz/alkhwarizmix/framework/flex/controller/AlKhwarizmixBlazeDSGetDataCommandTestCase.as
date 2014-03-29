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

import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixTestCase;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٧ شوال ١٤٣٤ (August 24, 2013)
 */
public class AlKhwarizmixBlazeDSGetDataCommandTestCase extends AlKhwarizmixTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override public function setUp():void
	{
		super.setUp();
	}
	
	override public function tearDown():void
	{
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return AlKhwarizmixBlazeDSGetDataCommand;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Ignore("Fail in maven")]
	[Test]
	public function test02_amfURI_should_throwMissingImplError():void
	{
		assert_should_throwMissingImplError(
			function ():void
			{
				classInstanceUnderTest.amfURI;
			});
	}
	
	[Ignore("Fail in maven")]
	[Test]
	public function test03_operationName_should_throwMissingImplError():void
	{
		assert_should_throwMissingImplError(
			function ():void
			{
				classInstanceUnderTest.operationName;
			});
	}
	
	[Ignore("Fail in maven")]
	[Test]
	public function test04_proxyName_should_throwMissingImplError():void
	{
		assert_should_throwMissingImplError(
			function ():void
			{
				classInstanceUnderTest.proxyName;
			});
	}
	
} // class
} // package