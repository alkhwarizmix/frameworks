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

package dz.alkhwarizmix.moqawalati.flex.model
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
 *  @since  ٣٠ شعبان ١٤٣٥ (June 28, 2014)
 */
public class MoqawalatiProxyTestCase extends MoqawalatiTestCase
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
		return MoqawalatiProxyEnhancedForTest;
	}
	
	private function get utMoqawalatiProxy():MoqawalatiProxy
	{
		return classInstanceUnderTest as MoqawalatiProxy;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(utMoqawalatiProxy);
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

import mx.core.IFactory;

import dz.alkhwarizmix.moqawalati.flex.model.MoqawalatiProxy;

internal class MoqawalatiProxyEnhancedForTest extends MoqawalatiProxy
{
	/**
	 * Used by AlKhwarizmixTestCase::test_logger to test super class logger
	 */
	public static const loggerClazzForTest:Class = MoqawalatiProxy;
	
	public function MoqawalatiProxyEnhancedForTest(proxyName:String=null, data:Object=null)
	{
		super(proxyName, data);
	}
	
	override public function getItemFactory():IFactory
	{
		// NO throw new AlKhwarizmixMissingImplError();
		return null;
	}
	
}

//--------------------------------------------------------------------------
