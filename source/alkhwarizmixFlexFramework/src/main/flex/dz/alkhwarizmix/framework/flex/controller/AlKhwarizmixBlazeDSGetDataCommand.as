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
	import mx.rpc.AbstractOperation;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
	import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixCommand;
	import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
	import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
	import dz.alkhwarizmix.framework.flex.rpc.remoting.AlKhwarizmixRemoteObject;
	
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
			
			ro = new AlKhwarizmixRemoteObject(destination);
			ro.channelSet = getChannelSet();
			ro.addEventListener(ResultEvent.RESULT, ro_resultHandler);
			ro.addEventListener(FaultEvent.FAULT, ro_faultHandler);
		}
		
		/**
		 * @private
		 */
		private function getChannelSet():ChannelSet
		{
			var result:ChannelSet = new ChannelSet(); 
			result.addChannel(new AMFChannel("myAmf", amfURI));
			return result;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Logger
		//
		//--------------------------------------------------------------------------
		
		private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
			getLogger(AlKhwarizmixBlazeDSGetDataCommand);
		
		override protected function get log():IAlKhwarizmixLogger { return LOG; }
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * TODO: ASDOC Definition of ro
		 */
		private var ro:AlKhwarizmixRemoteObject = null;
		
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
			operation.send(null);
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
			log.error("ro_faultHandler: {0}", event.fault.faultString);
		}
		
		/**
		 * @private
		 */
		private function ro_resultHandler(event:ResultEvent):void
		{
			log.debug("ro_resultHandler");
			
			proxy.setData(event.result);
		}
		
	} // class
} // package