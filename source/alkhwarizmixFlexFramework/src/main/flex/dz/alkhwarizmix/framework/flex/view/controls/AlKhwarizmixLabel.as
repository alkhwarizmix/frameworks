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
	//  Variables: Invalidation
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @private
	 *  Whether this component needs to have its
	 *  commitText() method called.
	 */
	private var invalidateTextFlag:Boolean = false;
	
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
	//  textResKey
	//----------------------------------
	
	private var _textResKey:String = null;
	public function get textResKey():String { return _textResKey; }
	
	public function set textResKey(value:String):void
	{
		if (_textResKey == value)
			return;
		_textResKey = value;
		invalidateText();
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
		invalidateText();
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
		validateText();
		
		super.commitProperties();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of commitText
	 */
	public function commitText():void
	{
		if (textResKey)
			text = localize(textResKey);
	}
	
	/**
	 * TODO: ASDOC Definition of invalidateText
	 */
	public function invalidateText():void
	{
		if (!invalidateTextFlag)
		{
			invalidateTextFlag = true;
			invalidateProperties();
		}
	}
	
	/**
	 * TODO: ASDOC Definition of validateText
	 */
	public function validateText():void
	{
		if (invalidateTextFlag)
		{
			commitText();
			invalidateTextFlag = false;
		}
	}
	
} // Class
} // Package