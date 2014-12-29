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

package dz.alkhwarizmix.framework.flex.controller
{

import mx.messaging.ChannelSet;
import mx.messaging.channels.AMFChannel;
import mx.messaging.channels.SecureAMFChannel;
import mx.rpc.AbstractOperation;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

import dz.alkhwarizmix.framework.flex.AlKhwarizmixConstants;
import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixCommand;
import dz.alkhwarizmix.framework.flex.interfaces.ICryptoUtil;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.rpc.remoting.AlKhwarizmixRemoteObject;
import dz.alkhwarizmix.framework.flex.utils.CryptoUtil;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.IProxy;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٧ شوال ١٤٣٤ (August 23, 2013)
 */
public class AlKhwarizmixBlazeDSGetDataCommand extends AlKhwarizmixWebGetDataCommand
	implements IAlKhwarizmixCommand
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
	public function AlKhwarizmixBlazeDSGetDataCommand()
	{
		super();
	}
	
	/**
	 * @private
	 */
	protected function newRemoteObject():AlKhwarizmixRemoteObject
	{
		return new AlKhwarizmixRemoteObject(destination);
	}
	
	/**
	 * @private
	 */
	private function getChannelSet():ChannelSet
	{
		var result:ChannelSet = new ChannelSet();
		result.addChannel(newAMFChannel());
		return result;
	}
	
	/**
	 * @private
	 */
	protected final function newAMFChannel():AMFChannel
	{
		var result:AMFChannel = isSecureConnexion
			? new SecureAMFChannel("myAmf", amfURI)
			: new AMFChannel("myAmf", amfURI);
		return result;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------
	
	private static var LOG:IAlKhwarizmixLogger = null;
	
	override protected function get logger():IAlKhwarizmixLogger
	{
		if (!LOG)
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixBlazeDSGetDataCommand);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of ro
	 */
	private var _ro:AlKhwarizmixRemoteObject = null;
	
	private function get ro():AlKhwarizmixRemoteObject
	{
		if (!_ro)
		{
			_ro = newRemoteObject();
			_ro.channelSet = getChannelSet();
			_ro.addEventListener(ResultEvent.RESULT, ro_resultHandler);
			_ro.addEventListener(FaultEvent.FAULT, ro_faultHandler);
		}
		return _ro;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  amfURI
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of amfURI
	 */
	public function get amfURI():String
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	//----------------------------------
	//  cryptoUtil
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of cryptoUtil
	 */
	public function get cryptoUtil():ICryptoUtil
	{
		return new CryptoUtil("%%KeyForTest$#09");
	}
	
	//----------------------------------
	//  isSecureConnexion
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of isSecureConnexion
	 */
	public final function get isSecureConnexion():Boolean
	{
		return (amfURI.indexOf("https") == 0);
	}
	
	//----------------------------------
	//  operationName
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of operationName
	 */
	public function get operationName():String
	{
		throw new AlKhwarizmixMissingImplError();		
	}
	
	//----------------------------------
	//  proxy
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of proxy
	 */
	public final function get proxy():IProxy
	{
		return facade.retrieveProxy(proxyName);
	}
	
	//----------------------------------
	//  proxyName
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of proxyName
	 */
	public function get proxyName():String
	{
		throw new AlKhwarizmixMissingImplError();		
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @inheritDoc
	 */
	override protected function execute_catch_error(
		notif:INotification, error:Error):void
	{
		super.execute_catch_error(notif, error);
	}
	
	/**
	 *  @inheritDoc
	 */
	override protected function execute_finally(notif:INotification):void
	{
		super.execute_finally(notif);
	}
	
	/**
	 *  @inheritDoc
	 */
	override protected function execute_try(notif:INotification):void
	{
		super.execute_try(notif);
		
		var operation:AbstractOperation = ro.getOperation(operationName);
		operation.send.apply(operation, cryptoUtil.getEncryptedVersion(
			notif.getBody().operationParams));
	}
	
	//--------------------------------------------------------------------------
	//
	//  Event handlers
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private function ro_faultHandler(event:FaultEvent):void
	{
		logger.error("ro_faultHandler: {0}", event.fault.faultString);
		
		facade.sendNotification(AlKhwarizmixConstants.REMOTE_SERVER_ERROR,
			{
				error:event.fault
			});
	}
	
	/**
	 * @private
	 */
	private function ro_resultHandler(event:ResultEvent):void
	{
		logger.debug("ro_resultHandler");
		
		proxy.setData(cryptoUtil.getDecryptedVersion(event.result));
	}
	
} // class
} // package
