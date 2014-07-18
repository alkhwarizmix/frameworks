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

package dz.alkhwarizmix.framework.flex.modules
{

import flash.net.registerClassAlias;

import mx.collections.ArrayCollection;
import mx.messaging.messages.CommandMessage;
import mx.messaging.messages.ErrorMessage;
import mx.messaging.messages.RemotingMessage;
import mx.utils.ObjectProxy;

import spark.modules.Module;

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixModule;
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
public class AlKhwarizmixModule extends Module
	implements IAlKhwarizmixModule
{
	include "../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The Logger
	 */
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(AlKhwarizmixModule);
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixModule()
	{
		super();
		
		registerNeededClasses();
	}
	
	/**
	 * TODO: ASDOC Definition of registerNeededClasses
	 */
	private function registerNeededClasses():void
	{
		registerClassAlias("flex.messaging.messages.ErrorMessage",
			ErrorMessage);
		registerClassAlias("flex.messaging.messages.CommandMessage",
			CommandMessage);
		registerClassAlias("flex.messaging.messages.RemotingMessage",
			RemotingMessage);
		/*
		registerClassAlias("flex.messaging.messages.AcknowledgeMessage ", AcknowledgeMessage);
		registerClassAlias("DSC", CommandMessageExt);
		registerClassAlias("DSK", AcknowledgeMessageExt);
		registerClassAlias("flex.messaging.config.ConfigMap", ConfigMap);
		*/
		registerClassAlias("flex.messaging.io.ArrayCollection",
			ArrayCollection);
		registerClassAlias("flex.messaging.io.ObjectProxy",
			ObjectProxy);
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
	
	/**
	 * @copy dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixModule#facadeName
	 */
	public function get facadeName():String
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @copy dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixModule#facadeShutdown
	 */
	public function facadeShutdown():void
	{
		Facade.removeCore(facadeName);
	}
	
	/**
	 * TODO: ASDOC Definition of facadeStartup
	 */
	protected function facadeStartup():void
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
} // class
} // package
