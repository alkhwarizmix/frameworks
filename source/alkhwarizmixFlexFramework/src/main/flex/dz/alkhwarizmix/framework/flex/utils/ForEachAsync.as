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

package dz.alkhwarizmix.framework.flex.utils
{

import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Timer;

import mx.collections.ArrayCollection;

import dz.alkhwarizmix.framework.flex.event.AlKhwarizmixEvent;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class ForEachAsync extends EventDispatcher
{
	public static const CLASS_NAME:String = "ForEachAsync";
	
	// EVENTS
	public static const LOOP_DONE:String =
		"ForEachAsync_loop_done";
	public static const LOOP_FAULT:String =
		"ForEachAsync_loop_fault";
	
	/**
	 * LOG.
	 */
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(ForEachAsync);
	
	/**
	 * Constructor.
	 */
	public function ForEachAsync(theSource:Array = null,
		theLoopFunction:Function = null)
	{
		super();
		
		if (theSource != null)
		{
			source = theSource;
		}
		if (theLoopFunction != null)
		{
			loopFunction = theLoopFunction;
		}
	}
	
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	//* FIELDS (PUBLIC)
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	
	/**
	 * collection TO_ASDoc_DO:
	 */
	public function get collection():ArrayCollection
	{
		var result:ArrayCollection = null;
		
		if (isAsyncLoopDone)
		{
			result = asyncLoopCollection;
		}
		
		return result;
	}
	
	/**
	 * creator TO_ASDoc_DO:
	 */
	public var creator:Object = null;
	
	/**
	 * source TO_ASDoc_DO:
	 */
	public function get source():Array
	{
		return _source;
	}
	public function set source(value:Array):void
	{
		_source = value;
		
		stopAsyncLoop();
		isAsyncLoopDone = false;
	}
	private var _source:Array;
	
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	//* FIELDS (PRIVATE)
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	
	/**
	 * asyncLoopCollection TO_ASDoc_DO:
	 */
	private var asyncLoopCollection:ArrayCollection = null;
	
	/**
	 * asyncLoopSource TO_ASDoc_DO:
	 */
	private var asyncLoopSource:Array = null;
	
	/**
	 * asyncLoopTimer TO_ASDoc_DO:
	 */
	private var asyncLoopTimer:Timer = null;
	
	/**
	 * isAsyncLoopDone TO_ASDoc_DO:
	 */
	private function get isAsyncLoopDone():Boolean
	{
		return _isAsyncLoopDone;
	}
	private function set isAsyncLoopDone(value:Boolean):void
	{
		_isAsyncLoopDone = value;
	}
	private var _isAsyncLoopDone:Boolean = false;
	
	/**
	 * loopFunction TO_ASDoc_DO:
	 * Function(item:Object):Object
	 */
	public var loopFunction:Function = null;
	
	/**
	 * The maximum time in milliseconds for the loop
	 */
	private var loopTime:Number = 1000; // milliseconds
	
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	//* METHODS (PUBLIC)
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	
	/**
	 * loop_async Method TO_ASDoc_DO:
	 */
	public function loop_async(theLoopTime:Number = 1000,
		thePauseTime:Number = 50):void
	{
		if (AlKhwarizmixLog.isLogLevelAll)
		{
			LOG.debug("loop_async");
		}
		
		stopAsyncLoop();
		isAsyncLoopDone = false;
		
		asyncLoopCollection = new ArrayCollection();
		asyncLoopSource = source.concat(); // MAKE A COPY
		
		loopTime = theLoopTime; // milliseconds
		
		asyncLoopTimer = new Timer(thePauseTime);
		asyncLoopTimer.addEventListener(TimerEvent.TIMER,
			asyncLoopTimer_timerHandler);
		asyncLoopTimer.start();
	}
	
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	//* METHODS (PRIVATE)
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	
	/**
	 * loopDone Method TO_ASDoc_DO:
	 */
	private function loopDone():void
	{
		if (AlKhwarizmixLog.isLogLevelAll)
		{
			LOG.debug("loopDone");
		}
		
		stopAsyncLoop();
		isAsyncLoopDone = true;
		dispatchEvent(new AlKhwarizmixEvent(LOOP_DONE, false));
	}
	
	/**
	 * loopFault Method TO_ASDoc_DO:
	 */
	private function loopFault():void
	{
		LOG.error("loopFault");
		
		stopAsyncLoop();
		isAsyncLoopDone = true;
		dispatchEvent(new AlKhwarizmixEvent(LOOP_FAULT, false));
	}
	
	/**
	 * doLoopProcessing Method TO_ASDoc_DO:
	 */
	private function doLoopProcessing():void
	{
		if (AlKhwarizmixLog.isLogLevelAll)
		{
			LOG.debug("doLoopProcessing: asyncLoopSource.length={0}",
				asyncLoopSource.length);
		}
		
		var startTime:Number = flash.utils.getTimer();
		var loopTimeExpired:Boolean = false;
		while ((asyncLoopSource.length > 0) && (loopTimeExpired == false))
		{
			var result:Object = loopFunction(asyncLoopSource.shift());
			if (result !== null)
			{
				asyncLoopCollection.addItem(result);
			}
			loopTimeExpired = ((flash.utils.getTimer() - startTime) > loopTime);
		}
	}
	
	/**
	 * stopAsyncLoop Method TO_ASDoc_DO:
	 */
	private function stopAsyncLoop():void
	{
		if (asyncLoopTimer != null)
		{
			asyncLoopTimer.stop();
			asyncLoopTimer = null;
		}
		
		asyncLoopSource = null;
	}
	
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	//* HANDLERS
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	
	/**
	 * asyncLoopTimer_timerHandler Handler TO_ASDoc_DO:
	 */
	private function asyncLoopTimer_timerHandler(ev:TimerEvent):void
	{
		asyncLoopTimer.stop();
		
		try
		{
			doLoopProcessing();
		}
		catch (error:Error)
		{
			loopFault();
			throw error;
		}
		
		if (asyncLoopSource.length > 0)
		{
			asyncLoopTimer.start();
		}
		else
		{
			loopDone();
		}
	}
	
} // class
} // package
