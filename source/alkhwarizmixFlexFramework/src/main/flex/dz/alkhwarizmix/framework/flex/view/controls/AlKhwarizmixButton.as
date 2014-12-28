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

import spark.components.Button;

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
public class AlKhwarizmixButton extends Button
	implements IAlKhwarizmixLocalizable
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
	public function AlKhwarizmixButton()
	{
		super();
		
		new AlKhwarizmixResourceManager().registerLocalizable(this);
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
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixButton);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables: Invalidation
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @private
	 *  Whether this component needs to have its
	 *  commitLabel() method called.
	 */
	private var invalidateLabelFlag:Boolean = false;
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  labelResKey
	//----------------------------------
	
	private var _labelResKey:String = null;
	public function get labelResKey():String { return _labelResKey; }
	
	public function set labelResKey(value:String):void
	{
		if (_labelResKey == value)
			return;
		_labelResKey = value;
		invalidateLabel();
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
		invalidateLabel();
	}
	
	//----------------------------------
	//  resourceBundleName
	//----------------------------------
	
	public function get resourceBundleName():String
	{
		return null;
	}
	
	//----------------------------------
	//  resourceKeyPath
	//----------------------------------
	
	public function get resourceKeyPath():String
	{
		return "dz.alkhwarizmix.i18n.";
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	override protected function commitProperties():void
	{
		validateLabel();
		
		super.commitProperties();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of commitLabel
	 */
	public function commitLabel():void
	{
		if (labelResKey)
			label = localize(labelResKey);
	}
	
	/**
	 * TODO: ASDOC Definition of invalidateLabel
	 */
	public function invalidateLabel():void
	{
		if (!invalidateLabelFlag)
		{
			invalidateLabelFlag = true;
			invalidateProperties();
		}
	}
	
	/**
	 * TODO: ASDOC Definition of validateLabel
	 */
	public function validateLabel():void
	{
		if (invalidateLabelFlag)
		{
			commitLabel();
			invalidateLabelFlag = false;
		}
	}
	
} // Class
} // Package
