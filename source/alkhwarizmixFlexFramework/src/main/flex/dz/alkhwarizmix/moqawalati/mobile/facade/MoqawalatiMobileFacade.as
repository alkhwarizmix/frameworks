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

package dz.alkhwarizmix.moqawalati.mobile.facade
{

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixView;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.moqawalati.flex.facade.MoqawalatiFacade;
import dz.alkhwarizmix.moqawalati.mobile.interfaces.IMoqawalatiMobileFacade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٦ شوال ١٤٣٦ (August 01, 2015)
 */
public class MoqawalatiMobileFacade extends MoqawalatiFacade
	implements IMoqawalatiMobileFacade
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function MoqawalatiMobileFacade(key:String)
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
			LOG = AlKhwarizmixLog.getLogger(MoqawalatiMobileFacade);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden methods
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
