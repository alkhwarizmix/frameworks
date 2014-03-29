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

package dz.alkhwarizmix.framework.flex.view.containers
{

import spark.components.Group;

import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.utils.EventUtil;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class AlKhwarizmixCanvas extends Group
{
	include "../../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The Logger
	 */
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(AlKhwarizmixCanvas);
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixCanvas()
	{
		super();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Returns the specific class log, by default returns a generic log,
	 * should be overrided by inheriting classes
	 */
	protected function get logger():IAlKhwarizmixLogger
	{
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * 
	 */
	protected final function sendEvent(
		eventType:String, eventClass:Class = null, bubbles:Boolean = true):void
	{
		new EventUtil().sendEvent(this, eventType, eventClass, bubbles);
	}
	
} // Class
} // Package