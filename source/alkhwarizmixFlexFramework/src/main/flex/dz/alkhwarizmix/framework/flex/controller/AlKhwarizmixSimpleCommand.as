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

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixCommand;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

import flash.events.TimerEvent;
import flash.utils.Timer;

import mx.core.FlexGlobals;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٧ شوال ١٤٣٤ (August 23, 2013)
 */
public class AlKhwarizmixSimpleCommand extends SimpleCommand
	implements IAlKhwarizmixCommand
{
	include "../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The Logger
	 */
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(AlKhwarizmixSimpleCommand);
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  log
	//----------------------------------
	
	/**
	 * Returns the specific class log, by default returns a generic log,
	 * should be overrided by inheriting classes
	 */
	protected function get logger():IAlKhwarizmixLogger { return LOG; }
	
	//----------------------------------
	//  executeLaterDelay
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of executeLaterDelay
	 */
	protected function get executeLaterDelay():Number
	{
		return 1;
	}
	
	//----------------------------------
	//  isExecuteDelayed
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of isExecuteDelayed
	 */
	protected function get isExecuteDelayed():Boolean
	{
		return false;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @inheritDoc
	 */
	override public final function execute(notif:INotification):void
	{
		if (AlKhwarizmixLog.isLogLevelAll)
		{
			logger.debug("execute: {1} noteName={0}", notif.getName(),
				isExecuteDelayed ? "delayed" : "");
		}
		
		if (isExecuteDelayed)
		{
			if (executeLaterDelay > 1)
			{
				if (AlKhwarizmixLog.isLogLevelAll)
					logger.debug("execute: Call later using timer");
				
				var callLaterTimer:Timer = new Timer(executeLaterDelay, 1);
				callLaterTimer.addEventListener(TimerEvent.TIMER,
					function(ev:TimerEvent):void
					{
						execute_now(notif);
					});
				callLaterTimer.start();
			}
			else
			{
				if (AlKhwarizmixLog.isLogLevelAll)
					logger.debug("execute: Call later using callLater");
				
				FlexGlobals.topLevelApplication.callLater(execute_laterCall, [notif]);
			}
		}
		else
		{
			execute_now(notif);
		}
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of execute_catch_error
	 */
	protected function execute_catch_error(
		notif:INotification, error:Error):void
	{
		logger.error("execute_catch_error: error={0}, Stack trace={1}",
			error.message, error.getStackTrace());
	}
	
	/**
	 * TODO: ASDOC Definition of execute_finally
	 */
	protected function execute_finally(notif:INotification):void
	{
		// NOOP
	}
	
	/**
	 * TODO: ASDOC Definition of execute_try
	 */
	protected function execute_try(notif:INotification):void
	{
		// NOOP
	}
	
	/**
	 * TODO: ASDOC Definition of execute_laterCall
	 */
	private function execute_laterCall(notif:INotification):void
	{
		execute_now(notif);
	}
	
	/**
	 * TODO: ASDOC Definition of execute_now
	 */
	private function execute_now(notif:INotification):void
	{
		if (AlKhwarizmixLog.isLogLevelAll)
			logger.debug("execute_now: noteName={0}", notif.getName());
		
		try
		{
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("CALL execute_try");
			
			execute_try(notif);
			
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("AFTER execute_try");
		}
		catch (error:Error)
		{
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("CALL execute_catch_error");
			
			execute_catch_error(notif, error);
			
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("AFTER execute_catch_error");
		}
		finally
		{
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("CALL execute_finally");
			
			execute_finally(notif);
			
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("AFTER execute_finally");
		}
	}
	
} // class
} // package