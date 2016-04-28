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

package dz.alkhwarizmix.framework.flex.view
{

import mx.core.FlexGlobals;

import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixSimpleCommand;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixMediator;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class AlKhwarizmixMediator extends Mediator
	implements IAlKhwarizmixMediator
{
	include "../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Constructor.
	 */
	public function AlKhwarizmixMediator(
		mediatorName:String = null, viewComponent:Object = null)
	{
		super(mediatorName, viewComponent);
		
		if (AlKhwarizmixLog.isLogLevelAll)
			logger.debug(AlKhwarizmixLog.CONSTRUCTOR);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  logger
	//----------------------------------
	
	/**
	 * The Logger
	 */
	private static var LOG:IAlKhwarizmixLogger = null;
	
	/**
	 * Returns the specific class log, by default returns a generic log,
	 * should be overrided by inheriting classes
	 */
	protected function get logger():IAlKhwarizmixLogger
	{
		if (!LOG)
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixMediator);
		return LOG;
	}
	
	//----------------------------------
	//  isHandleNotificationDelayed
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of isHandleNotificationDelayed
	 */
	protected function get isHandleNotificationDelayed():Boolean
	{
		return false;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of handleNotification
	 */
	override public final function handleNotification(notif:INotification):void
	{
		if (isHandleNotificationDelayed)
		{
			FlexGlobals.topLevelApplication.callLater(
				handleNotification_laterCall, [notif]);
		}
		else
		{
			handleNotification_now(notif);
		}
	}
	
	/**
	 * TODO: ASDOC Definition of handleNotification_laterCall
	 */
	private function handleNotification_laterCall(notif:INotification):void
	{
		handleNotification_now(notif);
	}
	
	/**
	 * TODO: ASDOC Definition of handleNotification_now
	 */
	private function handleNotification_now(notif:INotification):void
	{
		if (AlKhwarizmixLog.isLogLevelAll)
		{
			logger.debug("handleNotification_now: noteName={0}",
				notif.getName()); // trace
		}
		
		try
		{
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("CALL handleNotification_try"); // trace
			
			handleNotification_try(notif);
			
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("AFTER handleNotification_try"); // trace
		}
		catch (error:Error)
		{
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("CALL handleNotification_catch_error"); // trace
			
			handleNotification_catch_error(notif, error);
			
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("AFTER handleNotification_catch_error"); // trace
		}
		finally
		{
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("CALL handleNotification_finally"); // trace
			
			handleNotification_finally(notif);
			
			if (AlKhwarizmixLog.isLogLevelAll)
				logger.debug("AFTER handleNotification_finally"); // trace
		}
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of handleNotification_catch_error
	 */
	protected function handleNotification_catch_error(notif:INotification,
		error:Error):void
	{
		logger.error("handleNotification_catch_error: " + 
			"error={0}, Stack trace={1}", error.message,
			error.getStackTrace());
	}
	
	/**
	 * TODO: ASDOC Definition of handleNotification_finally
	 */
	protected function handleNotification_finally(notif:INotification):void
	{
		// NOOP
	}
	
	/**
	 * TODO: ASDOC Definition of handleNotification_try
	 */
	protected function handleNotification_try(notif:INotification):void
	{
		// NOOP
	}
	
} // class
} // package
