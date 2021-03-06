////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٦ هجري، فارس بلحواس (Copyright 2014 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.framework.flex.interfaces
{

import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.EncryptionVO;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٧ ربيع الأول ١٤٣٦ (December 28, 2014)
 */
public interface IEncryptable
{
	
	function get encryption():EncryptionVO;
	
	function decrypt(cryptoUtil:ICryptoUtil):void;
	function encrypt(cryptoUtil:ICryptoUtil):void;	
	
} // Interface
} // Package
