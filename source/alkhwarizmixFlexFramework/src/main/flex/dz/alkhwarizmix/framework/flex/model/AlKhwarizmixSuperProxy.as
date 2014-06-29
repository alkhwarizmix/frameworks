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

package dz.alkhwarizmix.framework.flex.model
{

import flash.events.Event;
import flash.events.TimerEvent;

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixProxy;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 30, 2013)
 */
public class AlKhwarizmixSuperProxy extends AlKhwarizmixProxy
	implements IAlKhwarizmixProxy
{
	include "../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 *
	 * @param proxyName TODO: ASDOC
	 * @param data TODO: ASDOC
	 */
	public function AlKhwarizmixSuperProxy(proxyName:String=null, data:Object=null)
	{
		super(proxyName, data);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------
	
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(AlKhwarizmixSuperProxy);
	
	override protected function get logger():IAlKhwarizmixLogger { return LOG; }
	
	//--------------------------------------------------------------------------
	//
	//  Event handlers
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private function refreshTimer_timerHandler(event:TimerEvent):void
	{
		logger.debug("refreshTimer_timerHandler");
		
		try
		{
			// handleRefresh();
		}
		catch (error:Error)
		{
			logger.error("refreshTimer_timerHandler: {0}={1}",
				"handleRefresh error", error.getStackTrace());
		}
	}
	
	/**
	 * @private
	 */
	private function timeOutTimer_timeOutHandler(event:Event):void
	{
		logger.debug("timeOutTimer_timeOutHandler");
		
		try
		{
			// handleTimeOut();
		}
		catch (error:Error)
		{
			logger.error("timeOutTimer_timeOutHandler: {0}={1}",
				"handleTimeOut error", error.getStackTrace());
		}
	}
	
} // Class
} // Package
