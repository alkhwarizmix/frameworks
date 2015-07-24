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

package dz.alkhwarizmix.framework.flex.utils
{

import com.hurlant.crypto.Crypto;
import com.hurlant.crypto.symmetric.ICipher;
import com.hurlant.crypto.symmetric.IPad;
import com.hurlant.crypto.symmetric.IVMode;
import com.hurlant.crypto.symmetric.NullPad;
import com.hurlant.crypto.symmetric.PKCS5;
import com.hurlant.util.Base64;

import flash.utils.ByteArray;
import flash.utils.IExternalizable;

import mx.utils.ObjectUtil;

import dz.alkhwarizmix.framework.flex.interfaces.ICryptoUtil;
import dz.alkhwarizmix.framework.flex.interfaces.IEncryptable;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٣ رمضان ١٤٣٦ (July 10, 2015)
 */
public class CryptoUtilV3 implements ICryptoUtil
{
	private var cipher:ICipher = null;
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function CryptoUtilV3(
		pKey:String,
		pIV:String = null,
		encType:String = "aes-256",
		modeType:String = "cbc", // ecb, cbc, ofb
		simple:Boolean = false,
		paddingType:String = "pkcs5") // pkcs5
	{
		var keyData:ByteArray = getKeyStringAsByteArray(pKey, 64);
		var algo:String = (simple ? "simple-" : "") + encType + "-" + modeType;
		var pad:IPad = (paddingType == "pkcs5") ? new PKCS5 : new NullPad;
		cipher = Crypto.getCipher(algo, keyData, pad);
		pad.setBlockSize(cipher.getBlockSize());
		if (cipher is IVMode)
		{
			var ivmode:IVMode = cipher as IVMode;
			var iv:String = (pIV)
				? pIV
				: (pKey.length > 32) ? pKey.substr(0, 32) : pKey.substr(0, 32);
			ivmode.IV = getKeyStringAsByteArray(iv, 32);
		}
	}
	
	private function getKeyStringAsByteArray(string:String, max:int):ByteArray
	{
		var result:ByteArray = new ByteArray();
		result.writeUTF(string);
		if (result.length > max)
			result.length = max;
		result.position = 0;
		return result;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * decryptString
	 */
	public final function decryptByteArray(base64StringToDecrypt:String):ByteArray
	{
		var result:ByteArray = !(!base64StringToDecrypt)
			? Base64.decodeToByteArray(base64StringToDecrypt)
			: new ByteArray();
		if (result.length)
		{
			cipher.decrypt(result);
			result.position = 0;
		}
		return result;
	}
	
	/**
	 * decryptString
	 */
	public final function decryptString(base64StringToDecrypt:String):String
	{
		var result:String = base64StringToDecrypt;
		if (!(!base64StringToDecrypt))
		{
			var ba:ByteArray = decryptByteArray(base64StringToDecrypt);
			ba.position = 0;
			result = ba.readUTFBytes(ba.length);
		}
		return result;
	}
	
	/**
	 * encryptByteArray
	 */
	public final function encryptByteArray(baToEncrypt:ByteArray):String
	{
		var result:String = "";
		if (baToEncrypt && baToEncrypt.length) {
			baToEncrypt.position = 0;
			cipher.encrypt(baToEncrypt);
			baToEncrypt.position = 0;
			result = Base64.encodeByteArray(baToEncrypt);
		}
		return result;
	}
	
	/**
	 * encryptString
	 */
	public final function encryptString(stringToEncrypt:String):String
	{
		var result:String = stringToEncrypt;
		if (!(!stringToEncrypt))
		{
			var ba:ByteArray = new ByteArray();
			ba.writeUTFBytes(stringToEncrypt);
			ba.position = 0;
			result = encryptByteArray(ba);
		}
		return result;
	}
	
	/**
	 * getEncryptedVersion
	 */
	public final function getEncryptedVersion(objectToEncrypt:IEncryptable):IEncryptable
	{
		var result:IEncryptable = ObjectUtil.clone(objectToEncrypt) as IEncryptable;
		encryptObject(result);
		return result;
	}
	
	/**
	 * encryptObject
	 */
	private function encryptObject(objectToEncrypt:IEncryptable):void
	{
		objectToEncrypt.encrypt(this);
	}
	
	/**
	 * getDecryptedVersion
	 */
	public final function getDecryptedVersion(encryptedObject:IEncryptable):IEncryptable
	{
		var result:IEncryptable = ObjectUtil.clone(encryptedObject) as IEncryptable;
		decryptObject(result);
		return result;
	}
	
	/**
	 * decryptObject
	 */
	private function decryptObject(encryptedObject:IEncryptable):void
	{
		encryptedObject.decrypt(this);
	}
	
	/**
	 * encryptExternalizable
	 */
	public final function encryptExternalizable(externalizableToEncrypt:IExternalizable):String
	{
		var result:String = "";
		if (externalizableToEncrypt)
		{
			var ba:ByteArray = new ByteArray();
			externalizableToEncrypt.writeExternal(ba);
			result = encryptByteArray(ba);
		}
		return result;
	}
	
	/**
	 * decryptExternalizable
	 */
	public final function decryptExternalizable(base64StringToDecrypt:String, clazz:Class):IExternalizable
	{
		var result:IExternalizable = new clazz();
		if (!(!base64StringToDecrypt))
		{
			var data:ByteArray = decryptByteArray(base64StringToDecrypt);
			if (data.length)
				result.readExternal(data);
		}
		return result;
	}
	
} // class
} // package
