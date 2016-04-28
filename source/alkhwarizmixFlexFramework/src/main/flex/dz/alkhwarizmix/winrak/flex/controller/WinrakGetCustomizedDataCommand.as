////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٦ هجري، فارس بلحواس (Copyright 2015 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.winrak.flex.controller
{

import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixCustomDataProxy;
import dz.alkhwarizmix.framework.flex.rpc.remoting.AlKhwarizmixRemoteObject;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakCommand;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٤ شوال ١٤٣٦ (July 20, 2015)
 */
public class WinrakGetCustomizedDataCommand extends WinrakBlazeDSGetDataCommand
	implements IWinrakCommand
{
	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------
	
	private static var LOG:IAlKhwarizmixLogger = null;
	
	override protected function get logger():IAlKhwarizmixLogger
	{
		if (!LOG)
			LOG = AlKhwarizmixLog.getLogger(WinrakGetCustomizedDataCommand);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function WinrakGetCustomizedDataCommand()
	{
		super();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @inheritDoc
	 */
	override public function get destination():String
	{
		return "customizerService";
	}
	
	/**
	 *  @inheritDoc
	 */
	override public function get operationName():String
	{
		return "getCustomData";		
	}
	
	/**
	 *  @inheritDoc
	 */
	override public function get proxyName():String
	{
		return AlKhwarizmixCustomDataProxy.NAME;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	override protected function newRemoteObject():AlKhwarizmixRemoteObject
	{
		var result:AlKhwarizmixRemoteObject = super.newRemoteObject();
		result.showBusyCursor = false;
		return result;
	}
	
} // class
} // package
