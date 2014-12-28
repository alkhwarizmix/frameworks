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

import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.utils.EventUtil;

import flexlib.mdi.containers.MDICanvas;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class AlKhwarizmixMDICanvas extends MDICanvas
{
	include "../../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixMDICanvas()
	{
		super();
		if (AlKhwarizmixLog.isLogLevelAll)
			logger.debug(AlKhwarizmixLog.CONSTRUCTOR);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------
	
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
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixMDICanvas);
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
