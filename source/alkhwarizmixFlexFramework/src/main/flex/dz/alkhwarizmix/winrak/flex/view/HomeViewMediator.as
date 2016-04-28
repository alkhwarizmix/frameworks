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

import dz.alkhwarizmix.framework.flex.AlKhwarizmixConstants;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixView;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.utils.AlertUtil;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakMediator;

import org.puremvc.as3.multicore.interfaces.INotification;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٣ ربيع الثاني ١٤٣٧ (January 29, 2016)
 */
public class HomeViewMediator extends WinrakMediator
	implements IWinrakMediator
{
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The mediator name
	 */
	public static const NAME:String = "HomeViewMediator";
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function HomeViewMediator(viewComponent:Object = null)
	{
		super(NAME, viewComponent);
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
			LOG = AlKhwarizmixLog.getLogger(HomeViewMediator);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of homeView
	 */
	public final function get homeView():IAlKhwarizmixView
	{
		return viewComponent as IAlKhwarizmixView;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @inheritDoc
	 */
	override public function listNotificationInterests():Array
	{
		return [
			AlKhwarizmixConstants.REMOTE_SERVER_ERROR
		];
	}
	
	/**
	 *  @inheritDoc
	 */
	override protected function handleNotification_try(notif:INotification):void
	{
		super.handleNotification_try(notif);
		
		switch (notif.getName())
		{
			case AlKhwarizmixConstants.REMOTE_SERVER_ERROR:
			{
				handleRemoteServerError(notif.getBody());
				break;
			}
				
		} // switch
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of handleRemoteServerError
	 */
	public function handleRemoteServerError(notifBody:Object):void
	{
		logger.debug("handleRemoteServerError");
		var error:Object = notifBody.error.rootCause;
		new AlertUtil().showAlert(error.localizedMessage, "Remote Server Error: " + error.errorCode);
	}
	
} // class
} // package
