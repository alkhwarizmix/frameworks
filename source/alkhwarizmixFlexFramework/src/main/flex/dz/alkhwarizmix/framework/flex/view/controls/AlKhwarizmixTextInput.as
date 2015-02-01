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

import spark.components.TextInput;

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
public class AlKhwarizmixTextInput extends TextInput
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
	public function AlKhwarizmixTextInput()
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
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixTextInput);
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
	 *  commitPrompt() method called.
	 */
	private var invalidatePromptFlag:Boolean = false;
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  promptResKey
	//----------------------------------
	
	private var _promptResKey:String = null;
	public function get promptResKey():String { return _promptResKey; }
	
	public function set promptResKey(value:String):void
	{
		if (_promptResKey == value)
			return;
		_promptResKey = value;
		invalidatePrompt();
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
		invalidatePrompt();
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
		validatePrompt();
		
		super.commitProperties();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of commitPrompt
	 */
	public function commitPrompt():void
	{
		if (promptResKey)
		{
			var s:String = localize(promptResKey);
			prompt = localize(promptResKey);
		}
	}
	
	/**
	 * TODO: ASDOC Definition of invalidatePrompt
	 */
	public function invalidatePrompt():void
	{
		if (!invalidatePromptFlag)
		{
			invalidatePromptFlag = true;
			invalidateProperties();
		}
	}
	
	/**
	 * TODO: ASDOC Definition of validatePrompt
	 */
	public function validatePrompt():void
	{
		if (invalidatePromptFlag)
		{
			commitPrompt();
			invalidatePromptFlag = false;
		}
	}
	
} // Class
} // Package
