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

package dz.alkhwarizmix.winrak.flex.interfaces
{

import dz.alkhwarizmix.winrak.flex.view.containers.WinrakCanvas;
import dz.alkhwarizmix.winrak.flex.view.containers.WinrakHBox;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٥ رمضان ١٤٣٦ (July 12, 2015)
 */
public interface IWinrakApplication
{
	function get parameters():Object;
	function get mainCanvas():WinrakCanvas;
	function get mainControlBar():WinrakHBox;
	
} // Interface
} // Package
