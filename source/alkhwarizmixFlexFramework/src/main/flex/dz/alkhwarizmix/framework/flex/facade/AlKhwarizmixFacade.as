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

package dz.alkhwarizmix.framework.flex.facade
{

import flash.utils.Dictionary;

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixTypeError;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixCommand;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixFacade;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

import org.puremvc.as3.multicore.patterns.facade.Facade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٧ شوال ١٤٣٤ (August 24, 2013)
 */
public class AlKhwarizmixFacade extends Facade
	implements IAlKhwarizmixFacade
{
	include "../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixFacade(key:String)
	{
		super(key);
		
		if (AlKhwarizmixLog.isLogLevelAll)
			logger.debug(AlKhwarizmixLog.CONSTRUCTOR);
	}
	
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
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixFacade);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  commandsToRegister
	//----------------------------------
	
	private var _commandsToRegister:Dictionary = null;
	private final function get commandsToRegister():Dictionary
	{
		if (!_commandsToRegister)
		{
			_commandsToRegister = new Dictionary(true);
			initCommandsToRegister();
		}
		
		return _commandsToRegister;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Register Commands with the Controller 
	 */
	override protected function initializeController():void 
	{
		super.initializeController();
		
		unregisterCommands();
		registerCommands();
	}
	
	/**
	 * @inheritDoc
	 * 
	 * Make sure the command implements IAlKhwarizmixCommand
	 */
	override public function registerCommand(
		notificationName:String, commandClassRef:Class):void
	{
		if (new commandClassRef() is IAlKhwarizmixCommand)
			super.registerCommand(notificationName, commandClassRef);
		else
			throw new AlKhwarizmixTypeError();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Useful for tests to validate that command is registered with the right Class
	 */
	public final function getCommandClassWithKey(key:String):Class
	{
		return commandsToRegister[key];
	}
	
	/**
	 * Should be overrided to add commands to register
	 */
	protected function initCommandsToRegister():void
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	/**
	 * Used in overrided initCommandsToRegister to add commands to register 
	 */
	protected final function addCommandToRegister(
		commandName:String, commandClass:Class):void
	{
		_commandsToRegister[commandName] = commandClass;
	}
	
	/**
	 * @private
	 */
	private function registerCommands():void
	{
		logger.debug("registerCommands");
		
		for (var key:String in commandsToRegister)
		{
			registerCommand(key, getCommandClassWithKey(key));
		}
	}
	
	/**
	 * Application or Module startup
	 * 
	 * @param app a reference to the application or module component 
	 */  
	public function startup(app:*):void
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	/**
	 * @private
	 */
	private function unregisterCommands():void
	{
		for (var key:String in commandsToRegister)
		{
			removeCommand(key);
		}
	}
	
} // class
} // package
