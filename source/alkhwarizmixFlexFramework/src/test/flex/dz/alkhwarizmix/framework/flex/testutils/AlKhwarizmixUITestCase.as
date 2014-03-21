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

import org.flexunit.asserts.assertFalse;
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
public class AlKhwarizmixUITestCase extends AlKhwarizmixTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	private function get displayObjectUnderTest():DisplayObject
	{
		return classInstanceUnderTest as DisplayObject;
	}
	
	[Before(async, ui)]
	override public function setUp():void
	{
		super.setUp();
		
		if (displayObjectUnderTest)
		{
			Async.proceedOnEvent(this, displayObjectUnderTest,
				FlexEvent.CREATION_COMPLETE, THREE_SECONDS);
			addDisplayObjectToUI(displayObjectUnderTest);
		}
		else
		{
			assertTrue("Could not instanciate displayObjectUnderTest", false);
		}
	}
	
	[After(ui)]
	override public function tearDown():void
	{
		UIImpersonator.removeChild(displayObjectUnderTest);
		
		super.tearDown();
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
	
	/**
	 * @private
	 */
	protected final function assertVisible(component:UIComponent, componentName:String):void
	{
		assertTrue(componentName + " should be visible", component.visible);
		assertTrue(componentName + " should be include in layout", component.includeInLayout);
	}
	
	/**
	 * @private
	 */
	protected final function assertHidden(component:UIComponent, componentName:String):void
	{
		assertFalse(componentName + " should not be visible", component.visible);
		assertFalse(componentName + " should not be include in layout", component.includeInLayout);
	}
	
} // class
} // package