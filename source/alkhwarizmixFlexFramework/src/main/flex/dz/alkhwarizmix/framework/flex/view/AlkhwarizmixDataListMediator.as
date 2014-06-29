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

package dz.alkhwarizmix.framework.flex.view
{

import mx.collections.ArrayCollection;

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixMediator;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixProxy;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.view.components.AlKhwarizmixDataListCanvas;

import org.puremvc.as3.multicore.interfaces.INotification;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class AlkhwarizmixDataListMediator extends AlKhwarizmixMediator
	implements IAlKhwarizmixMediator
{
	include "../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Constructor.
	 */
	public function AlkhwarizmixDataListMediator(
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
		getLogger(AlkhwarizmixDataListMediator);
	
	override protected function get logger():IAlKhwarizmixLogger { return LOG; }
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of dataListCanvas
	 */
	public final function get dataListCanvas():AlKhwarizmixDataListCanvas
	{
		return viewComponent as AlKhwarizmixDataListCanvas;
	}
	
	/**
	 * TODO: ASDOC Definition of proxy
	 */
	public final function get proxy():IAlKhwarizmixProxy
	{
		return facade.retrieveProxy(proxyName) as IAlKhwarizmixProxy;
	}
	
	/**
	 * TODO: ASDOC Definition of proxyName
	 */
	public function get proxyName():String
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	/**
	 * TODO: ASDOC Definition of proxyChangedNoteName
	 */
	public function get proxyChangedNoteName():String
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
	override public function listNotificationInterests():Array
	{
		return [
			proxyChangedNoteName
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
			case proxyChangedNoteName:
			{
				handleProxyChanged();
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
	 * TODO: ASDOC Definition of handleProxyChanged
	 */
	public function handleProxyChanged():void
	{
		dataListCanvas.dataProvider = proxy.getData() as ArrayCollection;
	}
	
} // class
} // package
