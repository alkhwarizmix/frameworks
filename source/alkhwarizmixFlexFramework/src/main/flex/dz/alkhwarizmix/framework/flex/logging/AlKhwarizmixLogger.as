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

package dz.alkhwarizmix.framework.flex.logging
{

import flash.events.EventDispatcher;

import mx.logging.ILogger;
import mx.logging.Log;
import mx.utils.StringUtil;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٦ شوال ١٤٣٤ (August 22, 2013)
 */
public class AlKhwarizmixLogger extends EventDispatcher
	implements IAlKhwarizmixLogger
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
	 *  @param category The category for which this log sends messages.
	 */
	public function AlKhwarizmixLogger(theLogLogger:ILogger=null)
	{
		logLogger = theLogLogger;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC
	 */
	private var logLogger:ILogger = null;
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Implementation of ILogger
	 */	
	public function get category():String
	{
		return logLogger.category;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Implementation of ILogger
	 */	
	public function debug(msg:String, ... rest):void
	{
		if (Log.isDebug())
		{
			var args:Array = rest.concat();
			args.unshift(msg);
			logLogger.debug.apply(logLogger, args);
		}
	}
	
	/**
	 *  Implementation of ILogger
	 */	
	public function error(msg:String, ... rest):void
	{
		if (Log.isError())
		{
			var args:Array = rest.concat();
			args.unshift(msg);
			logLogger.error.apply(logLogger, args);
			
			showAlert(StringUtil.substitute(msg, rest.concat()), "ERROR");
		}
	}
	
	/**
	 *  Implementation of ILogger
	 */	
	public function fatal(msg:String, ... rest):void
	{
		if (Log.isFatal())
		{
			var args:Array = rest.concat();
			args.unshift(msg);
			logLogger.fatal.apply(logLogger, args);
			
			showAlert(StringUtil.substitute(msg, rest.concat()), "FATAL");
		}
	}
	
	/**
	 *  Implementation of ILogger
	 */	
	public function info(msg:String, ... rest):void
	{
		if (Log.isInfo())
		{
			var args:Array = rest.concat();
			args.unshift(msg);
			logLogger.info.apply(logLogger, args);
		}
	}
	
	/**
	 *  Implementation of ILogger
	 */	
	public function log(level:int, msg:String, ... rest):void
	{
		var args:Array = rest.concat();
		args.unshift(msg);
		args.unshift(level);
		logLogger.log.apply(logLogger, args);
	}
	
	/**
	 *  Implementation of ILogger
	 */	
	public function warn(msg:String, ... rest):void
	{
		if (Log.isWarn())
		{
			var args:Array = rest.concat();
			args.unshift(msg);
			logLogger.warn.apply(logLogger, args);
		}
	}
	
	/**
	 * @private
	 */
	private function showAlert(message:String, title:String):void
	{
		// new Alert.show(message, title);
	}
	
} // Class
} // Package