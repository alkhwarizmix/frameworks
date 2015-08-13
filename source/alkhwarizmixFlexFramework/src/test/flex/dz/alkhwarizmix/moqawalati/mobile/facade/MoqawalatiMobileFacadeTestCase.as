////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٦ هجري، فارس بلحواس (Copyright 2015 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.moqawalati.mobile.facade
{

import dz.alkhwarizmix.moqawalati.flex.testutils.MoqawalatiTestCase;

import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٦ شوال ١٤٣٦ (August 01, 2015)
 */
public class MoqawalatiMobileFacadeTestCase extends MoqawalatiTestCase
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
		return MoqawalatiMobileFacadeEnhancedForTest;
	}
	
	override protected function get classUnderTestConstructorArg1():*
	{
		return "key"; // key
	}
	
	private function get utMoqawalatiMobileFacade():MoqawalatiMobileFacade
	{
		return classInstanceUnderTest as MoqawalatiMobileFacade;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(utMoqawalatiMobileFacade);
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

import dz.alkhwarizmix.moqawalati.mobile.facade.MoqawalatiMobileFacade;

internal class MoqawalatiMobileFacadeEnhancedForTest extends MoqawalatiMobileFacade
{
	/**
	 * Used by AlKhwarizmixTestCase::test_logger to test super class logger
	 */
	public static const loggerClazzForTest:Class = MoqawalatiMobileFacade;
	
	public function MoqawalatiMobileFacadeEnhancedForTest(key:String)
	{
		super(key);
	}
	
	override protected function initCommandsToRegister():void
	{
		// NO throw new AlKhwarizmixMissingImplError();
	}
	
}

//--------------------------------------------------------------------------
