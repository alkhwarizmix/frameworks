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

package dz.alkhwarizmix.winrak.mobile.interfaces
{

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixView;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakFacade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٤ ربيع الثاني ١٤٣٧ (January 30, 2016)
 */
public interface IWinrakMobileFacade extends IWinrakFacade
{
	
	function startupView(view:IAlKhwarizmixView):void;
	function shutdownView(view:IAlKhwarizmixView):void;
	
} // Interface
} // Package
