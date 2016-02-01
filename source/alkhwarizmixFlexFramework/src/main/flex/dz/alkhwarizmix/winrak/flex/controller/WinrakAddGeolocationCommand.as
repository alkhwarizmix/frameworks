////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٧ هجري، فارس بلحواس (Copyright 2016 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.winrak.flex.controller
{

import mx.collections.ArrayCollection;

import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakCommand;
import dz.alkhwarizmix.winrak.flex.model.GeolocationProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.facade.Facade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٤ ربيع الثاني ١٤٣٧ (January 30, 2016)
 */
public class WinrakAddGeolocationCommand extends WinrakSimpleCommand
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
			LOG = AlKhwarizmixLog.getLogger(WinrakAddGeolocationCommand);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  geolocationProxy
	//----------------------------------
	
	public final function get geolocationProxy():GeolocationProxy
	{
		return Facade.getInstance(GeolocationProxy.NAME)
			as GeolocationProxy;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overidden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of execute_try
	 */
	override protected function execute_try(notif:INotification):void
	{
		geolocationProxy.addDataItems(new ArrayCollection([notif.getBody().geolocation]));
	}
	
} // class
} // package
