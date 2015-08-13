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
import dz.alkhwarizmix.framework.flex.model.RecordProxy;
import dz.alkhwarizmix.moqawalati.flex.MoqawalatiConstants;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiSimpleCommand;
import dz.alkhwarizmix.moqawalati.flex.interfaces.IMoqawalatiCommand;
import dz.alkhwarizmix.moqawalati.flex.model.MoqawalatiConfigProxy;
import dz.alkhwarizmix.moqawalati.flex.model.MoqawalatiCustomDataProxy;
import dz.alkhwarizmix.moqawalati.flex.model.MoqawalatiLoginUserProxy;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakApplication;

import org.puremvc.as3.multicore.interfaces.INotification;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٨ شوال ١٤٣٦ (July 24, 2015)
 */
public class WinrakStartupCommand extends MoqawalatiSimpleCommand
	implements IMoqawalatiCommand
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
	//  Overriden methods
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
		facade.registerProxy(new MoqawalatiConfigProxy(
			getConfigDico(app.parameters)));
		facade.registerProxy(new MoqawalatiCustomDataProxy());
		facade.registerProxy(new MoqawalatiLoginUserProxy());
		facade.registerProxy(new RecordProxy());
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
		sendNotification(MoqawalatiConstants.STARTUP_COMPLETE);
	}
	
} // class
} // package
