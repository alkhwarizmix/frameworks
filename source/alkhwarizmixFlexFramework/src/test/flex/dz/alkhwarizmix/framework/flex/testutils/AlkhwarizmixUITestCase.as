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

package dz.alkhwarizmix.framework.flex.testutils
{

import flash.display.DisplayObject;

import mx.core.UIComponent;
import mx.events.FlexEvent;

import org.flexunit.asserts.assertTrue;
import org.flexunit.async.Async;
import org.fluint.uiImpersonation.UIImpersonator;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class AlkhwarizmixUITestCase
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
	
	private var displayObjectUnderTest:DisplayObject = null;
	
	[Before(async, ui)]
	public function setUp():void
	{
		displayObjectUnderTest = getDisplayObjectUnderTest();
		
		if (displayObjectUnderTest)
		{
			Async.proceedOnEvent(this, displayObjectUnderTest,
				FlexEvent.CREATION_COMPLETE, THREE_SECONDS);
			addDisplayObjectToUI(displayObjectUnderTest);
		}
		else
		{
			assertTrue("Could not getDisplayObjectUnderTest", false);
		}
	}
	
	protected function getDisplayObjectUnderTest():DisplayObject
	{
		return null;
	}
	
	[After(ui)]
	public function tearDown():void
	{
		UIImpersonator.removeChild(displayObjectUnderTest);
	}
	
	//--------------------------------------------------------------------------
	//
	//  HELPERS
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	protected final function addDisplayObjectToUI(displayObject:DisplayObject):void
	{
		UIImpersonator.addChild(displayObject);
	}
	
	/**
	 * @private
	 */
	protected final function forceRendering(renderer:UIComponent):void
	{
		renderer.validateNow();
	}
	
} // class
} // package