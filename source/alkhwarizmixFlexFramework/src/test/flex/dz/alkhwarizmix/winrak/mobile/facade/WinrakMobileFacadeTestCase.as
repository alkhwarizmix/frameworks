////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٧ هجري، فارس بلحواس (Copyright 2016 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.winrak.mobile.facade
{

import dz.alkhwarizmix.winrak.flex.testutils.WinrakTestCase;

import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٤ ربيع الثاني ١٤٣٧ (January 30, 2016)
 */
public class WinrakMobileFacadeTestCase extends WinrakTestCase
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
	
	override protected function get classUnderTest():Class
	{
		return WinrakMobileFacadeEnhancedForTest;
	}
	
	override protected function get classUnderTestConstructorArg1():*
	{
		return "key"; // key
	}
	
	private function get utWinrakMobileFacade():WinrakMobileFacade
	{
		return classInstanceUnderTest as WinrakMobileFacade;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(utWinrakMobileFacade);
	}
	
	[Ignore("TODO: TDD")]
	[Test]
	public function test01():void
	{
		assertTrue(false);
	}
	
} // class
} // package

//--------------------------------------------------------------------------

import dz.alkhwarizmix.winrak.mobile.facade.WinrakMobileFacade;

internal class WinrakMobileFacadeEnhancedForTest extends WinrakMobileFacade
{
	/**
	 * Used by AlKhwarizmixTestCase::test_logger to test super class logger
	 */
	public static const loggerClazzForTest:Class = WinrakMobileFacade;
	
	public function WinrakMobileFacadeEnhancedForTest(key:String)
	{
		super(key);
	}
	
	override protected function initCommandsToRegister():void
	{
		// NO throw new AlKhwarizmixMissingImplError();
	}
	
}

//--------------------------------------------------------------------------
