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

package dz.alkhwarizmix.winrak.mobile.facade
{

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixView;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.winrak.flex.facade.WinrakFacade;
import dz.alkhwarizmix.winrak.mobile.interfaces.IWinrakMobileFacade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٤ ربيع الثاني ١٤٣٧ (January 30, 2016)
 */
public class WinrakMobileFacade extends WinrakFacade
	implements IWinrakMobileFacade
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function WinrakMobileFacade(key:String)
	{
		super(key);
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
			LOG = AlKhwarizmixLog.getLogger(WinrakMobileFacade);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Login view startup
	 * 
	 * @param view a reference to the login view 
	 */  
	public function startupView(view:IAlKhwarizmixView):void
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	/**
	 * 
	 */  
	public function shutdownView(view:IAlKhwarizmixView):void
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
} // class
} // package
