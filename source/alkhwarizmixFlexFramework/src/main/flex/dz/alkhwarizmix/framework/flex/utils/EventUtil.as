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

package dz.alkhwarizmix.framework.flex.utils
{

import flash.events.IEventDispatcher;

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixError;
import dz.alkhwarizmix.framework.flex.event.AlKhwarizmixEvent;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٣ جمادى الأول ١٤٣٥ (March 13, 2014)
 */
public class EventUtil
{
	/**
	 * 
	 */
	public final function sendEvent(dispatcher:IEventDispatcher,
		eventType:String, eventClass:Class = null, bubbles:Boolean = true):void
	{
		if (!dispatcher)
			throw new AlKhwarizmixError();
		
		var eventToDispatch:AlKhwarizmixEvent = (eventClass != null)
			? new eventClass(eventType, bubbles)
			: new AlKhwarizmixEvent(eventType, bubbles);
		dispatcher.dispatchEvent(eventToDispatch);
	}
	
} // class
} // package