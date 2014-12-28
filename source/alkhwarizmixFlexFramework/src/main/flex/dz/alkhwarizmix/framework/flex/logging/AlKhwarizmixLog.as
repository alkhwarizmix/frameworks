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

import flash.utils.getQualifiedClassName;

import mx.logging.ILoggingTarget;
import mx.logging.Log;
import mx.logging.LogEventLevel;
import mx.logging.targets.LineFormattedTarget;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٦ شوال ١٤٣٤ (August 22, 2013)
 */
public class AlKhwarizmixLog extends Log
{
	include "../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	public static const CONSTRUCTOR:String = "Constructor";
	
	//--------------------------------------------------------------------------
	//
	//  Class variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of isLogLevelAll
	 */
	public static var isLogLevelAll:Boolean = false;
	
	//--------------------------------------------------------------------------
	//
	//  Class methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Setup a logging target with default values, then add it to Log, the caller
	 * might change default values after to call this method
	 */
	public static function addTarget(target:ILoggingTarget):void
	{
		if (target is LineFormattedTarget)
		{
			with (target as LineFormattedTarget)
			{
				includeCategory = true;
				includeLevel = true;
				includeDate = true;
				includeTime = true;
			}
		}
		target.level = LogEventLevel.INFO;
		Log.addTarget(target);
	}
	
	/**
	 *  This method removes all of the current loggers from the cache.
	 */
	public static function flush():void
	{
		Log.flush();
	}
	
	/**
	 * Returns a Logger for the complete clazz category
	 */
	public static function getLogger(clazz:Class):IAlKhwarizmixLogger
	{
		var clazzName:String = getQualifiedClassName(clazz).replace("::", ".");
		var result:IAlKhwarizmixLogger = new AlKhwarizmixLogger(
			Log.getLogger(clazzName)) as IAlKhwarizmixLogger;
		return result;
	}
	
	/**
	 */
	public static function removeTarget(target:ILoggingTarget):void
	{
		Log.removeTarget(target);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor. 
	 */
	public function AlKhwarizmixLog()
	{
		super();
	}
	
} // Class
} // Package
