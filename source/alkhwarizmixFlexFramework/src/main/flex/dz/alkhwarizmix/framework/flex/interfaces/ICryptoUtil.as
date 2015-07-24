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

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٧ ربيع الأول ١٤٣٦ (December 28, 2014)
 */
public interface ICryptoUtil
{
	
	function decryptString(stringToDecrypt:String):String;
	function encryptString(stringToEncrypt:String):String;
	function getDecryptedVersion(encryptedObject:IEncryptable):IEncryptable;
	function getEncryptedVersion(objectToEncrypt:IEncryptable):IEncryptable;
	
} // Interface
} // Package
