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
 *  @since  ١٣ رمضان ١٤٣٦ (June 30, 2015)
 */
public class CryptoUtilV2 implements ICryptoUtil
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
	public function CryptoUtilV2(
		pKey:String,
		pIV:String = null,
		encType:String = "aes-256",
		modeType:String = "cbc", // ecb, cbc, ofb
		simple:Boolean = false,
		paddingType:String = "pkcs5") // pkcs5
	{
		var keyData:ByteArray = getStringAsByteArray(pKey, 64);
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
			ivmode.IV = getStringAsByteArray(iv, 32);
		}
	}
	
	private function getStringAsByteArray(string:String, max:int):ByteArray
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
	 * encryptString
	 */
	public final function encryptString(stringToEncrypt:String):String
	{
		var result:String = stringToEncrypt;
		if (!(!stringToEncrypt))
		{
			var data:ByteArray = Base64.decodeToByteArray(Base64.encode(stringToEncrypt));
			cipher.encrypt(data);
			result = Base64.encodeByteArray(data);
		}
		return result;
	}
	
	/**
	 * decryptString
	 */
	public final function decryptString(stringToDecrypt:String):String
	{
		var result:String = stringToDecrypt;
		if (!(!stringToDecrypt))
		{
			var data:ByteArray = Base64.decodeToByteArray(stringToDecrypt);
			cipher.decrypt(data);
			result = Base64.decode(Base64.encodeByteArray(data));
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
	 * reverseString
	 */
	public final function reverseString(text:String):String
	{
		var result:String = null;
		if (text != null) {
			result = "";
			for (var i:int = text.length - 1; i >= 0; i--)
				result += text.charAt(i);
		}
		return result;
	}
	
	private function stringToBytes(string:String):ByteArray
	{
		var result:ByteArray = new ByteArray();
		result.writeMultiByte(string, "UTF8");
		result.position = 0;
		return result;
	}
	
	private function bytesToString(ba:ByteArray):String
	{
		ba.position = 0;
		var result:String = ba.readMultiByte(ba.length, "UTF8");
		return result;
	}
	
	/**
	 * encryptExternalizable
	 */
	public final function encryptExternalizable(externalizableToEncrypt:IExternalizable):String
	{
		var result:String = "";
		if (externalizableToEncrypt)
		{
			var data:ByteArray = new ByteArray();
			externalizableToEncrypt.writeExternal(data);
			if (data.length)
			{
				data.position = 0;
				cipher.encrypt(data);
				result = Base64.encodeByteArray(data);
			}
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
			var data:ByteArray = Base64.decodeToByteArray(base64StringToDecrypt);
			cipher.decrypt(data);
			if (data.length)
			{
				data.position = 0;
				result.readExternal(data);
			}
		}
		return result;
	}
	
} // class
} // package
