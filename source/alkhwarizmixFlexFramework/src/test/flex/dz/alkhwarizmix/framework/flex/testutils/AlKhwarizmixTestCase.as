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

package dz.alkhwarizmix.framework.flex.testutils
{

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;

import org.flexunit.asserts.assertTrue;
import org.puremvc.as3.multicore.patterns.facade.Facade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٠ جمادى الأول ١٤٣٥ (March 20, 2014)
 */
public class AlKhwarizmixTestCase
{
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	protected static const THREE_SECONDS:Number = 3000;
	
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	protected var classInstanceUnderTest:* = null;
	
	[Before]
	public function setUp():void
	{
		if (classUnderTestConstructorArg1)
			classInstanceUnderTest = new classUnderTest(classUnderTestConstructorArg1);
		else
			classInstanceUnderTest = new classUnderTest();
	}
	
	protected function get classUnderTest():Class
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	protected function get classUnderTestConstructorArg1():*
	{
		return null;
	}
	
	[After]
	public function tearDown():void
	{
		classInstanceUnderTest = null;
	}
	
	//--------------------------------------------------------------------------
	//
	//  HELPERS
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	protected final function removeFacadeCore(key:String):void
	{
		Facade.removeCore(key);
	}
	
	/**
	 * @private
	 * 
	 * Example of use:
	 *  classUnderTest = new MoqawalatiClass();
	 *  assert_should_throwMissingImplError(
	 *    function ():void
	 *    {
	 *      classUnderTest.function_should_throw_error();
	 *    });
	 */
	protected  final function assert_should_throwMissingImplError(
		functionThrowingException:Function):void
	{
		try
		{
			functionThrowingException();
			assertTrue("Should throw exception before to be here", false);
		}
		catch (error:Error)
		{
			assertTrue(error is AlKhwarizmixMissingImplError);
		}
	}
	
	
} // class
} // package