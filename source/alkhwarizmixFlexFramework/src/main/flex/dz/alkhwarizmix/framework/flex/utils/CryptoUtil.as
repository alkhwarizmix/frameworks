////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٥ هجري، فارس بلحواس (Copyright 2014 Fares Belhaouas)  
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
import com.hurlant.util.Hex;

import flash.utils.ByteArray;

import mx.utils.ObjectUtil;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٣ جمادى الأول ١٤٣٥ (March 13, 2014)
 */
public class CryptoUtil
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
	public function CryptoUtil(
		pKey:String,
		encType:String = "aes-256",
		modeType:String = "cbc", // ecb, cbc, ofb
		simple:Boolean = false,
		paddingType:String = "pkcs5") // pkcs5
	{
		var pHexKey:String = stringToHex(pKey);
		pHexKey = pHexKey.substr(0, 64);
		var pHexIV:String = pHexKey.substr(0, 32);
		var keyData:ByteArray = Hex.toArray(pHexKey);
		var algo:String = (simple ? "simple-" : "") + encType + "-" + modeType;
		var pad:IPad = (paddingType == "pkcs5") ? new PKCS5 : new NullPad;
		cipher = Crypto.getCipher(algo, keyData, pad);
		pad.setBlockSize(cipher.getBlockSize());
		if (cipher is IVMode)
		{
			var ivmode:IVMode = cipher as IVMode;
			ivmode.IV = Hex.toArray(pHexIV);
		}
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
		var data:ByteArray = Hex.toArray(stringToHex(stringToEncrypt));
		
		cipher.encrypt(data);
		
		var result:String = Hex.fromArray(data);
		return result;
	}
	
	/**
	 * stringToHex
	 */
	public final function stringToHex(arg:String):String
	{
		var result:String = Hex.fromString(arg);
		return result;
	}
	
	/**
	 * decryptString
	 */
	public final function decryptString(hexStringToDecrypt:String):String
	{
		var data:ByteArray = Hex.toArray(hexStringToDecrypt);
		
		cipher.decrypt(data);
		
		var result:String = hexToString(Hex.fromArray(data));
		return result;
	}
	
	/**
	 * stringToHex
	 */
	public final function hexToString(arg:String):String
	{
		var result:String = Hex.toString(arg);
		return result;
	}
	
	/**
	 * getEncryptedVersion
	 */
	public final function getEncryptedVersion(objectToEncrypt:Object):Object
	{
		var result:Object = ObjectUtil.clone(objectToEncrypt);
		return result;
	}
	
	/**
	 * getDecryptedVersion
	 */
	public final function getDecryptedVersion(encryptedObject:Object):Object
	{
		var result:Object = ObjectUtil.clone(encryptedObject) as Object;
		return result;
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
	
} // class
} // package
