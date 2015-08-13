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

package dz.alkhwarizmix.moqawalati.mobile.interfaces
{

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixView;
import dz.alkhwarizmix.moqawalati.flex.interfaces.IMoqawalatiFacade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٦ شوال ١٤٣٦ (August 01, 2015)
 */
public interface IMoqawalatiMobileFacade extends IMoqawalatiFacade
{
	
	function startupView(view:IAlKhwarizmixView):void;
	function shutdownView(view:IAlKhwarizmixView):void;
	
} // Interface
} // Package
