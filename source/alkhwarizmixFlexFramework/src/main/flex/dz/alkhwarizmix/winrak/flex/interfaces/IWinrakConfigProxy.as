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

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ رمضان ١٤٣٦ (July 11, 2015)
 */
public interface IWinrakConfigProxy
{
	/**
	 */
	function get appURLPath():String;
	
	/**
	 */
	function get appParameters():Object;
	
	/**
	 */
	function get flashBuilderBuild():Boolean;
	
} // Interface
} // Package
