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

package dz.alkhwarizmix.framework.flex.view.controls
{

import spark.components.Label;

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixLocalizable;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.resources.AlKhwarizmixResourceManager;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class AlKhwarizmixLabel extends Label
	implements IAlKhwarizmixLocalizable
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
		getLogger(AlKhwarizmixLabel);
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixLabel()
	{
		super();
		
		new AlKhwarizmixResourceManager().registerLocalizable(this);
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
	
	//----------------------------------
	//  localize
	//----------------------------------
	
	private var _localize:Function;
	[Bindable]
	public function get localize():Function { return _localize; }
	
	public function set localize(value:Function):void
	{
		if (_localize == value)
			return;
		_localize = value;
	}
	
	//----------------------------------
	//  resourceBundleName
	//----------------------------------
	
	public function get resourceBundleName():String
	{
		return null;
	}
	
} // Class
} // Package