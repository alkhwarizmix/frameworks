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

import mx.collections.ArrayCollection;
import mx.utils.ObjectUtil;

import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.EncryptionVO;
import dz.alkhwarizmix.framework.flex.interfaces.ICryptoUtil;
import dz.alkhwarizmix.framework.flex.interfaces.ICryptoUtilFactory;
import dz.alkhwarizmix.framework.flex.interfaces.IEncryptable;
import dz.alkhwarizmix.framework.flex.interfaces.IEncryptableList;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٣ رمضان ١٤٣٦ (June 30, 2015)
 */
public class CryptoUtilFactory implements ICryptoUtilFactory
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function CryptoUtilFactory()
	{
		// NOOP
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * getDecryptedVersion
	 */
	public final function getDecryptedVersion(encryptedObject:Object):Object
	{
		var result:Object = ObjectUtil.clone(encryptedObject) as Object;
		decryptObject(result);
		return result;
	}
	
	/**
	 * decryptObject
	 */
	private function decryptObject(encryptedObject:Object):void
	{
		if (encryptedObject is IEncryptable)
		{
			var encryptableObject:IEncryptable = encryptedObject as IEncryptable;
			encryptableObject.decrypt(getCryptoUtil(encryptableObject.encryption));
		}
		else if (encryptedObject is IEncryptableList)
		{
			var encryptableList:IEncryptableList = encryptedObject as IEncryptableList;
			for each (var obj1:Object in encryptableList.list)
			{
				decryptObject(obj1);
			}
		}
		else if ((encryptedObject is Array) || (encryptedObject is ArrayCollection))
		{
			for each (var obj2:Object in encryptedObject)
			{
				decryptObject(obj2);
			}
		}
	}
	
	/**
	 * getEncryptedVersion
	 */
	public final function getEncryptedVersion(objectToEncrypt:Object):Object
	{
		var result:Object = ObjectUtil.clone(objectToEncrypt);
		encryptObject(result);
		return result;
	}
	
	/**
	 * encryptObject
	 */
	private function encryptObject(objectToEncrypt:Object):void
	{
		if (objectToEncrypt is IEncryptable)
		{
			var encryptableObject:IEncryptable = objectToEncrypt as IEncryptable;
			encryptableObject.encrypt(getCryptoUtil(encryptableObject.encryption));
		}
		else if (objectToEncrypt is IEncryptableList)
		{
			var encryptableList:IEncryptableList = objectToEncrypt as IEncryptableList;
			for each (var obj1:Object in encryptableList.list)
			{
				encryptObject(obj1);
			}
		}
		else if ((objectToEncrypt is Array) || (objectToEncrypt is ArrayCollection))
		{
			for each (var obj2:Object in objectToEncrypt)
			{
				encryptObject(obj2);
			}
		}
	}
	
	/**
	 * encryptObject
	 */
	private function getCryptoUtil(encryption:EncryptionVO):ICryptoUtil
	{
		var result:ICryptoUtil = null;
		if (!encryption || !encryption.encryptionId)
			result = new CryptoUtil("%%KeyForTest$#09");
		else if (encryption.encryptionId == "CryptoUtilV2")
			result = new CryptoUtilV2("A%B1C%D2EKF3GeH4IyJ5KFL6MoN7OrP8QTR9SeT0UsV1WtX2Y$Z3#40596", "90#$tseTroFyeK%%");
		else if (encryption.encryptionId.charAt(0) == "3")
			result = new CryptoUtilV3("A%B1C%D2EKF3GeH4IyJ5KFL6MoN7OrP8QTR9SeT0UsV1WtX2Y$Z3#40596", "90#$tseTroFyeK%%");
		return result;
	}
	
} // class
} // package
