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

package dz.alkhwarizmix.winrak.flex.view
{

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixConfigProxy;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixCustomDataProxy;
import dz.alkhwarizmix.framework.flex.view.AlKhwarizmixMediator;
import dz.alkhwarizmix.winrak.flex.WinrakConstants;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakFacade;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakMediator;
import dz.alkhwarizmix.winrak.flex.model.WinrakConfigProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.facade.Facade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٣ ربيع الثاني ١٤٣٧ (January 29, 2016)
 */
public class WinrakMediator extends AlKhwarizmixMediator
	implements IWinrakMediator
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function WinrakMediator(
		mediatorName:String = null, viewComponent:Object = null)
	{
		super(mediatorName, viewComponent);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------
	
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(WinrakMediator);
	
	override protected function get logger():IAlKhwarizmixLogger { return LOG; }
	
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
	
	public final function get appConfigProxy():IAlKhwarizmixConfigProxy
	{
		return appFacade.retrieveProxy(WinrakConfigProxy.NAME)
			as IAlKhwarizmixConfigProxy;
	}
	
	//----------------------------------
	//  appCustomDataProxy
	//----------------------------------
	
	public final function get appCustomDataProxy():AlKhwarizmixCustomDataProxy
	{
		return appFacade.retrieveProxy(AlKhwarizmixCustomDataProxy.NAME)
			as AlKhwarizmixCustomDataProxy;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @inheritDoc
	 */
	override protected function handleNotification_catch_error(
		notif:INotification, error:Error):void
	{
		super.handleNotification_catch_error(notif, error);
	}
	
	/**
	 *  @inheritDoc
	 */
	override protected function handleNotification_finally(
		notif:INotification):void
	{
		super.handleNotification_finally(notif);
	}
	
	/**
	 *  @inheritDoc
	 */
	override protected function handleNotification_try(
		notif:INotification):void
	{
		super.handleNotification_try(notif);
	}
	
} // class
} // package
