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

import flash.utils.Dictionary;

import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixCustomDataProxy;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixLoginUserProxy;
import dz.alkhwarizmix.framework.flex.model.RecordProxy;
import dz.alkhwarizmix.winrak.flex.WinrakConstants;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakApplication;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakCommand;
import dz.alkhwarizmix.winrak.flex.model.GeolocationProxy;
import dz.alkhwarizmix.winrak.flex.model.WinrakConfigProxy;

import org.puremvc.as3.multicore.interfaces.INotification;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٨ شوال ١٤٣٦ (July 24, 2015)
 */
public class WinrakStartupCommand extends WinrakSimpleCommand
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
			LOG = AlKhwarizmixLog.getLogger(WinrakStartupCommand);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Register the Proxies and Mediators.
	 * 
	 * Get the View Components for the Mediators from the app,
	 * which passed a reference to itself on the notification.
	 */
	override protected function execute_try(notif:INotification):void	
	{
		var app:IWinrakApplication = notif.getBody() as IWinrakApplication;
		
		// REGISTER PROXIES FIRST
		registerProxies(app);
		
		// THEN MEDIATORS
		registerMediators(app);
		
		sendNotifications();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of registerMediators
	 */
	private function registerMediators(app:IWinrakApplication):void
	{
		// NOOP
	}
	
	/**
	 * TODO: ASDOC Definition of registerProxies
	 */
	private function registerProxies(app:IWinrakApplication):void
	{
		facade.registerProxy(new WinrakConfigProxy(
			getConfigDico(app.parameters)));
		facade.registerProxy(new AlKhwarizmixCustomDataProxy());
		facade.registerProxy(new AlKhwarizmixLoginUserProxy());
		facade.registerProxy(new RecordProxy());
		facade.registerProxy(new GeolocationProxy());
	}
	
	/**
	 * @private
	 */
	private function getConfigDico(appParameters:Object):Dictionary
	{
		var result:Dictionary = new Dictionary();
		result["appParameters"] = appParameters;
		return result;
	}
	
	/**
	 * TODO: ASDOC Definition of sendNotifications
	 */
	private function sendNotifications():void
	{
		sendNotification(WinrakConstants.STARTUP_COMPLETE);
	}
	
} // class
} // package
