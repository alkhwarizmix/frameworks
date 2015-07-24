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

import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixBlazeDSGetDataCommand;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.winrak.flex.WinrakConstants;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakCommand;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakConfigProxy;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakFacade;
import dz.alkhwarizmix.winrak.flex.model.WinrakConfigProxy;

import org.puremvc.as3.multicore.patterns.facade.Facade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ رمضان ١٤٣٦ (July 11, 2015)
 */
public class WinrakBlazeDSGetDataCommand extends AlKhwarizmixBlazeDSGetDataCommand
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
			LOG = AlKhwarizmixLog.getLogger(WinrakBlazeDSGetDataCommand);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  amfURI
	//----------------------------------
	
	/**
	 *  @inheritDoc
	 */
	override public function get amfURI():String
	{
		return appConfigProxy.appURLPath + "messagebroker/amf";
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  appFacade
	//----------------------------------
	
	public final function get appFacade():IWinrakFacade
	{
		return Facade.getInstance(WinrakConstants.FACADE_NAME)
			as IWinrakFacade;
	}
	
	//----------------------------------
	//  appConfigProxy
	//----------------------------------
	
	public final function get appConfigProxy():IWinrakConfigProxy
	{
		return appFacade.retrieveProxy(WinrakConfigProxy.NAME)
			as IWinrakConfigProxy;
	}
	
} // class
} // package
