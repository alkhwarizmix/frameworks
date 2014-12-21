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

import flash.events.Event;
import flash.events.IEventDispatcher;

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
	
	protected static const FRENCH_TEXT:String = "éè";
	protected static const ARABIC_TEXT:String = "" +
		"م خ ة";

	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	protected var classInstanceUnderTest:* = null;
	
	[Before(order=1)]
	public final function setUp_final():void
	{
		doBeforeSetUp();
		
		if (classUnderTestConstructorArg2)
		{
			classInstanceUnderTest = new classUnderTest(
				classUnderTestConstructorArg1,
				classUnderTestConstructorArg2);
		}
		else if (classUnderTestConstructorArg1)
		{
			classInstanceUnderTest = new classUnderTest(
				classUnderTestConstructorArg1);
		}
		else
		{
			classInstanceUnderTest = new classUnderTest();
		}
		
		setUp();
	}
	
	protected function doBeforeSetUp():void
	{
		// NOOP
	}
	
	protected function setUp():void
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	protected function get classUnderTest():Class
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	protected function get classUnderTestConstructorArg1():*
	{
		return null;
	}
	
	protected function get classUnderTestConstructorArg2():*
	{
		return null;
	}
	
	[After(order=999)]
	public final function tearDown_final():void
	{
		tearDown();
		
		classInstanceUnderTest = null;
	}
	
	protected function tearDown():void
	{
		throw new AlKhwarizmixMissingImplError();
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
	
	/**
	 * @private
	 * 
	 * Example of use:
	 * assert_should_dispatchedEvent(utMainControlBar,
	 *  MainControlBarEvent.OPEN_WINDOW,
	 *  MainControlBarEvent,
	 *  function ():void
	 *  {
	 *   utMainControlBar.menuBar.dispatchEvent(
	 *    new MenuEvent(MenuEvent.ITEM_CLICK));
	 *  });
	 */
	protected final function assert_should_dispatchedEvent(
		dispatcherToListen:IEventDispatcher,
		eventToListen:String,
		eventClassToListen:Class,
		functionToRun:Function):void
	{
		var dispatchedEvent:Event = null;
		dispatcherToListen.addEventListener(eventToListen,
			function (event:Event):void
			{
				dispatchedEvent = event;
			});
		functionToRun();
		assertTrue(dispatchedEvent is eventClassToListen);
	}
	
} // class
} // package
