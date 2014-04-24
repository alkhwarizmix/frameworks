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
import com.hurlant.crypto.symmetric.NullPad;
import com.hurlant.crypto.symmetric.PKCS5;
import com.hurlant.util.Base64;
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
	private var key:String = null;
	private var encType:String = "aes";
	private var modeType:String = "cbc";
	private var simple:Boolean = true;
	private var paddingType:String = "pkcs5";
	
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
		pEncType:String = "aes",
		pModeType:String = "cbc",
		pSimple:Boolean = true,
		pPaddingType:String = "pkcs5")
	{
		key = pKey;
		encType = pEncType;
		modeType = pModeType;
		simple = pSimple;
		paddingType = pPaddingType;		
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
		var kdata:ByteArray = Base64.decodeToByteArray(key);		
		var data:ByteArray = Hex.toArray(Hex.fromString(stringToEncrypt));
		
		var algo:String = (simple ? "simple-" : "") + encType + "-" + modeType;
		var pad:IPad = (paddingType == "pkcs5") ? new PKCS5 : new NullPad;
		
		var mode:ICipher = Crypto.getCipher(algo, kdata, pad);
		pad.setBlockSize(mode.getBlockSize());
		mode.encrypt(data);
		
		var result:String = Base64.encodeByteArray(data);
		return result;
	}
	
	/**
	 * decryptString
	 */
	public final function decryptString(stringToDecrypt:String):String
	{
		var kdata:ByteArray = Base64.decodeToByteArray(key);
		var data:ByteArray = Base64.decodeToByteArray(stringToDecrypt);
		
		var algo:String = (simple ? "simple-" : "") + encType + "-" + modeType;
		var pad:IPad = (paddingType == "pkcs5") ? new PKCS5 : new NullPad;
		
		var mode:ICipher = Crypto.getCipher(algo, kdata, pad);
		pad.setBlockSize(mode.getBlockSize());
		mode.decrypt(data);
		
		var result:String = Hex.toString(Hex.fromArray(data));
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
	
} // class
} // package