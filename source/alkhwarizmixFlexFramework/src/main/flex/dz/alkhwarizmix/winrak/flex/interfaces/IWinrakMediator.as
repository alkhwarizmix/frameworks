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

package dz.alkhwarizmix.winrak.flex.interfaces
{

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixConfigProxy;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixMediator;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakFacade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٣ ربيع الثاني ١٤٣٧ (January 29, 2016)
 */
public interface IWinrakMediator extends IAlKhwarizmixMediator
{
	/**
	 */
	function get appFacade():IWinrakFacade;
	
	/**
	 */
	function get appConfigProxy():IAlKhwarizmixConfigProxy;
	
} // Interface
} // Package
